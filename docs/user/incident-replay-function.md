# Funktion eines Incident- & Replay-Systems

## Zweck

Dieses Dokument beschreibt aus Anwendersicht, welche Aufgabe `b-trace`
erfuellt. Es richtet sich an Entwickler, SREs, DevOps-Teams und
Incident-Teams.

Ein Incident- & Replay-System ersetzt kein SIEM, kein Ticket-System und
keine BPM-Engine. Es konzentriert sich auf die nachvollziehbare
Aufzeichnung, Analyse und kontrollierte Wiederholung technischer
Requests.

---

## Gesamtbild

```text
Requests / Responses
→ Aufzeichnung mit Correlation-ID
→ Maskierung sensibler Daten
→ Persistenz und Audit
→ Incident-Verknuepfung
→ Dry-Run oder freigegebenes Replay
→ Ergebnisvergleich und Observability
```

---

## Kernfunktionen

- Requests und Responses speichern.
- Header und Payloads nachvollziehbar versionieren.
- Incidents mit Requests, Replays und Audit-Eintraegen verknuepfen.
- Replays sicher vorbereiten, freigeben und ausfuehren.
- Replay-Ergebnisse mit Originalantworten vergleichen.
- Audit-, Trace-, Metrik- und Logdaten bereitstellen.

---

## Typischer Ablauf

1. Ein fehlerhafter Request wird anhand einer Correlation-ID gefunden.
2. Ein Incident wird erzeugt oder ein bestehender Incident verknuepft.
3. Ein Analyst prueft Request, Response, Header und maskierte Payload.
4. Ein Dry-Run validiert Zielsystem, Payload-Mutation und Rate-Limits.
5. Ein berechtigter Benutzer startet ein freigegebenes Replay.
6. Das Ergebnis wird gespeichert, auditiert und mit dem Original
   verglichen.

---

## Nicht-Ziele

- Kein vollwertiges Ticket-System.
- Keine vollstaendige SIEM-Loesung.
- Keine generische Workflow-Engine.
- Kein unkontrollierter Produktions-Replay-Shortcut.
