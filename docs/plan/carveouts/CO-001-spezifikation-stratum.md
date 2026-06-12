# CO-001: Spezifikations-Stratum fehlt

**Status:** Aktiv

**Datum angelegt:** 2026-06-12. **Letzte Pruefung:** 2026-06-12.

**Betroffenes Gate:** — (kein Make-Target; Luecke in der Source
Precedence, Rang 2)

**Geltungsbereich:** `spec/`

**Folge-Slice:** — entsteht beim Zuenden des Triggers (Bezug:
[RM-OPEN-001](../planning/in-progress/roadmap.md), [RM-OPEN-002](../planning/in-progress/roadmap.md))

---

## Begruendung

Das Projekt ist in der Anforderungsphase. Es gibt noch keine
technischen Festlegungen, die ein eigenes, fortschreibbares
Spezifikations-Stratum (`spec/spezifikation.md`) rechtfertigen;
technische Festlegungen mit Abnahmebezug traegt uebergangsweise das
Lastenheft ([MR-002](../../../harness/conventions.md)).

## Aufloesungs-Trigger

Die erste technische Festlegung, die nicht in das Lastenheft gehoert —
typischerweise die Entscheidung von [RM-OPEN-001](../planning/in-progress/roadmap.md) (Backend-Framework)
oder [RM-OPEN-002](../planning/in-progress/roadmap.md) (Build-System) per ADR.

## Geltungs-Konfiguration

| Datei | Zeile/Section | Wert |
| ----- | ------------- | ---- |
| `harness/README.md` | Source precedence, Rang 2 | als nicht vorhanden markiert |
| `harness/conventions.md` | [MR-002](../../../harness/conventions.md) | Adaption deklariert |

## Verifikation (nach Aufloesung)

- [ ] `spec/spezifikation.md` existiert und traegt die erste
      ADR-geschaerfte Festlegung.
- [ ] Source-Precedence-Tabellen in `harness/README.md` und
      `AGENTS.md` verlinken Rang 2.
- [ ] [MR-002](../../../harness/conventions.md) per neuem `MR`-Eintrag aufgehoben.
- [ ] `make gates` gruen.
- [ ] Datei nach `docs/plan/carveouts/done/` bewegt (reiner `git mv`).

## Geschichte

| Datum | Ereignis | Verweis |
| ----- | -------- | ------- |
| 2026-06-12 | Angelegt | [slice-001](../planning/done/slice-001-harness-bootstrap.md) |
