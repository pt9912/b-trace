# Replay-Sicherheit

## Zweck

Replay ist in `b-trace` eine privilegierte Operation. Dieses Dokument
beschreibt die erwarteten Schutzmechanismen aus Benutzer- und
Betriebssicht.

---

## Grundregel

```text
Kein Replay gegen ein produktives Zielsystem ohne Whitelist, Berechtigung
und explizite Freigabe.
```

---

## Schutzmechanismen

| Mechanismus | Zweck |
| ----------- | ----- |
| Zielsystem-Whitelist | Nur freigegebene Ziele duerfen angesprochen werden |
| Produktiv-Kennzeichnung | Produktive Ziele brauchen zusaetzliche Freigabe |
| Dry-Run | Validierung ohne Zielsystemaufruf |
| Rate-Limit | Schutz vor Lastspitzen und Batch-Fehlern |
| Rollenmodell | Trennung von Lesen, Vorbereiten, Starten und Administrieren |
| Payload-Maskierung | Schutz sensibler Daten vor Persistenz und Anzeige |
| Audit-Logging | Nachvollziehbarkeit jeder Replay-Aktion |

---

## Replay-Modi

| Modus | Verhalten |
| ----- | --------- |
| Dry-Run | Prueft Konfiguration, Berechtigung, Payload-Mutation und Ziel, ruft aber kein Zielsystem auf |
| Einzel-Replay | Fuehrt genau einen gespeicherten Request gegen ein freigegebenes Ziel aus |
| Batch-Replay | Fuehrt mehrere Requests mit Drosselung und konfigurierbarer Parallelitaet aus |
| Zeitversetztes Replay | Fuehrt Requests nach geplanter Zeit aus |

---

## Audit-Pflicht

Audit-Eintraege muessen mindestens enthalten:

- Zeitpunkt,
- Benutzer oder Service-Identitaet,
- Aktion,
- Zielobjekt,
- Correlation-ID,
- Ergebnis,
- Ablehnungsgrund bei verweigerten Replays.

---

## Sichere Defaults

- Produktive Zielsysteme sind ohne Freigabe blockiert.
- Unbekannte Zielsysteme sind blockiert.
- Unbekannte Payload-Typen duerfen nicht unmaskiert gespeichert werden.
- Fehlende Berechtigungen fuehren zu Ablehnung, nicht zu Fallback auf
  breitere Rechte.
