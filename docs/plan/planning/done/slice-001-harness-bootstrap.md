# Slice slice-001: Harness-Bootstrap

**Status:** done

**Welle:** ohne Welle (Bootstrap)

**Bezug:** ADR-0002, CO-001..CO-004, MR-000..MR-004

**Autor:** Dietmar Burkard. **Datum:** 2026-06-12.

---

## 1. Ziel

Den Harness fuer `b-trace` nach der Baseline des AI-Harness-Kurses
bootstrappen: kanonische Quellen-Rangfolge, Agent-Briefing,
Konventionsspeicher, Carveout-Register und ADR-Index anlegen.

## 2. Definition of Done

- [x] `AGENTS.md`, `harness/README.md` und `harness/conventions.md`
      existieren und folgen den Pflichtgliederungen der Templates.
- [x] ADR-0002 (Accepted) dokumentiert die Adoption;
      [ADR-Index](../../adr/README.md) existiert.
- [x] Fehlende Mechanik ist als CO-001 bis CO-004 mit
      Aufloesungs-Trigger deklariert
      ([Carveout-Index](../../carveouts/README.md)).
- [x] Abweichungen gegenueber der Baseline sind als MR-000 bis MR-004
      deklariert.
- [x] `docs/reviews/` existiert mit Namenskonvention.
- [x] Root-README verlinkt die neuen Artefakte.
- [x] `make gates` gruen.

## 3. Plan (vor Code)

| Datei / Komponente | Aenderungs-Art | Begruendung |
| ------------------ | -------------- | ----------- |
| `AGENTS.md` | neu | Agent-Briefing (Template-Adoption) |
| `harness/README.md`, `harness/conventions.md` | neu | Harness-Einstieg und Konventionsspeicher |
| `docs/plan/adr/README.md`, `docs/plan/adr/0002-harness-bootstrap.md` | neu | ADR-Index und Adoptions-Entscheidung |
| `docs/plan/carveouts/` | neu | Index plus CO-001..CO-004 |
| `docs/reviews/README.md` | neu | Review-Ablage |
| `README.md` | update | Doku-Verweise und Struktur |

## 4. Trigger

Nutzerauftrag: GF/BF-Bootstrapping nach Lektuere des
Agents-Regelwerks (2026-06-12).

## 5. Closure-Trigger

DoD vollstaendig, `make gates` gruen, Commit mit Kennungs-Referenz.

## 6. Risiken und offene Punkte

- Baseline referenziert `main` des Kurs-Repos; bei neuen Kurs-Wellen
  kann der adoptierte Stand driften (Re-Evaluierungs-Trigger in
  ADR-0002).
- Die Durchsetzung bleibt bis M1 konventionell (CO-003, CO-004).

## 7. Closure-Notiz (nach `done/`)

- Funktioniert: Die bestehende Struktur aus ADR-0001 deckte die
  Baseline-Verzeichniskonvention bereits weitgehend; der Bootstrap
  war reine Doku-Arbeit ohne Konflikt mit kanonischen Quellen.
- Anders als geplant: Der erste Wurf der Harness-Dateien entstand aus
  der Regelwerk-Zusammenfassung statt aus den Templates und musste
  auf die Pflichtgliederungen der Templates umgestellt werden.
- Steering-Loop-Lerneintrag: Vor dem Anlegen von Harness-Artefakten
  immer zuerst die verkoerperte Form (`lab/templates/` im Kurs-Repo)
  laden, nicht aus der Regelwerk-Prosa rekonstruieren — die
  Template-Pfade stehen im Regelwerk selbst.
- Folgearbeiten: keine neuen `open/`-Eintraege; alle bekannten
  Luecken sind als CO-001..CO-004 erfasst.

## 8. Sub-Area-Modus-Begruendung

Alle beruehrten Sub-Areas GF (Spezifikation und Planung,
Anwender-Doku, Root-Doku); die BF-Sub-Area Build-Tooling wurde nicht
veraendert, ihre Sensor-Deklaration nur dokumentiert. Details:
Modus-Deklaration in
[harness/conventions.md](../../../../harness/conventions.md).
