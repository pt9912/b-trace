# CO-003: Traceability nicht mechanisiert

**Status:** Aktiv

**Datum angelegt:** 2026-06-12. **Letzte Pruefung:** 2026-06-12.

**Betroffenes Gate:** — (fehlender Sensor: kein Commit-Hook, kein
CI-Check fuer Kennungs-Referenzen)

**Geltungsbereich:** Commits und PRs im gesamten Repo

**Folge-Slice:** — entsteht beim Zuenden des Triggers

---

## Begruendung

Die Traceability-Regel (jede relevante Aenderung referenziert
mindestens eine Kennung) gilt nur konventionell. Eine CI-Plattform
ist noch nicht entschieden (RM-OPEN-006), an die ein Hook oder Check
gebunden werden koennte.

## Aufloesungs-Trigger

Start der Implementierungsphase (M1) oder dreimaliges beobachtetes
Versagen der konventionellen Regel (Steering-Loop-Schwelle), je
nachdem was zuerst eintritt.

## Geltungs-Konfiguration

| Datei | Zeile/Section | Wert |
| ----- | ------------- | ---- |
| `harness/README.md` | Traceability rules | Regel als konventionell markiert |

## Verifikation (nach Aufloesung)

- [ ] Commit-Hook oder CI-Check prueft mindestens eine Kennung pro
      Commit/PR.
- [ ] Traceability rules in `harness/README.md` verweisen auf die
      Mechanik statt auf Konvention.
- [ ] `make gates` gruen.
- [ ] Datei nach `docs/plan/carveouts/done/` bewegt (reiner `git mv`).

## Geschichte

| Datum | Ereignis | Verweis |
| ----- | -------- | ------- |
| 2026-06-12 | Angelegt | [slice-001](../planning/done/slice-001-harness-bootstrap.md) |
