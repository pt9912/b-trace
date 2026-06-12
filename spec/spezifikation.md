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

Noch keine Verfeinerungen. Verfeinerungen einzelner
Lastenheft-Anforderungen erhalten Kennungen nach dem Schema
`<Lastenheft-ID>.<buchstabe>` (z. B. `F-REP-006.a`) und entstehen mit
den ersten Umsetzungsslices.

---

## 3. Datenstrukturen und Schemas

Noch keine Festlegungen. OpenAPI-Vertraege und Event-Schemata
entstehen mit der REST-API-Basis und der Event-Verarbeitung; die
Schema-Versionierung folgt [AB-014](lastenheft.md).

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
