# AGENTS.md — Briefing fuer AI-Coding-Agenten

## 1. Was diese Datei ist

Onboarding-Briefing fuer jede AI-Session, die in diesem Repo Code oder
Dokumentation aendert. Sie verweist auf die kanonischen Quellen und
formuliert die Hard Rules, die immer einzuhalten sind.

**Bei Konflikt zwischen dieser Datei und einer kanonischen Quelle gilt
die kanonische Quelle** (Source Precedence — siehe
[harness/README.md](harness/README.md)).

Strukturregeln (ID-Schemata, Verzeichniskonvention, Adaptionen
gegenueber der Baseline, Modus-Deklarationen pro Sub-Area) leben in
[harness/conventions.md](harness/conventions.md).

Das Betriebsregelwerk der adoptierten Baseline in Agenten-Kurzform
liegt unter
<https://raw.githubusercontent.com/pt9912/ai-harness-course/main/kurs/de/agents-regelwerk.md>
— einmal pro Session lesen, bevor der Workflow (Abschnitt 6) startet.
Derivativ: bei Konflikt gelten die kanonischen Quellen; adoptierter
Stand steht in [harness/conventions.md](harness/conventions.md),
Abschnitt Baseline.

## 2. Kanonische Quellen (Source Precedence)

In dieser Reihenfolge:

1. [spec/lastenheft.md](spec/lastenheft.md) — vertraglich
   abnahmebindend.
2. `spec/spezifikation.md` — noch nicht vorhanden (MR-002, CO-001).
3. [spec/architecture.md](spec/architecture.md) — Komponenten- und
   Verantwortungssicht.
4. [docs/plan/adr/README.md](docs/plan/adr/README.md) — ADR-Index.
5. [docs/plan/planning/in-progress/roadmap.md](docs/plan/planning/in-progress/roadmap.md)
   — Roadmap und aktuelle Welle.
6. [README.md](README.md) — Projekt-Ueberblick.
7. **AGENTS.md (diese Datei).**
8. [harness/README.md](harness/README.md) — Harness-Einstieg.

## 3. Harte Regeln

### 3.1 Doku-Gates laufen ueber make und Docker

Der Doku-Check laeuft ausschliesslich ueber `make docs-check`
(Docker-Image, Digest-gepinnt). Kein lokales Tool-Install, keine
manuellen Ad-hoc-Pruefungen als Gate-Ersatz.

### 3.2 git mv + Inhaltsaenderung = zwei Commits

Wenn eine Datei verschoben **und** der Inhalt umgeschrieben wird:
erst `git mv` als eigener Commit, dann die Inhaltsaenderung.
Sonst bricht die Rename-Detection und `git log --follow` wird
unzuverlaessig.

### 3.3 ADRs sind nach Accepted immutable

Eine ADR mit Status `Accepted` wird nicht inhaltlich ueberschrieben.
Korrekturen entstehen als neue ADR mit `Supersedes ADR-NN`.

### 3.4 Gates duerfen nicht ohne ADR gelockert werden

Jede Schwellen-Senkung (Coverage, Linter-Strenge, Architekturregel)
ist eine ADR, kein PR-Kommentar.

### 3.5 Architektur ist sprach- und meilensteinfrei

`spec/architecture.md` referenziert ADRs und Module, aber keine
Wellen, Slices, Commit-Hashes oder Closure-Daten. Die zeitliche
Schicht lebt in `docs/plan/planning/`.

### 3.6 Lastenheft nur per Change Request

Das Lastenheft wird nie beilaeufig editiert. Jede Aenderung traegt
einen Eintrag in der Aenderungshistorie mit neuer Version.

### 3.7 Kein Replay gegen reale Zielsysteme

Kein Code, Test oder Beispiel spricht reale Zielsysteme an. Grenzen
siehe [Replay-Sicherheit](docs/user/replay-safety.md).

### 3.8 Offene Entscheidungen nicht implizit treffen

Roadmap-Punkte `RM-OPEN-xxx` (Framework, Build-System, CI, ...)
werden per ADR geschlossen, nie nebenbei im Code gesetzt.

## 4. Quality Gates

Nur Targets, die existieren und ohne Gradle-Build wirksam sind
(Details und Bindung: [harness/README.md](harness/README.md)).

| Target | Zweck |
| ------ | ----- |
| `make docs-check` | Markdown-Links und Anker pruefen (d-check) |
| `make gates` | alle inneren Gates; mandatory vor Handoff |
| `make docker-docs-check` | Doku-Check im Docker-Build |

Code-Gates (Build, Test, Architektur, Coverage) existieren noch nicht
— siehe CO-002. Sie werden erst behauptet, wenn sie real laufen.

## 5. Dokumentations-Regeln

- Kennungen muessen in Commits/PRs referenziert sein. Vergeben werden
  sie beim Spec-/ADR-Schreiben nach dem in
  [harness/conventions.md](harness/conventions.md) (MR-001)
  deklarierten Schema — nie ad hoc im PR.
- Neue ADRs muessen den [ADR-Index](docs/plan/adr/README.md)
  aktualisieren.
- Roadmap- und Status-Geschichte lebt in `docs/plan/planning/`, nicht
  in `spec/architecture.md`.
- Quality-Gate-Definitionen leben in
  [docs/user/quality.md](docs/user/quality.md).
- Neue Texte in umlautfreier Schreibweise (`ue`, `ae`, `oe`, `ss`).

## 6. Minimal Agent Workflow

Pro Slice:

1. [harness/README.md](harness/README.md) lesen.
2. Relevante kanonische Quelle lesen (Source Precedence beachten).
3. Betroffene Requirement-/ADR-IDs identifizieren.
4. Kleinste sinnvolle Aenderung planen.
5. Engsten nuetzlichen Sensor laufen lassen.
6. Repo-weiten Gate-Lauf vor Handoff: `make gates`.
7. Doku/Indizes aktualisieren, falls ein oeffentlicher Vertrag
   beruehrt ist.
8. Ausgefuehrte Sensors und verbleibende Risiken berichten — keine
   Erfolgsmeldung ohne Gate-Ausfuehrung.
