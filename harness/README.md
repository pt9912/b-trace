# Harness

## Purpose

Dieser Harness verbindet bestehende Spezifikationen, ADRs,
Planning-Dokumente und Gates. Er ist kein Ersatz fuer `spec/` oder
`docs/`, sondern ein Einstiegspunkt fuer Menschen und
AI-Code-Agenten.

Wenn diese Datei einer kanonischen Quelle widerspricht, gewinnt die
kanonische Quelle, und diese Datei wird angepasst.

Strukturregeln (Verzeichniskonvention, ID-Schemata, Modus-Deklarationen
pro Sub-Area, Zusatzklassen fuer Sensors-Bindung) sowie Adaptionen
gegenueber der adoptierten Baseline leben in
[conventions.md](conventions.md). Diese Datei dupliziert sie nicht.

## Source precedence

| Rang | Datei | Charakter |
| ---- | ----- | --------- |
| 1 | [spec/lastenheft.md](../spec/lastenheft.md) | vertraglich abnahmebindend |
| 2 | `spec/spezifikation.md` | technisch fortschreibbar — noch nicht vorhanden, siehe [MR-002](conventions.md) und [CO-001](../docs/plan/carveouts/CO-001-spezifikation-stratum.md) |
| 3 | [spec/architecture.md](../spec/architecture.md) | Komponenten/Sequenzen, meilensteinfrei |
| 4 | [docs/plan/adr/README.md](../docs/plan/adr/README.md) | ADR-Index |
| 5 | [docs/plan/planning/in-progress/roadmap.md](../docs/plan/planning/in-progress/roadmap.md) | Roadmap und aktuelle Welle |
| 6 | [docs/user/](../docs/user) | Funktion, Replay-Sicherheit, Qualitaet |
| 7 | [README.md](../README.md) | Projekt-Ueberblick |
| 8 | [AGENTS.md](../AGENTS.md) | Agent-Briefing |
| 9 | diese Datei | Harness-Einstieg |

Bei Konflikt wird die niedriger rangierte Quelle angepasst, nie die
hoehere. ADRs duerfen die Spezifikation schaerfen, nie das Lastenheft.

## Guides (Feedforward-Quellen)

| Quelle | Inhalt |
| ------ | ------ |
| [spec/lastenheft.md](../spec/lastenheft.md) | Anforderungen, IDs, Akzeptanzkriterien |
| [spec/architecture.md](../spec/architecture.md) | Komponenten, Schichten, Constraints |
| [docs/plan/adr/](../docs/plan/adr/README.md) | Architekturentscheidungen |
| [docs/plan/planning/](../docs/plan/planning/in-progress/roadmap.md) | Roadmap und Slice-Plaene |
| [AGENTS.md](../AGENTS.md) | Hard Rules, Source Precedence, Workflow |
| [conventions.md](conventions.md) | repo-lokale Strukturregeln, Adaptions-Block (`MR-*`), Modus-Deklarationen |
| [Agents-Regelwerk der Baseline](https://raw.githubusercontent.com/pt9912/ai-harness-course/main/kurs/de/agents-regelwerk.md) | adoptiertes Betriebsregelwerk in Agenten-Kurzform; derivativ, Stand siehe [conventions.md](conventions.md), Abschnitt Baseline |

## Sensors (Feedback-Gates)

Nur Make-Targets, die real existieren und ohne Gradle-Build laufen.
Lauf-Wahrheit liegt lokal bei `make gates`; eine CI-Plattform ist noch
nicht entschieden
([RM-OPEN-006](../docs/plan/planning/in-progress/roadmap.md)).

| Target | Vertrag | Bindung |
| ------ | ------- | ------- |
| `make docs-check` | Markdown-Links und Anker im gesamten Repo loesen auf; nackte Kennungen im Fliesstext verlinken auf ihre Definition (ids); Spec-Straten verweisen nie abwaerts auf ADRs oder Slices (matrix) | Reproduzierbarkeit: d-check v0.2.0 Digest-gepinnt; [ADR-0002](../docs/plan/adr/0002-harness-bootstrap.md); ids/matrix: [slice-002](../docs/plan/planning/done/slice-002-d-check-ids-matrix.md) |
| `make gates` | alle inneren Gates; traegt aktuell nur `docs-check` | [CO-002](../docs/plan/carveouts/CO-002-code-sensors.md) |
| `make docker-docs-check` | wie `docs-check`, im Docker-Build | — |

**Nicht behauptet** (vorhanden, aber erst mit Gradle-Build wirksam):
`make ci-build`, `make docker-check`, `make docker-test`, `make clean`
— Bindung entsteht mit der Aufloesung von
[CO-002](../docs/plan/carveouts/CO-002-code-sensors.md).
**Nicht vorhanden** (geplant): Lint-, Architektur- und Coverage-Gates
([RM-M1-09](../docs/plan/planning/in-progress/roadmap.md),
[CO-002](../docs/plan/carveouts/CO-002-code-sensors.md)).

## Traceability rules

- Commits und PRs muessen mindestens eine Kennung nennen:
  Lastenheft-ID, Roadmap-ID (`RM-*`), ADR-Nummer oder Carveout
  (`CO-*`). Das ID-Schema ist in [conventions.md](conventions.md)
  ([MR-001](conventions.md)) deklariert.
- Neue oder geaenderte Anforderungen brauchen einen Beleg: Test, Gate,
  Demo oder ADR.
- Neue ADRs muessen im [ADR-Index](../docs/plan/adr/README.md)
  ergaenzt werden.
- Planning-Dokumente folgen dem Lifecycle open → next → in-progress
  → done ([MR-005](conventions.md) hebt [MR-003](conventions.md)
  auf); reine Verschiebungen als eigener `git mv`-Commit (AGENTS.md,
  Hard Rules).
- Die Doku-Seite (Linkpflicht fuer Kennungen) prueft das ids-Modul
  von d-check; eine mechanische Durchsetzung in Commits existiert
  noch nicht
  ([CO-003](../docs/plan/carveouts/CO-003-traceability-mechanik.md)),
  dort gilt die Regel konventionell.

## Safety and scope boundaries

- Kein Replay-bezogener Code oder Test spricht reale Zielsysteme an;
  es gelten die Grenzen aus
  [Replay-Sicherheit](../docs/user/replay-safety.md).
- Das Lastenheft wird nie beilaeufig editiert; Aenderungen nur als
  Change Request mit Eintrag in der Aenderungshistorie.
- Offene Roadmap-Entscheidungen (`RM-OPEN-xxx`) werden nicht implizit
  getroffen, sondern per ADR geschlossen.
- Abgrenzungen [A-001](../spec/lastenheft.md) bis
  [A-004](../spec/lastenheft.md) aus dem Lastenheft gelten: kein SIEM,
  kein Ticket-System, keine BPM-Engine, keine Legacy-Monolithen.

## Minimal agent workflow

1. Diese Datei lesen.
2. Relevante kanonische Quelle lesen (Source Precedence beachten).
3. Betroffene IDs identifizieren.
4. Kleinste sinnvolle Aenderung planen.
5. Engsten nuetzlichen Sensor laufen lassen.
6. Repo-weiten Gate-Lauf vor Handoff: `make gates`.
7. Doku und Indizes aktualisieren, falls ein oeffentlicher Vertrag
   beruehrt ist.
8. Ausgefuehrte Sensors und verbleibende Risiken berichten — keine
   Erfolgsmeldung ohne Gate-Ausfuehrung.
