# Harness-Konventionen

## Purpose

Diese Datei deklariert die repo-lokalen Strukturregeln von `b-trace`
gegenueber der adoptierten Harnesskonvention (Baseline). Sie ist der
Default-Ort fuer:

- **Adaptionen** gegenueber der Baseline (mit Begruendung und
  Aufloesungs-Trigger),
- **ID-Schema-Deklaration**,
- **Zusatzklassen-Deklarationen** fuer die Sensors-Bindung,
- **Modus-Deklarationen** pro Sub-Area (Greenfield / Brownfield /
  Hybrid) inklusive Konvergenz-Auftrag bei BF.

Bei Konflikt zwischen dieser Datei und einer kanonischen Quelle gilt
die kanonische Quelle (Source Precedence in
[README.md](README.md)). Diese Datei ist massgeblich fuer
Form-Fragen, nicht autoritativ ueber Inhalt.

## Baseline

- **Konvention:** AI-Harness-Kurs (pt9912/ai-harness-course)
- **Stand:** Kurs-Welle 18 · 2026-06-11 · 21:08 CEST
- **Datum der Adoption:** 2026-06-12

## Adoptierte Konventions-Quellen

- **Extern (Lehrmaterial):**
  <https://github.com/pt9912/ai-harness-course>
- **Extern (Agenten-Regelwerk):**
  <https://raw.githubusercontent.com/pt9912/ai-harness-course/main/kurs/de/agents-regelwerk.md>
  — adoptierter Stand: Kurs-Welle 18 · 2026-06-11 · 21:08 CEST.
  Referenz aktuell auf `main`; fuer harte Reproduzierbarkeit bei
  Bedarf auf Commit/Tag pinnen.
- **In-Repo (verkoerperte Form):** adoptiert aus `lab/templates/` des
  Kurs-Repos (Stand 2026-06-12) in `AGENTS.md`, `harness/`,
  `docs/plan/adr/`, `docs/plan/carveouts/`, `docs/plan/planning/`
  und `docs/reviews/`.

## Adaptions-Block

### MR-000 — Baseline-Aussage

- **Datum:** 2026-06-12
- **Geltungsbereich:** gesamtes Repo
- **Adaption:** keine inhaltlichen Adaptionen gegenueber dem
  Baseline-Default fuer Verzeichniskonvention, Lifecycle-Regeln und
  Carveout-Disziplin — ausser den nachfolgend deklarierten
  `MR`-Eintraegen.
- **Begruendung:** Initial-Setzung beim Harness-Bootstrap
  ([ADR-0002](../docs/plan/adr/0002-harness-bootstrap.md)).
- **Aufloesungs-Trigger:** permanent.

### MR-001 — ID-Schema des bestehenden Lastenhefts

- **Datum:** 2026-06-12
- **Geltungsbereich:** `spec/`, `docs/plan/`
- **Adaption:** Statt des Baseline-Defaults (`<PREFIX>-FA-<NN>` /
  `<PREFIX>-QA-<NN>`) gelten die Schemata des bestehenden
  Lastenhefts 1.1 (`M-`, `W-`, `A-`, `PE-`, `F-<BEREICH>-`, `AB-`,
  `ROLE-`, `D-`, `IF-`, `DEP-`, `COV-`, `Q-*`), der Roadmap
  (`RM-Mn-xx`, `RM-OPEN-xxx`), der Trigger-Watch (`F-M1-xx`) sowie
  `ADR-NNNN`, `CO-NNN`, `MR-NNN` und `slice-NNN`.
- **Begruendung:** Das Lastenheft existierte vor der Adoption;
  Kennungen werden nie umnummeriert, verworfene Kennungen bleiben als
  verworfen markiert stehen.
- **Aufloesungs-Trigger:** permanent.

### MR-002 — Source Precedence mit unbesetztem Rang 2

- **Datum:** 2026-06-12
- **Geltungsbereich:** `harness/README.md`, Abschnitt Source precedence
- **Adaption:** Die Spec-Stratifizierung ist mit drei Raengen
  deklariert, aber `spec/spezifikation.md` (Rang 2) existiert noch
  nicht. Technische Festlegungen mit Abnahmebezug traegt
  uebergangsweise das Lastenheft.
- **Begruendung:** Das Projekt ist in der Anforderungsphase; es gibt
  noch keine technischen Festlegungen, die ein eigenes Stratum
  rechtfertigen.
- **Aufloesungs-Trigger:** Aufloesung von
  [CO-001](../docs/plan/carveouts/CO-001-spezifikation-stratum.md).

### MR-003 — Planning-Lifecycle ohne `next/`-Stufe

- **Datum:** 2026-06-12
- **Geltungsbereich:** `docs/plan/planning/`
- **Adaption:** Lifecycle ist open → in-progress → done; die
  Baseline-Stufe `next/` (naechste Welle) ist nicht angelegt. `open/`
  traegt bis dahin auch die Trigger-Watch.
- **Begruendung:** Vor M1 gibt es keine Wellen-Planung mit mehr als
  einem gleichzeitig geplanten Slice.
- **Aufloesungs-Trigger:** erste Welle mit mehr als einem gleichzeitig
  geplanten Slice (typischerweise M1-Planung); dann wird `next/`
  angelegt und dieser Eintrag per neuem `MR` aufgehoben.

### MR-004 — Keine `.harness/`-Mechanik

- **Datum:** 2026-06-12
- **Geltungsbereich:** Durchsetzungsschicht
- **Adaption:** Kein `.harness/`-Verzeichnis (Skills, Allowlists,
  Middlewares), kein Tool-Call-Gate, kein Handoff-Gate. Einziger
  Bindepunkt ist das Workflow-Skelett in
  [harness/README.md](README.md).
- **Begruendung:** Es gibt noch keine Agent-Schleife mit
  Implementierungs-Slices, an die Gates gebunden werden koennten.
- **Aufloesungs-Trigger:** Aufloesung von
  [CO-004](../docs/plan/carveouts/CO-004-durchsetzungsschicht.md).

### MR-005 — Aufhebung von MR-003: next/-Stufe eingefuehrt

- **Datum:** 2026-06-12
- **Geltungsbereich:** `docs/plan/planning/`
- **Adaption:** hebt MR-003 auf. Der Planning-Lifecycle folgt wieder
  dem Baseline-Default open → next → in-progress → done;
  `docs/plan/planning/next/` ist angelegt.
- **Begruendung:** Nutzerentscheid zur Baseline-Konformitaet im Zuge
  der d-check-Scharfschaltung
  ([slice-002](../docs/plan/planning/done/slice-002-d-check-ids-matrix.md)).
- **Aufloesungs-Trigger:** permanent.

### MR-006 — Aufhebung von MR-002: Rang 2 besetzt

- **Datum:** 2026-06-12
- **Geltungsbereich:** `harness/README.md`, Abschnitt Source precedence
- **Adaption:** hebt MR-002 auf. `spec/spezifikation.md` existiert;
  die Source Precedence traegt alle drei Spec-Straten.
- **Begruendung:** Nutzerauftrag zur Anlage des
  Spezifikations-Stratums; Aufloesung von
  [CO-001](../docs/plan/carveouts/CO-001-spezifikation-stratum.md)
  ([slice-004](../docs/plan/planning/done/slice-004-spezifikation-stratum.md)).
- **Aufloesungs-Trigger:** permanent.

## Repo-lokale Schreib- und Strukturregeln

- Dokumentationssprache ist Deutsch; neue Texte in umlautfreier
  Schreibweise (`ue`, `ae`, `oe`, `ss`), Ausnahme: Zitate und
  Eigennamen.
- Die leeren Verzeichnisse `.agents/` und `.codex/` sind Altbestand
  ohne Funktion; `AGENTS.md` im Root ist das einzige Agent-Briefing.

## Zusatzklassen-Deklaration fuer Sensors-Bindung

| Klasse | Form | Bedeutung | Beispiel |
| ------ | ---- | --------- | -------- |
| — keine — | | | |

Die vier kanonischen Bindung-Klassen (ADR, Carveout, Schwelle,
Reproduzierbarkeit) gelten ohne Deklaration.

## Modus-Deklaration pro Sub-Area

| Sub-Area (Pfad / Modul) | Modus | Begruendung | Graduation-Bedingung / Folge-Slice |
| ----------------------- | ----- | ----------- | ---------------------------------- |
| Spezifikation und Planung (`spec/`, `docs/plan/`) | GF | Doku fuehrt; Lastenheft 1.1, Architektur, ADRs und Roadmap existieren vor jedem Code. | n/a (GF) |
| Anwender-Doku (`docs/user/`) | GF | Doku fuehrt; beschreibt geplantes Verhalten aus dem Lastenheft. | n/a (GF) |
| Anwendungscode (noch nicht vorhanden) | GF | Phase 0; Code folgt der Doku, erster Slice ist [RM-M1-01](../docs/plan/planning/in-progress/roadmap.md). | n/a (GF) |
| Build- und Doku-Tooling (`Makefile`, `Dockerfile`, `.d-check.yml`) | BF | Code existierte vor der Harness-Doku; Sensor-Deklaration folgt dem Tooling. | Graduation zu GF, wenn [CO-002](../docs/plan/carveouts/CO-002-code-sensors.md) aufgeloest ist und die Sensors-Tabelle in [README.md](README.md) alle gebundenen Gates traegt ([RM-M1-09](../docs/plan/planning/in-progress/roadmap.md)). Konvergenz-Auftrag: Sensor-Deklaration bei jeder Tooling-Aenderung nachfuehren. |

## Glossar

| Begriff | Bedeutung |
| ------- | --------- |
| IRS | Incident- & Replay-System, der Produktname-Zusatz aus dem Lastenheft |
| Trigger-Watch | Liste offener Folgearbeiten unter `docs/plan/planning/open/`, deren Eintraege erst beim Zuenden ihres Triggers zu Plaenen werden |
