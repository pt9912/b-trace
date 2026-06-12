# CO-002: Keine Code-Sensors

**Status:** Aktiv

**Datum angelegt:** 2026-06-12. **Letzte Pruefung:** 2026-06-12.

**Betroffenes Gate:** `make gates` (traegt nur `docs-check`; Build-,
Test-, Architektur- und Coverage-Gates fehlen)

**Geltungsbereich:** gesamtes Repo (es existiert kein Code)

**Folge-Slice:** — entsteht beim Zuenden des Triggers (Bezug:
RM-M1-01, RM-M1-09)

---

## Begruendung

Bootstrap: Es existiert kein Gradle-Build, also gibt es nichts, woran
Build-, Test-, Architektur- oder Coverage-Gates pruefbar waeren. Die
Coverage-Ziele COV-001 bis COV-003 und die Architektur-Gates aus dem
Lastenheft sind damit deklariert, aber noch nicht durchgesetzt.

## Aufloesungs-Trigger

RM-M1-01 (Projekt- und Modulstruktur): Mit dem ersten Build werden
Gradle check, Architekturtests und Coverage-Gates an `make gates`
gebunden (RM-M1-09) und in der Sensors-Tabelle in
`harness/README.md` deklariert.

## Geltungs-Konfiguration

| Datei | Zeile/Section | Wert |
| ----- | ------------- | ---- |
| `Makefile` | `run_gradle`-Define | ueberspringt Gradle-Aufrufe, solange kein Build existiert |
| `harness/README.md` | Sensors-Tabelle | Code-Gates als nicht behauptet markiert |

## Verifikation (nach Aufloesung)

- [ ] `make gates` enthaelt Build-, Test-, Architektur- und
      Coverage-Gates und ist gruen.
- [ ] Sensors-Tabelle in `harness/README.md` traegt die neuen Gates
      mit Vertrag und Bindung.
- [ ] Sub-Area Build-Tooling graduiert zu GF
      (`harness/conventions.md`, Modus-Deklaration).
- [ ] Datei nach `docs/plan/carveouts/done/` bewegt (reiner `git mv`).

## Geschichte

| Datum | Ereignis | Verweis |
| ----- | -------- | ------- |
| 2026-06-12 | Angelegt | [slice-001](../planning/done/slice-001-harness-bootstrap.md) |
