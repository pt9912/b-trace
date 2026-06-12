# Spezifikation — b-trace

**Status:** Aktiv. **Letzte Aenderung:** 2026-06-12.

**Bezug zum Lastenheft:** Diese Spezifikation praezisiert die in
[lastenheft.md](lastenheft.md) formulierten Anforderungen. Bei
Konflikt gewinnt das Lastenheft. Sie ist technisch verbindlich, aber
ohne Lastenheft-Aenderung fortschreibbar.

---

## 1. Technologie-Festlegungen

Aus dem Lastenheft uebernommene, technisch verbindliche Festlegungen.

| Bereich | Festlegung | Bezug |
| ------- | ---------- | ----- |
| Sprache und Plattform | Java 21 | [T-BE-001](lastenheft.md) |
| API-Stil | RESTful APIs mit OpenAPI-Vertrag | [T-BE-004](lastenheft.md), [T-BE-005](lastenheft.md), [M-006](lastenheft.md) |
| Persistenz | PostgreSQL | [T-INF-004](lastenheft.md), [IF-004](lastenheft.md) |
| Messaging | Kafka | [T-INF-005](lastenheft.md), [IF-002](lastenheft.md) |
| Identitaet und Zugriff | Keycloak (OIDC), JWT-basierte Authentifizierung | [F-SEC-003](lastenheft.md), [IF-005](lastenheft.md), [Q-SEC-002](lastenheft.md) |
| Observability | OpenTelemetry; Prometheus und Grafana | [T-INF-006](lastenheft.md), [T-INF-007](lastenheft.md), [T-INF-008](lastenheft.md), [IF-003](lastenheft.md), [M-007](lastenheft.md) |
| Laufzeitumgebung | Docker und Docker Compose; Kubernetes als Soll-Zielplattform | [T-INF-001..003](lastenheft.md), [BB-001](lastenheft.md), [BB-003](lastenheft.md) |
| Frontend | SvelteKit, responsive, Echtzeitaktualisierung | [T-FE-001..003](lastenheft.md) |

### Offene Festlegungen

| Festlegung | Zulaessige Optionen | Bezug |
| ---------- | ------------------- | ----- |
| Backend-Framework | Micronaut oder Jakarta EE; Entscheidung im Pflichtenheft | [T-BE-002](lastenheft.md) |
| Build-System | Gradle oder Maven; Entscheidung im Pflichtenheft | [T-BE-003](lastenheft.md) |

---

## 2. Algorithmen und Datenfluesse

Verfeinerungen einzelner Lastenheft-Anforderungen erhalten Kennungen
nach dem Schema `<Lastenheft-ID>.<buchstabe>` (z. B. `F-REP-006.a`).

### Ablauf Request-Aufzeichnung

**Bezug:** [M-002](lastenheft.md), [F-DAT-001](lastenheft.md)

```text
HTTP Request/Response
→ Correlation-ID pruefen oder erzeugen
→ Header und Payload klassifizieren
→ Secrets und personenbezogene Daten maskieren
→ Request/Response persistieren
→ Event `request.recorded` publizieren
→ Trace, Metriken und Audit-Eintraege erzeugen
```

Die Maskierung liegt verbindlich **vor** der Persistierung.

### Ablauf Replay

**Bezug:** [M-003](lastenheft.md), [F-REP-006..012](lastenheft.md)

```text
Replay-Antrag
→ Rollen und Berechtigungen pruefen
→ Zielsystem gegen Whitelist pruefen
→ Payload-Mutation validieren
→ produktive Freigabe pruefen
→ Dry-Run oder Replay ausfuehren
→ Original- und Zielantwort vergleichbar speichern
→ Audit, Event und Observability-Daten erzeugen
```

Die Pruefreihenfolge ist verbindlich; jeder abgelehnte Schritt
erzeugt einen Audit-Eintrag mit Ablehnungsgrund
([AB-004](lastenheft.md)).

---

## 3. Datenstrukturen und Schemas

OpenAPI-Vertraege entstehen mit der REST-API-Basis.

### Event-Pflichtfelder

Jedes fachliche Event traegt mindestens
([M-009](lastenheft.md), [AB-014](lastenheft.md)):

| Feld | Zweck |
| ---- | ----- |
| Event-ID | eindeutige Identifikation |
| Schema-Version | Versionierung des Event-Schemas |
| Zeitstempel | fachlicher Ereigniszeitpunkt |
| Correlation-ID | Verknuepfung ueber Systemgrenzen |
| fachlicher Objektbezug | referenziertes Request-, Incident- oder Replay-Objekt |

### Persistenz-Datenklassen

Aufbewahrungs- und Loeschregeln unterscheiden die Datenklassen
Request, Response, Replay, Incident, Event und Audit
([F-DAT-002..003](lastenheft.md)). Audit-Daten werden append-only
gespeichert und muessen manipulationsresistent behandelt werden
([M-004](lastenheft.md), [AB-004](lastenheft.md)).

---

## 4. Defaults und Konstanten

Noch keine Festlegungen. Kandidaten: Rate-Limit-Defaults
([F-REP-009](lastenheft.md)), initiale Maskierungsregeln
([F-DAT-001](lastenheft.md)).

---

## 5. Fehler-Codes und Logging-Felder

Noch keine Festlegungen.

---

## 6. Metriken und Tracing-Felder

Noch keine Festlegungen. Pflicht-Attribute pro Span entstehen mit der
Observability-Integration ([F-OBS-001..005](lastenheft.md)).

---

## 7. Externe Vertraege

| System | Version | Vertrag-Datei |
| ------ | ------- | ------------- |
| Replay-Zielsysteme | offen | noch keine; Whitelist-Pflicht nach [F-REP-006..012](lastenheft.md) |

---

## 8. Historie

| Datum | Aenderung | ADR |
| ----- | --------- | --- |
| 2026-06-12 | Initial: Skelett nach Template, Technologie-Festlegungen aus dem Lastenheft uebernommen | — |
| 2026-06-12 | Datenfluesse, Event-Pflichtfelder und Persistenz-Datenklassen aus der Architektur uebernommen (Stratifizierungs-Aufraeumen) | — |
