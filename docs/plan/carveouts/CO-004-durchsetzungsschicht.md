# CO-004: Durchsetzungsschicht fehlt

**Status:** Aktiv

**Datum angelegt:** 2026-06-12. **Letzte Pruefung:** 2026-06-12.

**Betroffenes Gate:** — (Tool-Call-Gate und Handoff-Gate existieren
nicht)

**Geltungsbereich:** Agent-Schleife; `.harness/` (Skills, Allowlists,
Middlewares) ist nicht angelegt

**Folge-Slice:** — entsteht beim Zuenden des Triggers

---

## Begruendung

Es gibt noch keine Agent-Schleife mit Implementierungs-Slices, an die
ein Tool-Call- oder Handoff-Gate gebunden werden koennte. Einziger
Bindepunkt ist das Workflow-Skelett in `harness/README.md` — der
schwaechste der drei Bindepunkte ([MR-004](../../../harness/conventions.md#mr-004--keine-harness-mechanik)).

## Aufloesungs-Trigger

Der erste Implementierungs-Slice, der von einem Agenten umgesetzt
wird (fruehestens M1-Start).

## Geltungs-Konfiguration

| Datei | Zeile/Section | Wert |
| ----- | ------------- | ---- |
| `harness/conventions.md` | [MR-004](../../../harness/conventions.md#mr-004--keine-harness-mechanik) | Adaption deklariert |

## Verifikation (nach Aufloesung)

- [ ] `.harness/` mit mindestens einem gebundenen Mechanismus
      (Skill, Allowlist oder Middleware) existiert.
- [ ] Handoff-Gate prueft, dass `make gates` vor der Fertig-Meldung
      lief.
- [ ] [MR-004](../../../harness/conventions.md#mr-004--keine-harness-mechanik) per neuem `MR`-Eintrag aufgehoben.
- [ ] Datei nach `docs/plan/carveouts/done/` bewegt (reiner `git mv`).

## Geschichte

| Datum | Ereignis | Verweis |
| ----- | -------- | ------- |
| 2026-06-12 | Angelegt | [slice-001](../planning/done/slice-001-harness-bootstrap.md) |
