# Notiz: M1-Folgearbeiten und Trigger-Watch

**Dokumenttyp:** Vorabklaerung / Trigger-Watch  
**Status:** Offen  
**Bezug:** [Roadmap](../in-progress/roadmap.md)

---

## Zweck

Diese Notiz sammelt Folgearbeiten, die fuer M1 sichtbar sind, aber noch
keinen eigenen Umsetzungsplan haben. Ein Eintrag wird erst zu einem
Plan, wenn sein Trigger tatsaechlich zündet.

---

## Item F-M1-01: Replay-Zielsystem-Profile

**Trigger:** Das MVP benoetigt mehr als ein Testziel oder ein reales
Zielsystem.

**Scope-Skizze:**

- Zielsystemtyp definieren.
- Whitelist-Regeln und Produktiv-Kennzeichnung festlegen.
- Timeout-, Retry- und Rate-Limit-Policy dokumentieren.
- Contract-Tests gegen Stub-Zielsystem ergaenzen.

---

## Item F-M1-02: Audit-Manipulationsschutz

**Trigger:** Audit-Daten muessen ueber normale Datenbankrechte hinaus
manipulationsresistent nachweisbar sein.

**Scope-Skizze:**

- Hash-Kette, Signatur oder externer Audit-Store bewerten.
- Loesch- und Aufbewahrungsregeln fuer Audit separat definieren.
- Negativtests fuer nachtraegliche Veraenderung ergaenzen.

---

## Item F-M1-03: Payload-Maskierung v2

**Trigger:** Erste reale Payloads enthalten Felder, die mit Header-
Maskierung allein nicht sicher behandelbar sind.

**Scope-Skizze:**

- JSONPath-/XPath-basierte Maskierungsregeln.
- Content-Type-spezifische Parser.
- Fail-closed-Verhalten bei unbekanntem oder unparsebarem Payload.

---

## Item F-M1-04: Replay-Genehmigungsworkflow

**Trigger:** Produktive Replays brauchen Vier-Augen-Prinzip,
zeitliche Gueltigkeit oder getrennte Rollen fuer Antrag und Freigabe.

**Scope-Skizze:**

- Freigabeobjekt mit Ablaufzeit.
- Rollenmatrix fuer Antragsteller und Freigeber.
- Audit- und API-Kontrakt fuer Genehmigung.

---

## Trigger-Watch-Disziplin

Beim Zünden eines Triggers wird ein eigenes Plan-Dokument unter
`docs/plan/planning/in-progress/` angelegt. Nach Umsetzung wandert es
nach `docs/plan/planning/done/`.
