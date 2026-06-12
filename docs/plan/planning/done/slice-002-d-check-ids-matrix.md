# Slice slice-002: d-check scharf schalten (ids und matrix)

**Status:** done

**Welle:** ohne Welle (Harness-Pflege)

**Bezug:** [ADR-0002](../../adr/0002-harness-bootstrap.md),
[CO-003](../../carveouts/CO-003-traceability-mechanik.md),
[MR-005](../../../../harness/conventions.md),
[Trigger-Watch-Notiz](note-d-check-ausbau.md)

**Autor:** Dietmar Burkard. **Datum:** 2026-06-12.

---

## 1. Ziel

Die d-check-Module `ids` (Linkpflicht fuer Kennungen) und `matrix`
(Referenz-Richtung der Spec-Straten) aktivieren und alle Befunde in
der bestehenden Doku aufloesen.

## 2. Definition of Done

- [x] `.d-check.yml` traegt `ids` (Muster: `ADR-\d{4}`, `CO-\d{3}`,
      `MR-\d{3}`, `RM-(M\d|OPEN)-\d+`, `slice-\d{3}`) und `matrix`
      (spec-straten verweisen nie abwaerts auf ADRs oder Slices).
- [x] Alle 68 `id-unlinked`-Befunde aufgeloest: nackte Kennungen im
      Fliesstext verlinken auf ihre Definition.
- [x] Sensors-Tabelle in [harness/README.md](../../../../harness/README.md)
      nachgefuehrt (Konvergenz-Auftrag der BF-Sub-Area Tooling).
- [x] `docs/plan/planning/next/` angelegt;
      [MR-005](../../../../harness/conventions.md) hebt
      [MR-003](../../../../harness/conventions.md) auf.
- [x] Trigger-Watch-Notiz nach `done/` ueberfuehrt (reiner Move,
      dann Status-Update).
- [x] `make gates` gruen.

## 3. Plan (vor Code)

| Datei / Komponente | Aenderungs-Art | Begruendung |
| ------------------ | -------------- | ----------- |
| `.d-check.yml` | update | Module ids und matrix aktivieren |
| Harness-, ADR-, Carveout-, Planning-Dateien | update | Kennungen verlinken (Befund-getrieben) |
| `docs/plan/planning/next/` | neu | Baseline-Lifecycle vervollstaendigen |
| `harness/conventions.md` | update | [MR-005](../../../../harness/conventions.md) (Aufhebung von [MR-003](../../../../harness/conventions.md)) |

## 4. Trigger

Nutzerauftrag 2026-06-12 („Dokumente aufraeumen, `.d-check.yml`
scharf schalten") — aktiviert beide Items der
[Trigger-Watch-Notiz](note-d-check-ausbau.md).

## 5. Closure-Trigger

DoD vollstaendig, `make gates` gruen, Commit mit Kennungs-Referenz.

## 6. Risiken und offene Punkte

- Lastenheft-Kennungen (`M-`, `AB-`, `F-*`, ...) haben bewusst noch
  keine Linkpflicht; das wuerde grosse Teile der Roadmap-Tabellen
  betreffen und folgt sinnvoll erst mit dem Spezifikations-Stratum
  ([CO-001](../../carveouts/done/CO-001-spezifikation-stratum.md)).
- Das `codepaths`-Modul (Pfade in Inline-Code) bleibt aus; Kandidat
  fuer einen spaeteren Ausbau, braucht `d-check:ignore`-Disziplin
  fuer absichtlich noch nicht existierende Pfade.

## 7. Closure-Notiz (nach `done/`)

- Funktioniert: Die Spec-Straten waren bereits abwaertsfrei — das
  matrix-Modul lief ohne einen einzigen Befund scharf.
- Anders als geplant: Auch [ADR-0002](../../adr/0002-harness-bootstrap.md)
  (Accepted) musste angefasst werden — reine Link-Formatierung der
  Kennungen, keine inhaltliche Aenderung; als vertraegliche Ausnahme
  von Hard Rule 3.3 gewertet, weil das Gate die Form erzwingt und
  der Entscheidungstext wortgleich bleibt.
- Steering-Loop-Lerneintrag: Kennungen von Anfang an verlinken;
  68 Nachverlinkungen waren der Preis dafuer, das ids-Modul erst
  nach dem Bootstrap zu aktivieren.
- Folgearbeiten: keine neuen `open/`-Eintraege.

## 8. Sub-Area-Modus-Begruendung

Beruehrt sind die GF-Sub-Area Spezifikation und Planung sowie die
BF-Sub-Area Build- und Doku-Tooling (`.d-check.yml`). Fuer die
BF-Sub-Area gilt der Konvergenz-Auftrag aus der Modus-Deklaration in
[harness/conventions.md](../../../../harness/conventions.md): die
Sensor-Deklaration in `harness/README.md` wurde im selben Slice
nachgefuehrt.
