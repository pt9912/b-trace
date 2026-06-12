# Carveout-Index

Ein Carveout ist eine dokumentierte Ausnahme gegenueber der
Harness-Baseline, immer mit Aufloesungs-Trigger. Ein Carveout pro
Datei (`CO-<NNN>-<kurztitel>.md`), Vorlage:
`lab/templates/docs/plan/carveouts/carveout.template.md` im Kurs-Repo.

Aufgeloeste Carveouts wandern per `git mv` nach `done/`. Carveouts
ohne lebendigen Trigger sind Wildwuchs und werden im Audit entfernt.

| ID | Titel | Status | Trigger (Kurzform) |
| -- | ----- | ------ | ------------------ |
| [CO-001](CO-001-spezifikation-stratum.md) | Spezifikations-Stratum fehlt | Aktiv | Entscheidung [RM-OPEN-001](../planning/in-progress/roadmap.md)/[RM-OPEN-002](../planning/in-progress/roadmap.md) |
| [CO-002](CO-002-code-sensors.md) | Keine Code-Sensors | Aktiv | [RM-M1-01](../planning/in-progress/roadmap.md) / [RM-M1-09](../planning/in-progress/roadmap.md) |
| [CO-003](CO-003-traceability-mechanik.md) | Traceability nicht mechanisiert | Aktiv | M1-Start oder Steering-Loop-Schwelle |
| [CO-004](CO-004-durchsetzungsschicht.md) | Durchsetzungsschicht fehlt | Aktiv | erster Agenten-Implementierungs-Slice |
