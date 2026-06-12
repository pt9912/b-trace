# Slice slice-003: ids-Vollausbau (Lastenheft- und Architektur-Kennungen)

**Status:** done

**Welle:** ohne Welle (Harness-Pflege)

**Bezug:** [slice-002](slice-002-d-check-ids-matrix.md),
[CO-001](../../carveouts/CO-001-spezifikation-stratum.md)

**Autor:** Dietmar Burkard. **Datum:** 2026-06-12.

---

## 1. Ziel

Die Linkpflicht des ids-Moduls auf alle Kennungs-Familien des
Lastenhefts (`M-`, `W-`, `A-`, `PE-`, `ROLE-`, `D-`, `IF-`, `AB-`,
`DEP-`, `COV-`, `F-*`, `Q-*`) und der Architektur (`AR-P-`,
`AR-OPEN-`) ausweiten — Vollausbau der in
[slice-002](slice-002-d-check-ids-matrix.md) begonnenen
Scharfschaltung.

## 2. Definition of Done

- [x] `.d-check.yml` traegt Muster fuer alle Lastenheft-Familien
      (Ziel `spec/lastenheft.md`) und `AR-(P|OPEN)` (Ziel
      `spec/architecture.md`).
- [x] Alle 45 neuen `id-unlinked`-Befunde aufgeloest (Roadmap,
      Architektur, Qualitaets-Doku, CO-002, harness/README).
- [x] Bereichs-Notationen (z. B. `D-001..010`) als Ganzes verlinkt.
- [x] `make gates` gruen.

## 3. Plan (vor Code)

| Datei / Komponente | Aenderungs-Art | Begruendung |
| ------------------ | -------------- | ----------- |
| `.d-check.yml` | update | vier zusaetzliche ids-Muster |
| Roadmap, `spec/architecture.md`, `docs/user/quality.md`, [CO-002](../../carveouts/CO-002-code-sensors.md), `harness/README.md` | update | Kennungen verlinken (Befund-getrieben) |

## 4. Trigger

Nutzer-Korrektur 2026-06-12: Die Direktive „scharf schalten" aus
[slice-002](slice-002-d-check-ids-matrix.md) galt vollstaendig; die
dort dokumentierte Ausnahme fuer Lastenheft-Kennungen war eine nicht
beauftragte Scope-Beschneidung.

## 5. Closure-Trigger

DoD vollstaendig, `make gates` gruen, Commit mit Kennungs-Referenz.

## 6. Risiken und offene Punkte

- Die Kennungs-Familien `ARC-`, `CC-`, `ARCHTEST-` und `NFQ-` aus der
  Bezug-Spalte der Architekturprinzipien sind in keiner Quelle als
  Schema deklariert und haben kein ids-Muster; Klaerung gehoert zur
  Aufloesung von
  [CO-001](../../carveouts/CO-001-spezifikation-stratum.md).
- Links auf das Lastenheft zeigen auf die Datei, nicht auf
  Kapitel-Anker; Anker-Praezision ist moeglicher Folgeausbau.

## 7. Closure-Notiz (nach `done/`)

- Funktioniert: Bereichs-Notationen als Ganzes zu verlinken
  (`[D-001..010](...)`) genuegt dem ids-Modul; kein Umschreiben der
  Roadmap-Tabellen noetig.
- Steering-Loop-Lerneintrag: Eine Nutzer-Direktive („alles scharf
  schalten") wird nicht eigenmaechtig um Ausnahmen beschnitten;
  Scope-Reduktionen sind vorzuschlagen, nicht still zu entscheiden.
- Folgearbeiten: keine neuen `open/`-Eintraege; die ungeklaerten
  Kennungs-Familien haengen an
  [CO-001](../../carveouts/CO-001-spezifikation-stratum.md).

## 8. Sub-Area-Modus-Begruendung

Beruehrt sind die GF-Sub-Areas Spezifikation und Planung sowie
Anwender-Doku und die BF-Sub-Area Build- und Doku-Tooling
(`.d-check.yml`); fuer letztere wurde der Konvergenz-Auftrag erfuellt
(keine Aenderung an der Sensors-Deklaration noetig, der
docs-check-Vertrag ist unveraendert).
