# Lastenheft

## b-trace (Incident- & Replay-System (IRS))

| Kennung | IRS-LH-001      |
| ------- | --------------- |
| Version | 1.1             |
| Datum   | 13.05.2026      |
| Status  | Entwurf         |
| Autor   | Dietmar Burkard |

---

## Änderungshistorie

| Version | Datum      | Änderung |
| ------- | ---------- | -------- |
| 1.0     | 13.05.2026 | Initialer Entwurf |
| 1.1     | 13.05.2026 | Verfeinerung von Workflows, Datenklassifizierung, Schnittstellen und Risikobehandlung |

---

# 1 Zielbestimmung

## 1.1 Muss-Ziele

| Kennung | Beschreibung                                            |
| ------- | ------------------------------------------------------- |
| M-001   | Entwicklung eines verteilten Incident- & Replay-Systems |
| M-002   | Verarbeitung und Speicherung von Requests und Responses |
| M-003   | Wiederholung (Replay) von Requests                      |
| M-004   | Nachvollziehbarkeit aller Vorgänge durch Auditierung    |
| M-005   | Unterstützung moderner Cloud- und Containerumgebungen   |
| M-006   | Bereitstellung einer REST-API                           |
| M-007   | Unterstützung von Observability mit OpenTelemetry       |
| M-008   | Integration eines Rollen- und Rechtesystems             |
| M-009   | Unterstützung asynchroner Eventverarbeitung             |
| M-010   | Unterstützung von Fehler- und Dead-Letter-Verarbeitung  |

---

## 1.2 Wunsch-Ziele

| Kennung | Beschreibung                               |
| ------- | ------------------------------------------ |
| W-001   | Echtzeit-Dashboard                         |
| W-002   | Replay-Simulation ohne echte Zielsysteme   |
| W-003   | KI-gestützte Incident-Kategorisierung      |
| W-004   | Multi-Tenant-Fähigkeit                     |
| W-005   | Export von Incident-Reports                |
| W-006   | Erweiterte Kubernetes-native Deployment-Unterstützung, z. B. Helm/Operator |

---

## 1.3 Abgrenzungskriterien

| Kennung | Beschreibung                        |
| ------- | ----------------------------------- |
| A-001   | Keine vollständige SIEM-Lösung      |
| A-002   | Kein vollwertiges Ticket-System; Incident-Management bleibt auf IRS-bezogene Analyse-, Status- und Kommentarfunktionen begrenzt |
| A-003   | Keine vollständige BPM-Engine       |
| A-004   | Keine Legacy-Monolith-Unterstützung |

---

# 2 Produkteinsatz

## 2.1 Anwendungsbereiche

| Kennung | Beschreibung                 |
| ------- | ---------------------------- |
| PE-001  | Analyse verteilter Systeme   |
| PE-002  | Incident-Untersuchung        |
| PE-003  | Replay fehlerhafter Requests |
| PE-004  | Debugging von Schnittstellen |
| PE-005  | Last- und Stabilitätstests   |

---

## 2.2 Zielgruppen

| Kennung | Beschreibung                |
| ------- | --------------------------- |
| ZG-001  | Softwareentwickler          |
| ZG-002  | DevOps-Teams                |
| ZG-003  | SRE-Teams                   |
| ZG-004  | Support- und Incident-Teams |
| ZG-005  | Enterprise-Architekten      |

---

## 2.3 Betriebsbedingungen

| Kennung | Beschreibung                 |
| ------- | ---------------------------- |
| BB-001  | Betrieb in Docker-Containern |
| BB-002  | Linux-basierte Umgebung      |
| BB-003  | Kubernetes-fähiger Betrieb als Soll-Anforderung |
| BB-004  | Hochverfügbarkeit            |
| BB-005  | Horizontale Skalierung       |

---

# 3 Produktübersicht

## 3.1 Systemkontext

Das System dient der Aufzeichnung, Analyse und Wiederholung von Requests innerhalb verteilter Systeme.

Das System besteht aus:

- REST-Gateway
- Replay-Engine
- Event-Streaming
- Incident-Management
- Audit-Logging
- Observability-Komponenten
- Benutzer- und Rechteverwaltung

## 3.2 Komponentenverantwortung

| Komponente | Verantwortung |
| ---------- | ------------- |
| REST-Gateway | Annahme, Authentifizierung und Validierung externer API-Aufrufe |
| Replay-Engine | Planung, Freigabeprüfung, Dry-Run und Ausführung von Replays |
| Event-Streaming | Asynchrone Verarbeitung von Incident-, Replay- und Audit-Ereignissen |
| Incident-Management | Verwaltung von Incidents, Status, Priorität, Kommentaren und Verknüpfungen |
| Audit-Logging | Manipulationsresistente Nachvollziehbarkeit sicherheits- und fachrelevanter Aktionen |
| Observability | Bereitstellung von Traces, Metriken und Logs für Betrieb und Analyse |
| Benutzer- und Rechteverwaltung | Rollen, Berechtigungen und Zugriffskontrolle |

---

# 4 Produktfunktionen

## 4.1 Request-Aufzeichnung

| Kennung   | Beschreibung                                  |
| --------- | --------------------------------------------- |
| F-REQ-001 | Requests müssen gespeichert werden            |
| F-REQ-002 | Responses müssen gespeichert werden           |
| F-REQ-003 | Header müssen protokolliert werden            |
| F-REQ-004 | Correlation-IDs müssen unterstützt werden     |
| F-REQ-005 | Payload-Versionierung muss unterstützt werden |

---

## 4.2 Replay-Funktionen

| Kennung   | Beschreibung                                    |
| --------- | ----------------------------------------------- |
| F-REP-001 | Requests müssen erneut abgespielt werden können |
| F-REP-002 | Replay gegen alternative Zielsysteme            |
| F-REP-003 | Replay mit manipulierten Payloads               |
| F-REP-004 | Batch-Replay                                    |
| F-REP-005 | Zeitversetztes Replay                           |
| F-REP-006 | Replay-Zielsysteme müssen über eine Whitelist begrenzt werden |
| F-REP-007 | Replays gegen produktive Zielsysteme müssen eine explizite Freigabe erfordern |
| F-REP-008 | Dry-Run-Replays ohne Aufruf des Zielsystems müssen unterstützt werden |
| F-REP-009 | Batch- und zeitversetzte Replays müssen Rate-Limits unterstützen |
| F-REP-010 | Replay-Ausführungen müssen vollständig auditiert werden |
| F-REP-011 | Replay-Ergebnisse müssen Original- und Zielantwort vergleichbar speichern |
| F-REP-012 | Nicht-idempotente Requests müssen vor Replay gekennzeichnet oder blockiert werden können |

---

## 4.3 Incident-Management

| Kennung   | Beschreibung                           |
| --------- | -------------------------------------- |
| F-INC-001 | Incidents müssen erzeugt werden können |
| F-INC-002 | Incident-Historisierung                |
| F-INC-003 | Incident-Kommentierung                 |
| F-INC-004 | Priorisierung von Incidents            |
| F-INC-005 | Statusverwaltung                       |
| F-INC-006 | Incidents müssen mit Requests, Replays und Audit-Einträgen verknüpfbar sein |
| F-INC-007 | Incident-Management darf keine generische Ticket-Workflow-Engine ersetzen |

---

## 4.4 Sicherheit

| Kennung   | Beschreibung                                       |
| --------- | -------------------------------------------------- |
| F-SEC-001 | OAuth2/OpenID Connect Unterstützung                |
| F-SEC-002 | Rollenbasierte Zugriffskontrolle                   |
| F-SEC-003 | Integration mit Keycloak                           |
| F-SEC-004 | Audit-Logging aller sicherheitsrelevanten Aktionen |
| F-SEC-005 | Verschlüsselte Kommunikation                       |
| F-SEC-006 | Feingranulare Berechtigungen für Payload-, Replay- und Administrationszugriffe |
| F-SEC-007 | Secrets und sensible Header müssen vor Speicherung maskiert werden |

---

## 4.5 Observability

| Kennung   | Beschreibung                 |
| --------- | ---------------------------- |
| F-OBS-001 | Distributed Tracing          |
| F-OBS-002 | Metriken                     |
| F-OBS-003 | Zentrales Logging            |
| F-OBS-004 | OpenTelemetry-Unterstützung  |
| F-OBS-005 | Export zu Prometheus/Grafana |

---

## 4.6 Datenschutz und Datenlebenszyklus

| Kennung  | Beschreibung |
| -------- | ------------ |
| F-DAT-001 | Personenbezogene Daten und Secrets müssen vor Speicherung erkennbar maskiert oder pseudonymisiert werden können |
| F-DAT-002 | Aufbewahrungsfristen für Request-, Response-, Audit-, Replay- und Incident-Daten müssen konfigurierbar sein |
| F-DAT-003 | Datenlöschung nach Ablauf der Aufbewahrungsfrist muss automatisiert erfolgen können |
| F-DAT-004 | Verschlüsselung ruhender Daten muss für persistente Speicher unterstützt werden |
| F-DAT-005 | Zugriff auf Roh-Payloads muss separat berechtigt und auditiert werden |
| F-DAT-006 | Export und Löschung personenbezogener Daten müssen für Datenschutzanfragen unterstützt werden |
| F-DAT-007 | Audit-Daten müssen manipulationsresistent gespeichert werden |

---

## 4.7 Rollen und Rechte

| Kennung | Rolle | Mindestrechte |
| ------- | ----- | ------------- |
| ROLE-001 | Viewer | Incidents, Requests und Replay-Ergebnisse lesen, jedoch keine Roh-Payloads ohne Zusatzrecht einsehen |
| ROLE-002 | Analyst | Incidents bearbeiten, Kommentare erfassen, Dry-Runs ausführen und freigegebene Replays vorbereiten |
| ROLE-003 | Replayer | Replays innerhalb freigegebener Zielsysteme starten und Batch-Replays konfigurieren |
| ROLE-004 | Administrator | Benutzer, Rollen, Zielsystem-Whitelist, Aufbewahrungsregeln und Systemkonfiguration verwalten |
| ROLE-005 | Auditor | Audit-Daten und sicherheitsrelevante Ereignisse lesen, aber keine operativen Änderungen ausführen |

---

## 4.8 Fachliche Workflows

| Kennung | Workflow | Beschreibung |
| ------- | -------- | ------------ |
| WF-001 | Request-Aufzeichnung | Ein eingehender Request wird validiert, mit Correlation-ID versehen, maskiert, persistiert und optional als Event publiziert |
| WF-002 | Incident-Erzeugung | Ein Incident wird manuell oder regelbasiert aus Request-, Response-, Event- oder Fehlerdaten erzeugt |
| WF-003 | Replay-Vorbereitung | Ein berechtigter Benutzer wählt Request, Zielsystem, Payload-Mutation, Rate-Limit und Ausführungsmodus aus |
| WF-004 | Replay-Freigabe | Produktive oder risikobehaftete Replays werden blockiert, bis eine berechtigte Freigabe vorliegt |
| WF-005 | Replay-Ausführung | Die Replay-Engine führt Dry-Run oder Replay aus, speichert Ergebnisdaten und erzeugt Audit- und Observability-Daten |
| WF-006 | Dead-Letter-Verarbeitung | Fehlerhafte Events werden nach konfigurierten Wiederholungen in eine Dead Letter Queue verschoben und bleiben analysierbar |
| WF-007 | Datenschutzanfrage | Personenbezogene Daten werden anhand definierter Identifikatoren gesucht, exportiert oder gemäß Aufbewahrungsregeln gelöscht |

---

# 5 Produktdaten

## 5.1 Zu speichernde Daten

| Kennung | Beschreibung          |
| ------- | --------------------- |
| D-001   | Requests              |
| D-002   | Responses             |
| D-003   | Replay-Protokolle     |
| D-004   | Benutzerinformationen |
| D-005   | Audit-Daten           |
| D-006   | Incident-Daten        |
| D-007   | Event-Daten           |
| D-008   | Datenschutz- und Maskierungsregeln |
| D-009   | Replay-Freigaben und Replay-Ergebnisse |
| D-010   | Aufbewahrungs- und Löschfristen |

---

## 5.2 Datenklassifizierung

| Klasse | Beispiele | Mindestschutz |
| ------ | --------- | ------------- |
| Öffentlich | Dokumentation, nicht-sensitive Systemmetadaten | Keine besonderen Schutzanforderungen |
| Intern | technische Konfiguration, nicht-sensitive Logs | Zugriff nur für authentifizierte Benutzer |
| Vertraulich | Requests, Responses, Incidents, Replay-Ergebnisse | Rollenbasierter Zugriff, Transportverschlüsselung, Auditierung |
| Sensibel | Roh-Payloads, personenbezogene Daten, Secrets, Tokens | Maskierung oder Pseudonymisierung, gesonderte Berechtigung, Verschlüsselung ruhender Daten |
| Audit-kritisch | Audit-Einträge, Freigaben, Rollenänderungen | Manipulationsresistente Speicherung und eingeschränkte Löschbarkeit |

---

# 6 Qualitätsanforderungen

## 6.1 Performance

| Kennung    | Beschreibung                                |
| ---------- | ------------------------------------------- |
| Q-PERF-001 | Verarbeitung von mindestens 1000 Requests/s bei 10 KiB Payload-Größe, persistierter Speicherung und maximal 1% Fehlerrate in der Referenzumgebung |
| Q-PERF-002 | Replay-Latenz p95 unter 500ms für Einzel-Replay ohne externen Zielsystem-Timeout |
| Q-PERF-003 | Horizontale Skalierung muss durch Verdopplung gleichartiger Instanzen mindestens 70% zusätzlichen Durchsatz liefern |
| Q-PERF-004 | Batch-Replay muss drosselbar sein und konfigurierbare Parallelität unterstützen |
| Q-PERF-005 | Performance-Tests müssen Referenzumgebung, Payload-Größe, Parallelität und Messfenster dokumentieren |

Referenzumgebung für Performance-Abnahmen ist ein Linux-x86_64-System mit mindestens 4 vCPU, 16 GiB RAM, lokaler Docker-Compose-Ausführung sowie lokal betriebenem PostgreSQL und Kafka. Abweichende Abnahmeumgebungen müssen mit ihren Auswirkungen auf die Messergebnisse dokumentiert werden.

---

## 6.2 Sicherheit

| Kennung   | Beschreibung                   |
| --------- | ------------------------------ |
| Q-SEC-001 | TLS-Verschlüsselung für alle externen Schnittstellen |
| Q-SEC-002 | JWT-basierte Authentifizierung mit prüfbarer Signatur, Ablaufzeit und Rolleninformationen |
| Q-SEC-003 | Auditierbarkeit aller schreibenden, sicherheitsrelevanten und Replay-bezogenen Aktionen |
| Q-SEC-004 | Ruhende Daten müssen verschlüsselt oder über verschlüsselte Speicherdienste abgelegt werden |
| Q-SEC-005 | Standardkonfiguration muss produktive Replays ohne Whitelist und Freigabe verhindern |

---

## 6.3 Wartbarkeit

| Kennung   | Beschreibung           |
| --------- | ---------------------- |
| Q-MNT-001 | Hexagonale Architektur |
| Q-MNT-002 | Klare Modulgrenzen     |
| Q-MNT-003 | Hohe Testabdeckung     |
| Q-MNT-004 | Austauschbare Adapter  |
| Q-MNT-005 | CI/CD-Unterstützung    |

---

# 7 Technische Rahmenbedingungen

## 7.1 Backend

| Kennung  | Beschreibung              |
| -------- | ------------------------- |
| T-BE-001 | Java 21                   |
| T-BE-002 | Backend-Framework wird im Pflichtenheft verbindlich festgelegt; zulässige Optionen: Micronaut oder Jakarta EE |
| T-BE-003 | Build-System wird im Pflichtenheft verbindlich festgelegt; zulässige Optionen: Gradle oder Maven |
| T-BE-004 | RESTful APIs              |
| T-BE-005 | OpenAPI                   |

---

## 7.2 Frontend

| Kennung  | Beschreibung           |
| -------- | ---------------------- |
| T-FE-001 | SvelteKit              |
| T-FE-002 | Responsive UI          |
| T-FE-003 | Echtzeitaktualisierung |

---

## 7.3 Infrastruktur

| Kennung   | Beschreibung   |
| --------- | -------------- |
| T-INF-001 | Docker         |
| T-INF-002 | Docker Compose |
| T-INF-003 | Kubernetes als Soll-Zielplattform |
| T-INF-004 | PostgreSQL     |
| T-INF-005 | Kafka          |
| T-INF-006 | OpenTelemetry  |
| T-INF-007 | Prometheus     |
| T-INF-008 | Grafana        |

---

# 8 Architekturvorgaben

## 8.1 Architekturprinzipien

| Kennung | Beschreibung                          |
| ------- | ------------------------------------- |
| ARC-001 | Hexagonale Architektur                |
| ARC-002 | Trennung von Domäne und Infrastruktur |
| ARC-003 | Ports-and-Adapters-Prinzip            |
| ARC-004 | Domain-zentrierte Entwicklung         |
| ARC-005 | Event-Driven Architecture             |

Die konkrete Technologieauswahl aus Kapitel 7 und 18 ist im Pflichtenheft zu finalisieren. Dieses Lastenheft legt fachliche Anforderungen, zulässige technische Randbedingungen und Abnahmekriterien fest.

---

# 9 Schnittstellen

## 9.1 Externe Schnittstellen

| Kennung | Beschreibung         |
| ------- | -------------------- |
| IF-001  | REST API             |
| IF-002  | Kafka Events         |
| IF-003  | OpenTelemetry Export |
| IF-004  | PostgreSQL           |
| IF-005  | Keycloak             |

---

## 9.2 REST-API-Ressourcen

| Kennung | Ressource | Zweck |
| ------- | --------- | ----- |
| API-001 | `/requests` | Suche, Anzeige und Verwaltung aufgezeichneter Requests und Responses |
| API-002 | `/incidents` | Erzeugung, Bearbeitung, Kommentierung und Statusverwaltung von Incidents |
| API-003 | `/replays` | Vorbereitung, Dry-Run, Freigabe, Ausführung und Auswertung von Replays |
| API-004 | `/audit-events` | Recherche von Audit-Einträgen für Auditoren und Administratoren |
| API-005 | `/targets` | Verwaltung freigegebener Replay-Zielsysteme und produktiver Zielkennzeichnung |
| API-006 | `/retention-policies` | Verwaltung von Aufbewahrungs- und Löschregeln |
| API-007 | `/users` und `/roles` | Benutzer-, Rollen- und Berechtigungsverwaltung |
| API-008 | `/health` und `/metrics` | Betriebsstatus und Metriken für Monitoring-Systeme |

Alle REST-API-Ressourcen müssen über OpenAPI dokumentiert werden. Schreibende Operationen müssen authentifiziert, autorisiert und auditiert werden.

---

## 9.3 Event-Schnittstellen

| Kennung | Event | Zweck |
| ------- | ----- | ----- |
| EVT-001 | `request.recorded` | Ein Request und optional eine Response wurden aufgezeichnet |
| EVT-002 | `incident.created` | Ein Incident wurde erzeugt |
| EVT-003 | `incident.updated` | Status, Priorität, Kommentar oder Verknüpfung eines Incidents wurde geändert |
| EVT-004 | `replay.requested` | Ein Replay wurde vorbereitet oder beantragt |
| EVT-005 | `replay.approved` | Ein Replay wurde freigegeben |
| EVT-006 | `replay.executed` | Ein Replay oder Dry-Run wurde ausgeführt |
| EVT-007 | `audit.event.created` | Ein auditpflichtiges Ereignis wurde gespeichert |
| EVT-008 | `dead-letter.created` | Ein Event wurde nach fehlgeschlagener Verarbeitung in die Dead Letter Queue verschoben |

Event-Payloads müssen versioniert, schema-validierbar und über Correlation-ID nachvollziehbar sein.

---

# 10 Risiken

| Kennung | Beschreibung | Gegenmaßnahme |
| ------- | ------------ | ------------- |
| R-001   | Hohe Datenmengen | Skalierbare Persistenz, Aufbewahrungsregeln, Performance-Tests und Monitoring |
| R-002   | Replay-Inkonsistenzen durch Seiteneffekte oder nicht-idempotente Zielsysteme | Dry-Run, Freigaben, Zielsystem-Whitelist, Idempotenzkennzeichnung und Rate-Limits |
| R-003   | Komplexität verteilter Systeme | Correlation-IDs, Distributed Tracing, Architekturtests und klare Modulgrenzen |
| R-004   | Netzwerkabhängigkeiten | Timeouts, Retries, Circuit-Breaker-Konzept und Dead-Letter-Verarbeitung |
| R-005   | Datenschutzanforderungen | Maskierung, Pseudonymisierung, Zugriffskontrolle, Aufbewahrungsregeln und Auditierung |
| R-006   | Missbrauch von Replay-Funktionen | Rollenmodell, produktive Freigaben, manipulationsresistente Auditierung und sichere Standardkonfiguration |
| R-007   | Vendor-Lock-in durch Infrastrukturentscheidungen | Ports-and-Adapters-Prinzip und austauschbare Infrastrukturadapter |

---

# 11 Glossar

| Begriff           | Beschreibung                              |
| ----------------- | ----------------------------------------- |
| Incident          | Fehler- oder Störfall                     |
| Replay            | Wiederholung eines Requests               |
| Correlation-ID    | ID zur Nachverfolgung verteilter Requests |
| Adapter           | Infrastrukturkomponente                   |
| Port              | Abstrakte Schnittstelle                   |
| Dead Letter Queue | Queue für fehlerhafte Nachrichten         |
| Observability     | Überwachbarkeit eines Systems             |
| Dry-Run           | Validierung eines Replays ohne Aufruf des Zielsystems |
| Whitelist         | Freigabeliste erlaubter Replay-Zielsysteme |
| Roh-Payload       | Unmaskierter Request- oder Response-Inhalt |
| Aufbewahrungsregel | Konfiguration zur Speicherdauer und Löschung bestimmter Datenklassen |
| Payload-Mutation  | Kontrollierte Veränderung eines gespeicherten Payloads vor Replay |
| Zielsystem        | System, gegen das ein Replay ausgeführt werden kann |

---

# 12 Priorisierung

| Priorität | Bedeutung             |
| --------- | --------------------- |
| Muss      | Zwingend erforderlich |
| Soll      | Wichtig               |
| Kann      | Optional              |

Anforderungen in den Kapiteln 1.1, 4, 5, 6, 8, 9, 13, 15, 16, 17 und 20 gelten als Muss-Anforderungen, sofern sie nicht ausdrücklich als Soll- oder Kann-Anforderung markiert sind. Wunsch-Ziele aus Kapitel 1.2 sind Kann-Anforderungen. Kubernetes ist in diesem Lastenheft eine Soll-Zielplattform; erweiterte Kubernetes-native Funktionen wie Helm-Charts oder Operatoren sind Wunsch-Ziele.

---

# 13 Abnahmekriterien

| Kennung | Szenario | Messbares Abnahmekriterium |
| ------- | -------- | -------------------------- |
| AB-001  | Einzel-Replay eines gespeicherten Requests | Ein gespeicherter Request kann gegen ein freigegebenes Zielsystem erneut ausgeführt werden; Original-Response, Replay-Response, Statuscode, Latenz und Correlation-ID sind nachvollziehbar gespeichert |
| AB-002  | Replay-Schutz produktiver Systeme | Ein Replay gegen ein produktiv markiertes Zielsystem wird ohne Whitelist-Eintrag und Freigabe verweigert und als abgelehnter Replay-Versuch auditiert |
| AB-003  | Dry-Run-Replay | Ein Dry-Run validiert Ziel, Authentifizierung, Payload-Mutation und Rate-Limit-Konfiguration, ohne das Zielsystem aufzurufen |
| AB-004  | Auditierbarkeit | Für Erzeugung, Änderung, Löschung, Replay, Login, Rollenänderung und Payload-Zugriff entstehen Audit-Einträge mit Zeitpunkt, Benutzer, Aktion, Objekt-ID, Ergebnis und Correlation-ID |
| AB-005  | Authentifizierung und Autorisierung | Requests ohne gültiges JWT werden abgewiesen; Benutzer ohne Replay-Recht können keine Replays starten; Admin-Rechte erlauben Rollenverwaltung |
| AB-006  | Datenschutz und Maskierung | Sensible Header wie `Authorization`, `Cookie` und konfigurierbare Payload-Felder werden vor Speicherung maskiert; Rohzugriffe sind separat berechtigt und auditiert |
| AB-007  | OpenTelemetry | Für REST-Aufzeichnung, Event-Verarbeitung und Replay werden Traces mit Correlation-ID exportiert; Metriken für Durchsatz, Fehler, Replay-Latenz und DLQ-Einträge sind abrufbar |
| AB-008  | Containerisierter Betrieb | Das System startet mit Docker Compose inklusive PostgreSQL, Kafka, Observability-Exporter und Beispielkonfiguration reproduzierbar in einer lokalen Referenzumgebung |
| AB-009  | Asynchrone Eventverarbeitung | Ein gültiges Event wird verarbeitet und persistiert; ein fehlerhaftes Event wird nach konfigurierten Retries in eine Dead Letter Queue verschoben |
| AB-010  | Performance | In der dokumentierten Referenzumgebung werden 1000 Requests/s bei 10 KiB Payload-Größe mit maximal 1% Fehlerrate erreicht; Einzel-Replay erfüllt p95 < 500ms ohne externen Zielsystem-Timeout |
| AB-011  | Datenlebenszyklus | Konfigurierte Aufbewahrungsfristen löschen abgelaufene Request-, Response-, Replay- und Incident-Daten automatisiert, ohne Audit-Nachweise vor Ablauf ihrer Frist zu entfernen |
| AB-012  | Architekturvalidierung | CI führt Architekturtests aus und bricht bei Domänenabhängigkeiten auf Framework- oder Infrastrukturcode ab |
| AB-013  | REST-API-Dokumentation | Alle in Kapitel 9.2 beschriebenen Ressourcen sind in einer validen OpenAPI-Spezifikation mit Authentifizierungs- und Fehlerantworten dokumentiert |
| AB-014  | Event-Versionierung | Events aus Kapitel 9.3 enthalten Schema-Version, Event-ID, Zeitstempel und Correlation-ID und werden bei ungültigem Schema abgewiesen oder in die Dead Letter Queue verschoben |
| AB-015  | Rollenmodell | Die Rollen Viewer, Analyst, Replayer, Administrator und Auditor erfüllen die Mindestrechte aus Kapitel 4.7 und verhindern nicht autorisierte Roh-Payload-, Replay- und Administrationszugriffe |

---

# 14 Architektur- und Entwicklungsprinzipien

## 14.1 SOLID-Prinzipien

| Kennung   | Beschreibung                                                                |
| --------- | --------------------------------------------------------------------------- |
| SOLID-001 | Das System muss nach SOLID-Prinzipien entwickelt werden                     |
| SOLID-002 | Klassen müssen eine klare Einzelverantwortung besitzen (SRP)                |
| SOLID-003 | Erweiterungen müssen ohne Änderung bestehender Kernlogik möglich sein (OCP) |
| SOLID-004 | Implementierungen müssen austauschbar sein (LSP)                            |
| SOLID-005 | Schnittstellen müssen klein und fachlich getrennt sein (ISP)                |
| SOLID-006 | Abhängigkeiten müssen gegen Abstraktionen gerichtet sein (DIP)              |

---

## 14.2 Clean-Code-Richtlinien

| Kennung | Beschreibung                                        |
| ------- | --------------------------------------------------- |
| CC-001  | Methoden dürfen maximal 30 Zeilen umfassen          |
| CC-002  | Keine Businesslogik in Infrastruktur-Adaptern       |
| CC-003  | Keine Framework-Abhängigkeiten in der Domäne        |
| CC-004  | Keine zyklischen Modulabhängigkeiten                |
| CC-005  | Fachliche Namen müssen eindeutig und sprechend sein |
| CC-006  | Keine statischen Utility-God-Classes                |
| CC-007  | Immutable Domain-Objekte bevorzugen                 |
| CC-008  | Fehlerbehandlung muss explizit erfolgen             |

---

# 15 Teststrategie

## 15.1 Allgemeine Testanforderungen

| Kennung  | Beschreibung                                             |
| -------- | -------------------------------------------------------- |
| TEST-001 | Automatisierte Tests sind verpflichtend                  |
| TEST-002 | Unit-Tests müssen unabhängig ausführbar sein             |
| TEST-003 | Integrationstests müssen containerisiert ausführbar sein |
| TEST-004 | Architekturtests müssen Modulgrenzen prüfen              |
| TEST-005 | Replay-Funktionalitäten müssen vollständig testbar sein  |
| TEST-006 | Sicherheitsrelevante Funktionen müssen getestet werden   |
| TEST-007 | Event-Processing muss getestet werden                    |
| TEST-008 | Fehlerfälle müssen getestet werden                       |
| TEST-009 | Datenschutz-, Maskierungs- und Aufbewahrungsregeln müssen getestet werden |
| TEST-010 | Replay-Freigaben, Whitelists, Dry-Run und Rate-Limits müssen getestet werden |

---

## 15.2 Testarten

| Kennung       | Beschreibung      |
| ------------- | ----------------- |
| TEST-TYPE-001 | Unit-Tests        |
| TEST-TYPE-002 | Integrationstests |
| TEST-TYPE-003 | Architekturtests  |
| TEST-TYPE-004 | Contract-Tests    |
| TEST-TYPE-005 | End-to-End-Tests  |
| TEST-TYPE-006 | Performance-Tests |
| TEST-TYPE-007 | Sicherheitstests  |

---

## 15.3 Coverage-Anforderungen

| Kennung | Beschreibung                                                |
| ------- | ----------------------------------------------------------- |
| COV-001 | Mindest-Testabdeckung von 90%                               |
| COV-002 | Branch-Coverage mindestens 85%                              |
| COV-003 | Kritische Domänenlogik mindestens 95% Coverage              |
| COV-004 | Coverage darf nicht künstlich erzeugt werden                |
| COV-005 | Getter/Setter-only-Tests gelten nicht als Qualitätsnachweis |

---

# 16 Qualitäts-Gates

## 16.1 Build-Qualitäts-Gates

| Kennung | Beschreibung                                                     |
| ------- | ---------------------------------------------------------------- |
| QG-001  | Build darf bei unterschrittener Coverage nicht erfolgreich sein  |
| QG-002  | Build darf bei kritischen oder hohen Sicherheitslücken ohne dokumentierte Ausnahme nicht erfolgreich sein |
| QG-003  | Build darf bei Architekturverletzungen nicht erfolgreich sein    |
| QG-004  | Build darf bei fehlschlagenden Tests nicht erfolgreich sein      |
| QG-005  | Build darf bei statischen Analysefehlern nicht erfolgreich sein  |
| QG-006  | Build darf bei fehlgeschlagener OpenAPI-Validierung nicht erfolgreich sein |
| QG-007  | Build darf bei fehlgeschlagenen Datenschutz- und Replay-Sicherheitsprüfungen nicht erfolgreich sein |

---

## 16.2 Codeanalyse

| Kennung | Beschreibung                        |
| ------- | ----------------------------------- |
| QA-001  | Statische Codeanalyse verpflichtend |
| QA-002  | SonarQube-Unterstützung             |
| QA-003  | Prüfung auf Code Smells             |
| QA-004  | Prüfung auf Duplication             |
| QA-005  | Prüfung auf Sicherheitslücken       |
| QA-006  | Prüfung zyklischer Abhängigkeiten   |

---

## 16.3 Architekturvalidierung

| Kennung      | Beschreibung                                                |
| ------------ | ----------------------------------------------------------- |
| ARCHTEST-001 | Hexagonale Modulgrenzen müssen automatisiert geprüft werden |
| ARCHTEST-002 | Infrastruktur darf nicht direkt von der Domäne abhängen     |
| ARCHTEST-003 | Adapter dürfen Domänenlogik nicht enthalten                 |
| ARCHTEST-004 | Ports müssen framework-unabhängig bleiben                   |
| ARCHTEST-005 | Architekturtests müssen Teil der CI/CD-Pipeline sein        |

---

# 17 CI/CD-Anforderungen

## 17.1 Pipeline

| Kennung  | Beschreibung                      |
| -------- | --------------------------------- |
| CICD-001 | Vollautomatische Build-Pipeline   |
| CICD-002 | Automatische Testausführung       |
| CICD-003 | Automatische Qualitäts-Gates      |
| CICD-004 | Containerisierte Builds           |
| CICD-005 | Sicherheitsscans                  |
| CICD-006 | Dependency-Scanning               |
| CICD-007 | Automatisierte Artefakt-Erzeugung |

---

## 17.2 Deployment

| Kennung | Beschreibung                |
| ------- | --------------------------- |
| DEP-001 | Docker-basierte Deployments |
| DEP-002 | Kubernetes-fähiges Deployment als Soll-Anforderung |
| DEP-003 | Rolling Updates             |
| DEP-004 | Zero-Downtime-Deployment    |
| DEP-005 | Rollback-Unterstützung      |

---

# 18 Technologieempfehlungen

| Bereich           | Empfehlung                    |
| ----------------- | ----------------------------- |
| Architekturtests  | ArchUnit                      |
| Unit-Tests        | JUnit 5                       |
| Mocking           | Mockito                       |
| Integrationstests | Testcontainers                |
| Coverage          | JaCoCo                        |
| Qualitäts-Gate    | SonarQube                     |
| API-Tests         | RestAssured                   |
| Sicherheitsscans  | OWASP Dependency Check        |
| Container-Tests   | Testcontainers                |
| CI/CD             | GitHub Actions oder GitLab CI |

---

# 19 Nichtfunktionale Qualitätsziele

| Kennung | Beschreibung                       |
| ------- | ---------------------------------- |
| NFQ-001 | Hohe Wartbarkeit                   |
| NFQ-002 | Hohe Erweiterbarkeit               |
| NFQ-003 | Geringe Kopplung                   |
| NFQ-004 | Hohe Kohäsion                      |
| NFQ-005 | Austauschbarkeit von Infrastruktur |
| NFQ-006 | Cloud-Native-Fähigkeit             |
| NFQ-007 | Observability-by-Default           |
| NFQ-008 | Sicherheit durch sichere Standardkonfiguration |

---

# 20 Definition of Done

| Kennung | Beschreibung                        |
| ------- | ----------------------------------- |
| DOD-001 | Alle Tests erfolgreich              |
| DOD-002 | Coverage >= 90%                     |
| DOD-003 | Keine kritischen SonarQube-Befunde |
| DOD-004 | Architekturtests erfolgreich        |
| DOD-005 | Container-Build erfolgreich         |
| DOD-006 | OpenAPI-Dokumentation vorhanden     |
| DOD-007 | CHANGELOG aktualisiert              |
| DOD-008 | README aktualisiert                 |
| DOD-009 | OpenTelemetry integriert            |
| DOD-010 | Sicherheitsprüfungen erfolgreich    |
| DOD-011 | Replay-Schutzmechanismen erfolgreich getestet |
| DOD-012 | Datenschutz-, Maskierungs- und Aufbewahrungsregeln erfolgreich getestet |
| DOD-013 | Abnahmekriterien aus Kapitel 13 automatisiert oder nachvollziehbar manuell geprüft |
| DOD-014 | OpenAPI-Spezifikation gegen implementierte REST-API validiert |
| DOD-015 | Event-Schemata versioniert und validiert |
| DOD-016 | Betriebs- und Sicherheitsentscheidungen im Pflichtenheft oder in Architecture Decision Records dokumentiert |
