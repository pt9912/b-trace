# Architektur: b-trace

**Projektname:** b-trace  
**System:** Incident- & Replay-System (IRS)  
**Dokumenttyp:** Architekturbeschreibung  
**Version:** 0.1.0  
**Status:** Entwurf  
**Bezug:** [Lastenheft](lastenheft.md)

---

## 1. Zweck

Dieses Dokument beschreibt die technische Zielarchitektur von `b-trace`.
Es uebersetzt das Lastenheft in Schichten, Komponenten, Ports, Adapter,
Datenfluesse und Betriebsgrenzen.

Das Dokument ergaenzt das Lastenheft. Anforderungen bleiben im
Lastenheft normativ; Architekturentscheidungen und technische
Leitplanken werden hier nachvollziehbar gemacht.

---

## 2. Architekturprinzipien

| Kennung | Prinzip | Bezug |
| ------- | ------- | ----- |
| AR-P-001 | Hexagonale Architektur mit klaren Ports und Adaptern | ARC-001..003 |
| AR-P-002 | Domäne bleibt frei von Framework-, Datenbank- und Messaging-Abhängigkeiten | CC-003, ARCHTEST-004 |
| AR-P-003 | Replay ist eine privilegierte, auditpflichtige Operation | [F-REP-006..012](lastenheft.md), [F-SEC-006](lastenheft.md) |
| AR-P-004 | Produktive Replays sind standardmäßig blockiert, bis Whitelist und Freigabe greifen | [Q-SEC-005](lastenheft.md) |
| AR-P-005 | Datenschutz und Maskierung liegen vor Persistenz und Replay-Auswertung | [F-DAT-001..007](lastenheft.md) |
| AR-P-006 | Observability ist Bestandteil jedes fachlichen Workflows | [F-OBS-001..005](lastenheft.md) |
| AR-P-007 | Infrastruktur bleibt austauschbar über Adapter | [Q-MNT-004](lastenheft.md), NFQ-005 |

---

## 3. Systemkontext

```text
┌────────────────────┐       ┌──────────────────────────┐
│ API-Clients / UI   │──────▶│ REST-Gateway             │
└────────────────────┘       └─────────────┬────────────┘
                                           │
                                  ┌────────▼────────┐
                                  │ Application     │
                                  │ Use Cases       │
                                  └────────┬────────┘
                                           │
                ┌──────────────────────────┼──────────────────────────┐
                │                          │                          │
        ┌───────▼────────┐        ┌────────▼────────┐        ┌────────▼────────┐
        │ Request Store  │        │ Replay Engine   │        │ Incident Mgmt   │
        └───────┬────────┘        └────────┬────────┘        └────────┬────────┘
                │                          │                          │
        ┌───────▼────────┐        ┌────────▼────────┐        ┌────────▼────────┐
        │ PostgreSQL     │        │ Zielsysteme     │        │ Audit Log       │
        └────────────────┘        └─────────────────┘        └─────────────────┘
                │                          │                          │
                └──────────────┬───────────┴──────────────┬───────────┘
                               ▼                          ▼
                         Kafka Events              OpenTelemetry
```

---

## 4. Schichtenmodell

| Schicht | Verantwortung |
| ------- | ------------- |
| API Layer | REST-Endpunkte, Authentifizierung, Autorisierung, OpenAPI |
| Application Layer | Use Cases für Aufzeichnung, Incident, Replay, Audit und Datenlebenszyklus |
| Domain Layer | fachliche Modelle, Regeln, Rollen, Replay-Policy und Incident-Status |
| Adapter Layer | PostgreSQL, Kafka, Keycloak/OIDC, OpenTelemetry, Zielsystem-Clients |
| Infrastructure Layer | Konfiguration, DI, Health, Runtime-Profile, Container-Integration |

Die Dependency Rule lautet: äußere Schichten dürfen innere Schichten
nutzen; innere Schichten kennen keine konkreten Adapter.

---

## 5. Hexagonale Sicht

```text
                 Driving Adapter
        ┌──────────────────────────────┐
        │ REST API / UI / CLI / Worker │
        └──────────────┬───────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │        Driving Ports         │
        │ Record · Replay · Incident   │
        │ Audit Query · Data Lifecycle │
        └──────────────┬───────────────┘
                       │
                       ▼
┌────────────────────────────────────────────────┐
│              Application Hexagon               │
│  Use Cases, Policies, Workflow-Orchestrierung  │
│                                                │
│  ┌──────────────────────────────────────────┐  │
│  │              Domain Hexagon              │  │
│  │ Request, Response, Incident, Replay,     │  │
│  │ Audit, Rollen, Maskierungs- und          │  │
│  │ Freigaberegeln                           │  │
│  └──────────────────────────────────────────┘  │
└──────────────────────┬─────────────────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │         Driven Ports         │
        │ Repositories · Events ·      │
        │ Identity · Targets · OTel    │
        └──────────────┬───────────────┘
                       │
                       ▼
                 Driven Adapter
┌────────────┬────────────┬───────────┬────────────┬──────────────┐
│ PostgreSQL │ Kafka      │ Keycloak  │ Zielsystem │ OpenTelemetry │
│ Persistenz │ Events     │ OIDC/JWT  │ Clients    │ Exporter      │
└────────────┴────────────┴───────────┴────────────┴──────────────┘
```

Driving Adapter rufen den fachlichen Kern über Driving Ports auf.
Der Kern ruft Infrastruktur ausschließlich über Driven Ports auf.
Konkrete Adapter implementieren diese Ports und bleiben austauschbar.

### Driving Ports

| Port | Zweck |
| ---- | ----- |
| `IRecordRequestUseCase` | Request/Response erfassen, maskieren und persistieren |
| `IReplayUseCase` | Replay vorbereiten, validieren, freigeben und ausführen |
| `IIncidentUseCase` | Incidents erzeugen, verknüpfen und pflegen |
| `IAuditQueryUseCase` | Audit-Daten recherchieren |
| `IDataLifecycleUseCase` | Aufbewahrungs- und Löschregeln anwenden |

### Driven Ports

| Port | Zweck |
| ---- | ----- |
| `IRequestRepository` | Request-, Response- und Headerdaten speichern |
| `IReplayRepository` | Replay-Freigaben, Ausführungen und Ergebnisse speichern |
| `IIncidentRepository` | Incident-Daten verwalten |
| `IAuditLog` | auditpflichtige Ereignisse append-only speichern |
| `IEventPublisher` | fachliche Events veröffentlichen |
| `ITargetSystemClient` | Zielsysteme für Replay ansprechen |
| `IIdentityProvider` | Benutzer, Rollen und Token prüfen |
| `ITelemetryExporter` | Traces, Metriken und Logs exportieren |

---

## 6. Datenfluss: Request-Aufzeichnung

```text
HTTP Request/Response
→ Correlation-ID prüfen oder erzeugen
→ Header und Payload klassifizieren
→ Secrets und personenbezogene Daten maskieren
→ Request/Response persistieren
→ Event `request.recorded` publizieren
→ Trace, Metriken und Audit-Einträge erzeugen
```

---

## 7. Datenfluss: Replay

```text
Replay-Antrag
→ Rollen und Berechtigungen prüfen
→ Zielsystem gegen Whitelist prüfen
→ Payload-Mutation validieren
→ produktive Freigabe prüfen
→ Dry-Run oder Replay ausführen
→ Original- und Zielantwort vergleichbar speichern
→ Audit, Event und Observability-Daten erzeugen
```

---

## 8. Modulvorschlag

```text
b-trace/
├── src/
│   ├── hexagon/
│   │   ├── btrace-domain/
│   │   └── btrace-application/
│   ├── adapters/
│   │   ├── driving/
│   │   │   └── btrace-api/
│   │   └── driven/
│   │       ├── btrace-adapters-persistence/
│   │       ├── btrace-adapters-events/
│   │       ├── btrace-adapters-identity/
│   │       ├── btrace-adapters-targets/
│   │       └── btrace-adapters-telemetry/
│   └── host/
│       └── btrace-host/
└── tests/
    ├── hexagon/
    ├── adapters/
    └── architecture/
```

Der konkrete Technologieentscheid aus dem Pflichtenheft kann diese
Namen anpassen. Die Abhängigkeitsrichtung und Verantwortungsgrenzen
bleiben verbindlich.

---

## 9. Persistenz

PostgreSQL ist der erste Zielpfad für persistente Daten. Audit-Daten
muessen manipulationsresistent und append-orientiert behandelt werden.
Aufbewahrungsregeln muessen Datenklassen unterscheiden: Request,
Response, Replay, Incident, Event und Audit.

---

## 10. Events

Kafka ist die bevorzugte Event-Infrastruktur. Events muessen mindestens
Event-ID, Schema-Version, Zeitstempel, Correlation-ID und fachlichen
Objektbezug enthalten.

---

## 11. Sicherheit

- JWT/OIDC fuer API-Zugriffe.
- Rollenbasierte Rechte fuer Payload-Zugriff, Replay und Administration.
- Produktive Replays nur mit Whitelist und Freigabe.
- TLS fuer externe Schnittstellen.
- Maskierung vor Persistenz.
- Auditierung aller sicherheits-, replay- und payloadbezogenen Aktionen.

---

## 12. Offene Architekturpunkte

| Kennung | Frage | Status |
| ------- | ----- | ------ |
| AR-OPEN-001 | Wird das System zuerst als Monolith-Host oder als getrennte Services umgesetzt? | Offen |
| AR-OPEN-002 | Welches Backend-Framework wird verbindlich gewählt: Micronaut oder Jakarta EE? | Offen |
| AR-OPEN-003 | Welches Build-System wird verbindlich gewählt: Gradle oder Maven? | Offen |
| AR-OPEN-004 | Wie wird manipulationsresistente Audit-Speicherung konkret umgesetzt? | Offen |
| AR-OPEN-005 | Welche Payload-Maskierungsregeln sind initial verpflichtend? | Offen |
| AR-OPEN-006 | Welche Zielsystem-Typen werden im MVP für Replay unterstützt? | Offen |
| AR-OPEN-007 | Welches Architekturtest-Tool wird verbindlich eingesetzt? | Offen |

---

## 13. Zusammenfassung

`b-trace` wird als hexagonales Incident- und Replay-System konzipiert.
Der fachliche Kern verwaltet Aufzeichnung, Incident, Replay,
Berechtigung, Audit und Datenlebenszyklus. Adapter koppeln Persistenz,
Events, Identität, Observability und Zielsysteme an.

Die wichtigste Architekturregel lautet:

```text
Replay ist kein Debug-Shortcut.
Replay ist ein kontrollierter, berechtigter und auditierter Workflow.
```
