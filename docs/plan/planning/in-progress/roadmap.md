# Roadmap: b-trace

**Dokumenttyp:** Planung / Roadmap  
**Status:** In Arbeit  
**Bezug:** [Lastenheft](../../../../spec/lastenheft.md), [Architektur](../../../../spec/architecture.md)

---

## Zweck

Dieses Dokument beschreibt die geplante Umsetzungsreihenfolge fuer
`b-trace`. Es ist die Bruecke zwischen Lastenheft, Architektur und
konkreten Umsetzungsslices.

Kennungen `RM-Mn-xx` dienen als stabile Referenzen fuer Issues, PRs,
Tests und ADRs.

---

## Status-Legende

| Status | Bedeutung |
| ------ | --------- |
| Abgeschlossen | Umsetzung ist abgeschlossen und verifiziert |
| In Arbeit | Umsetzung oder Planung laeuft aktiv |
| Geplant | Umsetzung ist vorgesehen, aber noch nicht gestartet |
| Verworfen | Punkt wurde bewusst aus dem Scope genommen |

---

## Aktueller Stand

> **Stand:** 2026-05-13  
> **Phase:** Anforderungen und Architektur.  
> **Vorhanden:** Lastenheft, Architekturbeschreibung, Dokumentationsstruktur, erste ADR.  
> **Naechster Schritt:** MVP-Schnitt M1 konkretisieren und erste technische Entscheidungen schliessen.

---

## M1 — MVP: Aufzeichnung, Audit und sicheres Einzel-Replay

**Status:** Geplant

### Liefergegenstände

| Kennung | Liefergegenstand | Bezug |
| ------- | ---------------- | ----- |
| RM-M1-01 | Projekt- und Modulstruktur nach hexagonalem Schnitt | [AR-P-001](../../../../spec/architecture.md#2-architekturprinzipien), [Q-MNT-001](../../../../spec/lastenheft.md#63-wartbarkeit) |
| RM-M1-02 | Domain-Modell fuer Request, Response, Incident, Replay und Audit | F-REQ-*, F-INC-*, F-REP-* |
| RM-M1-03 | REST-API-Basis mit OpenAPI und Health-Endpunkt | [M-006](../../../../spec/lastenheft.md#11-muss-ziele), [AB-013](../../../../spec/lastenheft.md#13-abnahmekriterien) |
| RM-M1-04 | Persistenzadapter fuer PostgreSQL | [D-001..010](../../../../spec/lastenheft.md#51-zu-speichernde-daten) |
| RM-M1-05 | Maskierung sensibler Header und Payload-Felder | [F-DAT-001](../../../../spec/lastenheft.md#46-datenschutz-und-datenlebenszyklus), [AB-006](../../../../spec/lastenheft.md#13-abnahmekriterien) |
| RM-M1-06 | Audit-Logging fuer schreibende und sicherheitsrelevante Aktionen | [AB-004](../../../../spec/lastenheft.md#13-abnahmekriterien) |
| RM-M1-07 | Einzel-Replay gegen freigegebenes Testziel | [AB-001](../../../../spec/lastenheft.md#13-abnahmekriterien) |
| RM-M1-08 | Replay-Schutz: Whitelist, Dry-Run, Freigabe, Rate-Limit-Basis | [AB-002](../../../../spec/lastenheft.md#13-abnahmekriterien), [AB-003](../../../../spec/lastenheft.md#13-abnahmekriterien) |
| RM-M1-09 | Basistests, Architekturtests und CI-Qualitaets-Gates | Kapitel 15/16 |

### Abnahmekriterien

- Ein Request kann gespeichert, maskiert und wiedergefunden werden.
- Ein Incident kann mit Request und Audit-Eintraegen verknuepft werden.
- Ein Dry-Run ruft kein Zielsystem auf.
- Ein Replay ohne Whitelist oder Freigabe wird verweigert.
- OpenAPI beschreibt die MVP-Endpunkte.
- Architekturtests verhindern Framework-Abhaengigkeiten in der Domaene.

---

## M2 — Event-Verarbeitung, DLQ und Observability

**Status:** Geplant

### Liefergegenstände

| Kennung | Liefergegenstand | Bezug |
| ------- | ---------------- | ----- |
| RM-M2-01 | Kafka-Event-Publisher und Consumer-Basis | [M-009](../../../../spec/lastenheft.md#11-muss-ziele), [IF-002](../../../../spec/lastenheft.md#91-externe-schnittstellen) |
| RM-M2-02 | Event-Schema-Versionierung | [AB-014](../../../../spec/lastenheft.md#13-abnahmekriterien) |
| RM-M2-03 | Retry- und Dead-Letter-Verarbeitung | [M-010](../../../../spec/lastenheft.md#11-muss-ziele), [AB-009](../../../../spec/lastenheft.md#13-abnahmekriterien) |
| RM-M2-04 | OpenTelemetry-Traces fuer Aufzeichnung, Incident und Replay | [AB-007](../../../../spec/lastenheft.md#13-abnahmekriterien) |
| RM-M2-05 | Metriken fuer Durchsatz, Fehler, Replay-Latenz und DLQ | [F-OBS-002](../../../../spec/lastenheft.md#45-observability) |

---

## M3 — Rollen, Datenschutz und Datenlebenszyklus

**Status:** Geplant

### Liefergegenstände

| Kennung | Liefergegenstand | Bezug |
| ------- | ---------------- | ----- |
| RM-M3-01 | OIDC/JWT-Integration mit Keycloak-Profil | [F-SEC-001..003](../../../../spec/lastenheft.md#44-sicherheit) |
| RM-M3-02 | Rollenmodell Viewer, Analyst, Replayer, Administrator, Auditor | [ROLE-001..005](../../../../spec/lastenheft.md#47-rollen-und-rechte) |
| RM-M3-03 | Roh-Payload-Sonderrecht und Auditierung | [F-DAT-005](../../../../spec/lastenheft.md#46-datenschutz-und-datenlebenszyklus) |
| RM-M3-04 | Aufbewahrungs- und Loeschregeln | [F-DAT-002..003](../../../../spec/lastenheft.md#46-datenschutz-und-datenlebenszyklus) |
| RM-M3-05 | Datenschutzexport und Loeschanfrage | [F-DAT-006](../../../../spec/lastenheft.md#46-datenschutz-und-datenlebenszyklus) |

---

## M4 — Batch-Replay, Replay-Vergleich und Reports

**Status:** Geplant

### Liefergegenstände

| Kennung | Liefergegenstand | Bezug |
| ------- | ---------------- | ----- |
| RM-M4-01 | Batch-Replay mit Parallelitaet und Drosselung | [F-REP-004](../../../../spec/lastenheft.md#42-replay-funktionen), [F-REP-009](../../../../spec/lastenheft.md#42-replay-funktionen) |
| RM-M4-02 | Vergleich Originalantwort vs. Replayantwort | [F-REP-011](../../../../spec/lastenheft.md#42-replay-funktionen) |
| RM-M4-03 | Zeitversetztes Replay | [F-REP-005](../../../../spec/lastenheft.md#42-replay-funktionen) |
| RM-M4-04 | Exportierbare Incident- und Replay-Reports | [W-005](../../../../spec/lastenheft.md#12-wunsch-ziele) |

---

## M5 — Betrieb, Skalierung und Kubernetes

**Status:** Geplant

### Liefergegenstände

| Kennung | Liefergegenstand | Bezug |
| ------- | ---------------- | ----- |
| RM-M5-01 | Docker-Compose-Referenzumgebung | [AB-008](../../../../spec/lastenheft.md#13-abnahmekriterien) |
| RM-M5-02 | Performance-Tests fuer 1000 Requests/s und Replay p95 | [AB-010](../../../../spec/lastenheft.md#13-abnahmekriterien) |
| RM-M5-03 | Kubernetes-faehiges Deployment | [DEP-002](../../../../spec/lastenheft.md#172-deployment) |
| RM-M5-04 | Rollback- und Zero-Downtime-Konzept | [DEP-003..005](../../../../spec/lastenheft.md#172-deployment) |

---

## Offene Roadmap-Punkte

| Kennung | Frage | Status |
| ------- | ----- | ------ |
| RM-OPEN-001 | Backend-Framework: Micronaut oder Jakarta EE? | Offen |
| RM-OPEN-002 | Build-System: Gradle oder Maven? | Offen |
| RM-OPEN-003 | Erste Zielsysteme fuer Replay-MVP? | Offen |
| RM-OPEN-004 | Audit-Speicher: append-only Tabellen, Hash-Kette oder externer Audit-Store? | Offen |
| RM-OPEN-005 | Initiale Maskierungsregeln fuer Payloads? | Offen |
| RM-OPEN-006 | CI-Plattform: GitHub Actions oder GitLab CI? | Offen |
