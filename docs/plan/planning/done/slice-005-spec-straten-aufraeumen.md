# Slice slice-005: Spec-Straten aufraeumen (Stratifizierung)

**Status:** done

**Welle:** ohne Welle (Spec-Pflege)

**Bezug:** [slice-004](slice-004-spezifikation-stratum.md),
[AR-P-003](../../../../spec/architecture.md),
[M-002](../../../../spec/lastenheft.md),
[M-003](../../../../spec/lastenheft.md)

**Autor:** Dietmar Burkard. **Datum:** 2026-06-12.

---

## 1. Ziel

`spec/architecture.md` auf die Stratum-Rolle der Baseline
zurueckschneiden (Diagramme und Komponentensicht, keine eigenen
Anforderungen) und die dort gewachsenen normativen Festlegungen in
`spec/spezifikation.md` ueberfuehren.

## 2. Definition of Done

- [x] Datenfluesse (Aufzeichnung, Replay) mit verbindlicher
      Pruefreihenfolge in Spezifikation Abschnitt 2.
- [x] Event-Pflichtfelder und Persistenz-Datenklassen in
      Spezifikation Abschnitt 3.
- [x] Architektur: Persistenz-, Event- und Sicherheitsabschnitte auf
      Sicht plus Verweis reduziert; keine "muessen"-Saetze mehr.
- [x] Haengende Referenz `NFQ-005` aus
      [AR-P-007](../../../../spec/architecture.md) entfernt.
- [x] Architektur-Version auf 0.2.0; Zweck-Abschnitt benennt die
      Stratum-Rollen.
- [x] `make gates` gruen.

## 3. Plan (vor Code)

| Datei / Komponente | Aenderungs-Art | Begruendung |
| ------------------ | -------------- | ----------- |
| `spec/spezifikation.md` | update | normative Inhalte aufnehmen (Abschnitte 2 und 3) |
| `spec/architecture.md` | update | auf Sichtrolle reduzieren, Kapitel neu nummeriert |

## 4. Trigger

Nutzerauftrag 2026-06-12: Aufraeumen von `spec/architecture.md` nach
der Spec-Stratifizierung des Regelwerks.

## 5. Closure-Trigger

DoD vollstaendig, `make gates` gruen, Commit mit Kennungs-Referenz.

## 6. Risiken und offene Punkte

- Kennungs-Links zeigen weiterhin auf Dateien statt auf
  Kapitel-Anker; Anker-Praezision ist moeglicher Folgeausbau (die
  Kennungen sind Tabellenzeilen, keine Ueberschriften — siehe
  Closure-Notiz).

## 7. Closure-Notiz (nach `done/`)

- Funktioniert: Die Verschiebung war verlustfrei moeglich, weil jede
  normative Aussage der Architektur bereits Lastenheft-Bezug hatte;
  die Architektur behaelt nur Sicht und Verantwortungsgrenzen.
- Beobachtung: `spec/architecture.md` war vor der Stratifizierung
  entstanden und hatte die Spezifikations-Rolle mit uebernommen —
  ein typischer Befund, wenn das mittlere Stratum spaeter dazukommt.
- Folgearbeiten: keine neuen `open/`-Eintraege.

## 8. Sub-Area-Modus-Begruendung

Alle beruehrten Sub-Areas GF (Spezifikation und Planung).
