# ADR-0002: Harness-Bootstrap und Agenten-Regelwerk

**Status:** Accepted

**Datum:** 2026-06-12

**Autor:** Dietmar Burkard

**Bezug:** [ADR-0001](0001-documentation-and-planning-structure.md),
[Lastenheft](../../../spec/lastenheft.md)

**Schaerft:** — (Prozess-ADR ohne Spec-Stratum)

---

## Kontext

`b-trace` soll von AI-Agenten reproduzierbar und auditierbar
weiterentwickelt werden. ADR-0001 definiert die Dokumentations- und
Planungsstruktur, aber es fehlen: eine kanonische Quellen-Rangfolge,
ein deklarierter Satz an Guides und Sensors, ein Agent-Briefing, ein
Konventionsspeicher und ein Ort fuer dokumentierte Ausnahmen.

Das Projekt ist in der Anforderungsphase (kein Code, einziges reales
Gate ist der Doku-Check). Annahme: Die Implementierung beginnt mit
Roadmap-Meilenstein M1; kippt diese Annahme, kippt der Zuschnitt der
Carveouts.

## Entscheidung

Wir adoptieren das **Agents-Regelwerk des AI-Harness-Kurses als
Baseline** (Stand siehe
[harness/conventions.md](../../../harness/conventions.md)) und
verkoerpern es ueber die Templates aus `lab/templates/` des
Kurs-Repos. Die Struktur aus ADR-0001 wird erweitert um:

| Pfad | Zweck |
| ---- | ----- |
| `AGENTS.md` | Agent-Briefing im Root |
| `harness/README.md` | Harness-Einstieg: Source Precedence, Guides, Sensors, Workflow |
| `harness/conventions.md` | Konventionsspeicher: Baseline, Adaptionen (`MR-*`), Modus-Deklaration |
| `docs/plan/adr/README.md` | ADR-Index |
| `docs/plan/carveouts/` | Ausnahmen (`CO-*`) mit Aufloesungs-Trigger, ein Carveout pro Datei plus Index |
| `docs/reviews/` | Review-Reports |

Abweichungen gegenueber der Baseline werden ausschliesslich als
`MR-*`-Eintraege im Adaptions-Block deklariert; fehlende Mechanik
ausschliesslich als Carveout (`CO-*`) mit Aufloesungs-Trigger.

## Verglichene Alternativen

### Option A — Keine Harness-Schicht (Status quo)

- Pro: kein Pflegeaufwand, keine zusaetzlichen Dokumente.
- Contra: keine kanonische Quellen-Rangfolge; Konflikte zwischen
  Dokumenten werden ad hoc entschieden; Agentenarbeit ist nicht
  reproduzierbar; Drift zwischen README, Spec und Planung bleibt
  unbemerkt.

### Option B — Eigene Konvention von Grund auf

- Pro: exakt auf `b-trace` zugeschnitten.
- Contra: erfindet Begriffe und Ablaeufe neu, die die Baseline bereits
  definiert; keine externe Referenz, gegen die Drift pruefbar waere;
  hoeherer Initial- und Pflegeaufwand.

### Option C — Adoption des Agents-Regelwerks (gewaehlt)

- Pro: erprobte Pflichtgliederungen und Templates; klare Begriffe
  (Slice, Carveout, Gate, GF/BF); Abweichungen sind als `MR-*`
  explizit und auditierbar; das Repo folgt bereits weitgehend der
  Verzeichniskonvention der Baseline (ADR-0001).
- Contra: externe Abhaengigkeit von der Kurs-Quelle; Baseline-Stand
  muss bei Kurs-Wellen nachgefuehrt werden.

## Konsequenzen

- Positiv: Agentenarbeit beginnt bei `AGENTS.md` und folgt einem
  pruefbaren Workflow; die Luecken des Harness sind als
  [CO-001](../carveouts/done/CO-001-spezifikation-stratum.md) bis
  [CO-004](../carveouts/CO-004-durchsetzungsschicht.md) explizit
  statt implizit.
- Negativ: zusaetzliche Pflegepflicht — Sensor-Deklarationen,
  ADR-Index und Carveout-Status muessen aktuell gehalten werden,
  sonst entsteht genau die Doku-Drift, die der Harness verhindern
  soll.
- Folgepflicht: Carveout-Aufloesungen haengen an der Roadmap
  ([RM-OPEN-001](../planning/in-progress/roadmap.md#offene-roadmap-punkte),
  [RM-OPEN-002](../planning/in-progress/roadmap.md#offene-roadmap-punkte),
  [RM-M1-01](../planning/in-progress/roadmap.md#m1--mvp-aufzeichnung-audit-und-sicheres-einzel-replay),
  [RM-M1-09](../planning/in-progress/roadmap.md#m1--mvp-aufzeichnung-audit-und-sicheres-einzel-replay)); ihre Trigger
  werden dort mitverfolgt.

## Fitness Function

| Tooling | Regel | Make-Target |
| ------- | ----- | ----------- |
| d-check (Digest-gepinnt) | alle in README, `spec/` und `docs/` referenzierten Pfade und Anker existieren — die hier beschlossenen Artefakte koennen nicht stillschweigend verschwinden | `make docs-check` |

Weitergehende mechanische Pruefung (Traceability-Hook,
Durchsetzungsschicht) existiert bewusst noch nicht:
[CO-003](../carveouts/CO-003-traceability-mechanik.md),
[CO-004](../carveouts/CO-004-durchsetzungsschicht.md).

## Re-Evaluierungs-Trigger

- Start von Meilenstein M1 (Carveouts
  [CO-002](../carveouts/CO-002-code-sensors.md) bis
  [CO-004](../carveouts/CO-004-durchsetzungsschicht.md) zuenden).
- Neue Kurs-Welle der Baseline mit Aenderungen an Pflichtgliederungen
  (Stand-Abgleich in `harness/conventions.md`).

## Geschichte

| Datum | Ereignis | Verweis |
| ----- | -------- | ------- |
| 2026-06-12 | Accepted | [slice-001](../planning/done/slice-001-harness-bootstrap.md) |
