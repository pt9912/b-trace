# Slice slice-004: Spezifikations-Stratum anlegen

**Status:** done

**Welle:** ohne Welle (Spec-Pflege)

**Bezug:** [CO-001](../../carveouts/done/CO-001-spezifikation-stratum.md),
[MR-006](../../../../harness/conventions.md#mr-006--aufhebung-von-mr-002-rang-2-besetzt),
[T-BE-001](../../../../spec/lastenheft.md#71-backend)

**Autor:** Dietmar Burkard. **Datum:** 2026-06-12.

---

## 1. Ziel

`spec/spezifikation.md` (Rang 2 der Source Precedence) nach dem
Kurs-Template anlegen und mit den bereits im Lastenheft gebundenen
Technologie-Festlegungen fuellen — ohne offene Entscheidungen
([T-BE-002](../../../../spec/lastenheft.md#71-backend),
[T-BE-003](../../../../spec/lastenheft.md#71-backend)) vorwegzunehmen.

## 2. Definition of Done

- [x] `spec/spezifikation.md` existiert, folgt der Template-Gliederung
      und traegt die Technologie-Festlegungen mit Lastenheft-Bezug.
- [x] Offene Festlegungen (Framework, Build-System) sind als offen
      markiert, nicht entschieden.
- [x] Source Precedence (harness/README.md, AGENTS.md) verlinkt
      Rang 2; Guides-Tabelle ergaenzt.
- [x] [MR-006](../../../../harness/conventions.md#mr-006--aufhebung-von-mr-002-rang-2-besetzt) hebt
      [MR-002](../../../../harness/conventions.md#mr-002--source-precedence-mit-unbesetztem-rang-2) auf.
- [x] [CO-001](../../carveouts/done/CO-001-spezifikation-stratum.md)
      aufgeloest und nach `done/` ueberfuehrt.
- [x] ids-Muster um die Lastenheft-Familien `T-*`, `BB-`, `ARC-`,
      `CC-`, `ARCHTEST-` ergaenzt; matrix-Klasse spec-straten umfasst
      alle drei Straten; Befunde aufgeloest.
- [x] `make gates` gruen.

## 3. Plan (vor Code)

| Datei / Komponente | Aenderungs-Art | Begruendung |
| ------------------ | -------------- | ----------- |
| `spec/spezifikation.md` | neu | Rang-2-Stratum nach Template |
| `.d-check.yml` | update | neue ids-Familien, matrix-Klasse |
| `spec/architecture.md` | update | neue Kennungs-Familien verlinken |
| harness/README.md, AGENTS.md, conventions.md | update | Rang 2, Guides, [MR-006](../../../../harness/conventions.md#mr-006--aufhebung-von-mr-002-rang-2-besetzt) |
| [CO-001](../../carveouts/done/CO-001-spezifikation-stratum.md) | update + move | Aufloesung |

## 4. Trigger

Nutzerauftrag 2026-06-12 („Jetzt brauchen wir im spec Ordner noch
spezifikation.md") — zuendet den Aufloesungs-Trigger von
[CO-001](../../carveouts/done/CO-001-spezifikation-stratum.md) vor der
urspruenglich erwarteten Framework-/Build-Entscheidung.

## 5. Closure-Trigger

DoD vollstaendig, `make gates` gruen, Commit mit Kennungs-Referenz.

## 6. Risiken und offene Punkte

- `NFQ-005` (Bezug-Spalte von
  [AR-P-007](../../../../spec/architecture.md#2-architekturprinzipien)) ist weiterhin in
  keiner Quelle definiert — haengende Referenz, Klaerung beim
  naechsten Architektur-Update.
- Die Technologie-Festlegungen sind Lastenheft-Uebernahmen; die erste
  echte ADR-Schaerfung der Spezifikation folgt mit der Entscheidung
  von [T-BE-002](../../../../spec/lastenheft.md#71-backend) /
  [T-BE-003](../../../../spec/lastenheft.md#71-backend).

## 7. Closure-Notiz (nach `done/`)

- Funktioniert: Template zuerst laden (Lerneintrag aus
  [slice-001](slice-001-harness-bootstrap.md)) hat sich ausgezahlt;
  die Gliederung stand ohne Nacharbeit.
- Beobachtung: Der ids-Vollausbau aus
  [slice-003](slice-003-ids-vollausbau.md) hatte die Familien `T-*`,
  `BB-`, `ARC-`, `CC-`, `ARCHTEST-` uebersehen (mein Befunds-Grep war
  auf die Roadmap-Verwendungen beschraenkt); erst die Arbeit am
  Stratum hat sie sichtbar gemacht. Vollstaendigkeit von
  Muster-Listen gegen die Definitionsquelle pruefen, nicht gegen die
  bekannten Verwendungen.
- Folgearbeiten: `NFQ-005`-Klaerung (siehe §6).

## 8. Sub-Area-Modus-Begruendung

Alle beruehrten Sub-Areas GF (Spezifikation und Planung); die
BF-Sub-Area Build- und Doku-Tooling (`.d-check.yml`) wurde gemaess
Konvergenz-Auftrag mit nachgefuehrter Deklaration geaendert.
