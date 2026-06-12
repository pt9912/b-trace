# CO-001: Spezifikations-Stratum fehlt

**Status:** Aufgeloest (2026-06-12,
[slice-004](../../planning/done/slice-004-spezifikation-stratum.md))

**Datum angelegt:** 2026-06-12. **Letzte Pruefung:** 2026-06-12.

**Betroffenes Gate:** — (kein Make-Target; Luecke in der Source
Precedence, Rang 2)

**Geltungsbereich:** `spec/`

**Folge-Slice:**
[slice-004](../../planning/done/slice-004-spezifikation-stratum.md)
(aufgeloest per Nutzerauftrag vor der Entscheidung von
[RM-OPEN-001](../../planning/in-progress/roadmap.md#offene-roadmap-punkte) und
[RM-OPEN-002](../../planning/in-progress/roadmap.md#offene-roadmap-punkte))

---

## Begruendung

Das Projekt ist in der Anforderungsphase. Es gibt noch keine
technischen Festlegungen, die ein eigenes, fortschreibbares
Spezifikations-Stratum (`spec/spezifikation.md`) rechtfertigen;
technische Festlegungen mit Abnahmebezug traegt uebergangsweise das
Lastenheft ([MR-002](../../../../harness/conventions.md#mr-002--source-precedence-mit-unbesetztem-rang-2)).

## Aufloesungs-Trigger

Die erste technische Festlegung, die nicht in das Lastenheft gehoert —
typischerweise die Entscheidung von [RM-OPEN-001](../../planning/in-progress/roadmap.md#offene-roadmap-punkte) (Backend-Framework)
oder [RM-OPEN-002](../../planning/in-progress/roadmap.md#offene-roadmap-punkte) (Build-System) per ADR.

## Geltungs-Konfiguration

| Datei | Zeile/Section | Wert |
| ----- | ------------- | ---- |
| `harness/README.md` | Source precedence, Rang 2 | als nicht vorhanden markiert |
| `harness/conventions.md` | [MR-002](../../../../harness/conventions.md#mr-002--source-precedence-mit-unbesetztem-rang-2) | Adaption deklariert |

## Verifikation (nach Aufloesung)

- [x] `spec/spezifikation.md` existiert und traegt erste verbindliche
      Festlegungen (aus dem Lastenheft uebernommen; die erste
      ADR-Schaerfung folgt mit der Entscheidung von
      [T-BE-002](../../../../spec/lastenheft.md#71-backend) /
      [T-BE-003](../../../../spec/lastenheft.md#71-backend)).
- [x] Source-Precedence-Tabellen in `harness/README.md` und
      `AGENTS.md` verlinken Rang 2.
- [x] [MR-002](../../../../harness/conventions.md#mr-002--source-precedence-mit-unbesetztem-rang-2) per neuem `MR`-Eintrag
      aufgehoben ([MR-006](../../../../harness/conventions.md#mr-006--aufhebung-von-mr-002-rang-2-besetzt)).
- [x] `make gates` gruen.
- [x] Datei nach `docs/plan/carveouts/done/` bewegt (reiner `git mv`).

## Geschichte

| Datum | Ereignis | Verweis |
| ----- | -------- | ------- |
| 2026-06-12 | Angelegt | [slice-001](../../planning/done/slice-001-harness-bootstrap.md) |
| 2026-06-12 | Aufgeloest per Nutzerauftrag | [slice-004](../../planning/done/slice-004-spezifikation-stratum.md) |
