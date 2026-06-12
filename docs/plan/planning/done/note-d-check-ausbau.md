# Notiz: d-check-Ausbau auf ids- und matrix-Modul

**Dokumenttyp:** Vorabklaerung / Trigger-Watch
**Status:** Umgesetzt (2026-06-12; beide Items per Nutzerauftrag
aktiviert, siehe [slice-002](slice-002-d-check-ids-matrix.md))
**Bezug:** [ADR-0002](../../adr/0002-harness-bootstrap.md),
[CO-003](../../carveouts/CO-003-traceability-mechanik.md),
`.d-check.yml`

---

## Zweck

d-check v0.2.0 bietet ueber `links` und `anchors` hinaus Module, die
Harness-Regeln mechanisieren koennten. Diese Notiz haelt den
moeglichen Ausbau fest, bis sein Trigger zuendet.

## Item F-DC-01: ids-Modul (Linkpflicht fuer Kennungen)

**Trigger:** Wiederholt veraltete oder nicht aufloesbare
Kennungs-Nennungen in der Doku (Steering-Loop-Schwelle: dreimal),
oder Start von M1.

**Scope-Skizze:**

- Muster deklarieren: `ADR-\d{4}` → `docs/plan/adr/`,
  `CO-\d{3}` → `docs/plan/carveouts/`,
  `MR-\d{3}` → `harness/conventions.md`,
  `RM-(M\d|OPEN)-\d+` → Roadmap.
- Bestehende nackte Kennungen im Fliesstext verlinken (einmalige
  Aufraeumarbeit, betrifft u. a. Harness- und Carveout-Dateien).
- Teilbeitrag zu
  [CO-003](../../carveouts/CO-003-traceability-mechanik.md)
  (Doku-Seite der Traceability), ersetzt aber nicht den Commit-Hook.

## Item F-DC-02: matrix-Modul (Referenz-Richtung)

**Trigger:** Erste Abwaerts-Referenz aus einem Spec-Stratum auf ADRs
oder Planning-Artefakte wird im Review gefunden, oder Anlage von
`spec/spezifikation.md` (Aufloesung
[CO-001](../../carveouts/CO-001-spezifikation-stratum.md)).

**Scope-Skizze:**

- Dokumentklassen deklarieren: spec-straten, adr, slice.
- Regeln: Spec-Straten verweisen nie abwaerts auf ADRs oder Slices
  (Stable Dependencies Principle aus der Baseline).
- Vorbild: Selbstkonfiguration des d-check-Repos.

## Trigger-Watch-Disziplin

Beim Zuenden eines Triggers wird ein Plan unter
`docs/plan/planning/in-progress/` angelegt; die Sensors-Tabelle in
[harness/README.md](../../../../harness/README.md) wird beim Ausbau
nachgefuehrt.
