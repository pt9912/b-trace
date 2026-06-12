# Qualität

## Zweck

Dieses Dokument beschreibt die geplanten Qualitaets- und Pruefpfade fuer
`b-trace`. Es ergaenzt Lastenheft und Architektur um reproduzierbare
Gates.

---

## 1. Statische Analyse

Statische Analyse ist Pflichtbestandteil der Build-Pipeline. Sie muss
mindestens pruefen:

- Code-Smells,
- Duplikation,
- Sicherheitsluecken,
- zyklische Abhaengigkeiten,
- Architekturverletzungen,
- OpenAPI-Vertrag.

Aktueller Einstieg:

```bash
make docs-check
make gates
make docker-docs-check
```

---

## 2. Tests

| Testart | Zweck |
| ------- | ----- |
| Unit-Tests | Domain-Regeln, Use Cases, Maskierung und Replay-Policy |
| Integrationstests | Persistenz, Kafka, Keycloak/OIDC, Zielsystem-Stubs |
| Architekturtests | Hexagonale Grenzen und Dependency Rule |
| Contract-Tests | REST-API, Event-Schemata, Zielsystem-Kontrakte |
| End-to-End-Tests | Aufzeichnung → Incident → Dry-Run → Replay → Audit |
| Performance-Tests | Durchsatz und Replay-Latenz |
| Sicherheitstests | AuthN/AuthZ, Payload-Rechte, produktive Replay-Sperren |

---

## 3. Coverage

| Kennung | Ziel |
| ------- | ---- |
| [COV-001](../../spec/lastenheft.md) | Line Coverage mindestens 90% |
| [COV-002](../../spec/lastenheft.md) | Branch Coverage mindestens 85% |
| [COV-003](../../spec/lastenheft.md) | Kritische Domain- und Replay-Policy mindestens 95% |

Coverage darf nicht durch Getter-/Setter-Tests oder künstliche
Testpfade erzeugt werden.

---

## 4. Architektur-Gates

Die CI muss brechen, wenn:

- Domain-Code Framework- oder Infrastrukturtypen importiert,
- Adapter Domain-Logik enthalten,
- Ports von Frameworks abhaengen,
- zyklische Modulabhängigkeiten entstehen,
- schreibende API-Operationen nicht auditiert sind.

---

## 5. Replay-Sicherheits-Gates

Pflichttests fuer jeden Replay-Pfad:

- unbekanntes Zielsystem wird blockiert,
- produktives Ziel ohne Freigabe wird blockiert,
- Benutzer ohne Replay-Recht wird blockiert,
- Dry-Run ruft kein Zielsystem auf,
- Rate-Limit wird eingehalten,
- Ablehnungen werden auditiert.

---

## 6. Release-Gates

Ein Release darf erst entstehen, wenn:

- alle Tests gruen sind,
- Coverage-Ziele erfuellt sind,
- OpenAPI valide ist,
- Architekturtests gruen sind,
- Container-Build erfolgreich ist,
- Sicherheits- und Dependency-Scans keine kritischen Befunde ohne
  dokumentierte Ausnahme enthalten.
