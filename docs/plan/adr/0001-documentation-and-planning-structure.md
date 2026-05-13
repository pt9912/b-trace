# ADR 0001 — Dokumentations- und Planungsstruktur

**Status:** Accepted  
**Datum:** 2026-05-13  
**Bezug:** [Lastenheft](../../../spec/lastenheft.md), [Architektur](../../../spec/architecture.md)

---

## 1. Kontext

`b-trace` startet in der Anforderungs- und Architekturphase. Neben dem
Lastenheft braucht das Projekt eine stabile Dokumentationsstruktur fuer:

- normative Spezifikation,
- Architekturentscheidungen,
- Roadmap und Umsetzungsplaene,
- offene Folgearbeiten,
- anwendernahe Erklaerungen und Runbooks,
- archivierte Ideenskizzen.

Die Struktur soll klein genug fuer den Projektstart bleiben, aber
spaeter Meilensteine, ADRs und Umsetzungsslices aufnehmen koennen.

---

## 2. Entscheidung

Die Dokumentation wird wie folgt organisiert:

| Pfad | Zweck |
| ---- | ----- |
| `spec/` | normative Produkt- und Architekturvorgaben |
| `docs/plan/adr/` | Architecture Decision Records |
| `docs/plan/planning/in-progress/` | aktive Roadmap und laufende Plaene |
| `docs/plan/planning/open/` | Trigger-Watch, offene Folgearbeiten und Vorabklaerungen |
| `docs/plan/planning/done/` | abgeschlossene Plaene und Closure-Notizen |
| `docs/user/` | anwender- und betreibernahe Dokumentation |
| `docs/archive/` | verworfene oder historische Ideenskizzen |

---

## 3. Konsequenzen

- Das Lastenheft bleibt die Quelle fuer Anforderungen.
- Die Architektur beschreibt Verantwortungsgrenzen und technische
  Leitplanken.
- ADRs dokumentieren Entscheidungen, nicht laufende Diskussionen.
- Roadmap-Dokumente verfolgen Status, Reihenfolge und Abnahmeschnitte.
- Offene Punkte werden nicht in abgeschlossenen Plaenen versteckt,
  sondern unter `docs/plan/planning/open/` sichtbar gehalten.

---

## 4. Pflege-Regeln

- Neue fachliche Anforderungen erhalten eine Kennung im Lastenheft.
- Neue technische Entscheidungen erhalten eine ADR, wenn sie
  langfristige Auswirkungen haben.
- Jeder Plan muss Akzeptanzkriterien und Verifikationspfad enthalten.
- Abgeschlossene Plaene wandern nach `done/`.
- Offene Trigger bleiben in `open/`, bis sie aktiviert oder verworfen
  werden.
