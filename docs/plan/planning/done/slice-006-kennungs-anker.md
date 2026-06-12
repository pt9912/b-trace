# Slice slice-006: Kennungs-Links auf Kapitel-Anker

**Status:** done

**Welle:** ohne Welle (Doku-Pflege)

**Bezug:** [slice-003](slice-003-ids-vollausbau.md),
[slice-005](slice-005-spec-straten-aufraeumen.md)

**Autor:** Dietmar Burkard. **Datum:** 2026-06-12.

---

## 1. Ziel

Alle Kennungs-Links repo-weit von Datei-Ebene auf den Kapitel-Anker
der jeweiligen Definition praezisieren (z. B.
`lastenheft.md#71-backend` fuer `T-BE-*`).

## 2. Definition of Done

- [x] Jede Lastenheft-Familie zeigt auf ihr definierendes Kapitel,
      `AR-*` auf die Architektur-Kapitel, `RM-*` auf Meilenstein-
      bzw. Offene-Punkte-Ueberschrift, `MR-*` auf den jeweiligen
      Adaptions-Eintrag.
- [x] Konvention in `harness/conventions.md` festgeschrieben:
      Kennungs-Links zeigen auf den Kapitel-Anker der Definition.
- [x] `make gates` gruen (anchors-Modul validiert alle Slugs).

## 3. Plan (vor Code)

| Datei / Komponente | Aenderungs-Art | Begruendung |
| ------------------ | -------------- | ----------- |
| alle Markdown-Dateien mit Kennungs-Links | update | mechanische Anker-Ergaenzung pro ID-Familie |
| `harness/conventions.md` | update | Anker-Konvention |

## 4. Trigger

Nutzer-Hinweis 2026-06-12: Die definierenden Kapitel sind als
Link-Ziele vorhanden; Datei-Links waren unnoetig unpraezise.

## 5. Closure-Trigger

DoD vollstaendig, `make gates` gruen, Commit mit Kennungs-Referenz.

## 6. Risiken und offene Punkte

- Kapitel-Umbenennungen im Lastenheft aendern die Slugs; das
  `anchors`-Modul macht solche Brueche sofort sichtbar (kein stilles
  Verrotten).
- Per-ID-Anker (eine Ueberschrift je Anforderung, d-check-Stil)
  blieben bewusst aus: Das waere eine Formaenderung des vertraglichen
  Lastenhefts und gehoert in eine Lastenheft-Revision (Change
  Request), z. B. zusammen mit dem Pflichtenheft zu
  [T-BE-002](../../../../spec/lastenheft.md#71-backend) /
  [T-BE-003](../../../../spec/lastenheft.md#71-backend).

## 7. Closure-Notiz (nach `done/`)

- Funktioniert: Familie-zu-Kapitel ist eine stabile 1:1-Zuordnung;
  die mechanische Ersetzung traf alle Links, und das anchors-Modul
  bestaetigte alle Slugs im ersten Lauf.
- Folgearbeiten: keine.

## 8. Sub-Area-Modus-Begruendung

Alle beruehrten Sub-Areas GF (Spezifikation und Planung,
Anwender-Doku, Harness-Doku).
