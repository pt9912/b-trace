# b-trace

b-trace ist eine cloud-native Incident- und Replay-Plattform zur Analyse,
Nachverfolgung und kontrollierten Wiederholung verteilter Transaktionen
in Banking- und Enterprise-Systemen.

Das Projekt befindet sich aktuell in der Anforderungsphase. Dieses README
beschreibt das geplante Verhalten; die verbindlichen Produktanforderungen
werden im [Lastenheft](spec/lastenheft.md) gepflegt.

## Was ist b-trace?

b-trace ist als verteiltes Incident- & Replay-System (IRS) konzipiert.
Es soll Requests, Responses, Header, Correlation-IDs und Events aus
verteilten Systemen vollstaendig aufzeichnen, zu Incidents verknuepfen
und es erlauben, fehlgeschlagene Requests kontrolliert gegen freigegebene
Zielsysteme erneut auszufuehren. Jeder Vorgang — von der Aufzeichnung bis
zum Replay-Ergebnis — wird auditierbar gespeichert.

Technologisch ist die Plattform auf OpenTelemetry, Kafka, PostgreSQL,
Keycloak und containerisierte Deployments mit Docker und Kubernetes
ausgerichtet. Architektonisch gilt eine hexagonale Struktur mit
Domain-Driven- und SOLID-Ansatz und klarer Trennung zwischen Domaene,
Infrastruktur und Adaptern.

## Warum b-trace?

In verteilten Banking- und Enterprise-Systemen sind Fehler oft schwer
reproduzierbar: Logs und Traces zeigen, *dass* etwas schiefging, aber
nicht, *wie* sich der Fehler gefahrlos nachstellen laesst. Manuelle
Wiederholungen per Hand sind riskant, nicht nachvollziehbar und in
regulierten Umgebungen kaum vertretbar. b-trace soll diese Luecke
zwischen Observability und kontrollierter Reproduktion schliessen:
Incidents werden nicht nur beobachtet, sondern mit den zugehoerigen
Requests, Replays und Audit-Eintraegen analysier- und wiederholbar
gemacht.

## Kerngedanke

```text
Aufzeichnen → Analysieren → Kontrolliert wiederholen → Auditieren
```

Jeder Request wird zu einem reproduzierbaren, auditierbaren Artefakt.
Replay ist dabei keine beilaeufige Debug-Funktion, sondern eine
privilegierte Operation mit klaren Sicherheitsgrenzen: Ohne Whitelist,
Berechtigung und explizite Freigabe darf kein Replay gegen ein
produktives Zielsystem stattfinden.

## Was macht es vertrauenswuerdig?

Die folgenden Mechanismen sind als verbindliche Anforderungen im
[Lastenheft](spec/lastenheft.md) und unter
[Replay-Sicherheit](docs/user/replay-safety.md) definiert:

- **Replay als privilegierte Operation:** Zielsystem-Whitelists,
  explizite Freigaben fuer produktive Replays und Dry-Run-Validierung
  ohne Zielsystemaufruf.
- **Lueckenloser Audit-Trail:** Jede Replay-Aktion wird mit Zeitpunkt,
  Identitaet, Zielobjekt, Correlation-ID, Ergebnis und ggf.
  Ablehnungsgrund protokolliert.
- **Datenschutz by Design:** Secrets und sensible Payload-Daten werden
  vor der Speicherung maskiert.
- **Rollenmodell:** Lesen, Vorbereiten, Starten und Administrieren sind
  getrennte Berechtigungen (OIDC/Keycloak).
- **Quality-Gates als Pflicht:** Mindestens 90% Testabdeckung sowie
  Architektur-, Contract- und Sicherheitstests fuer jede Komponente
  (siehe [Qualitaet](docs/user/quality.md)).
- **Klare Architekturgrenzen:** Hexagonale Architektur mit strikter
  Trennung von Domaene, Infrastruktur und Adaptern, validiert durch
  Architekturtests.

## Ziele

- Requests, Responses, Header, Correlation-IDs und Replay-Metadaten aufzeichnen.
- Requests sicher gegen freigegebene Zielsysteme wiederholen.
- Dry-Run-Replay, Batch-Replay, Payload-Manipulation, Rate-Limits und Audit-Trails unterstuetzen.
- Incident-Analyse mit Verknuepfungen zu Requests, Replays und Audit-Eintraegen bereitstellen.
- Authentifizierung, rollenbasierte Zugriffskontrolle und OpenTelemetry-Observability integrieren.
- Containerisierten Betrieb mit Docker und einen Kubernetes-faehigen Deployment-Pfad unterstuetzen.

## Sicherheitsmodell

Replay-Funktionen werden als privilegierte Operationen behandelt. Die
erwarteten Schutzmechanismen — Whitelists, explizite Freigaben, Dry-Run,
Rate-Limits, Audit-Logging und Payload-Maskierung — sind unter
[Replay-Sicherheit](docs/user/replay-safety.md) und im
[Lastenheft](spec/lastenheft.md) im Detail beschrieben.

## Dokumentation

- [Lastenheft](spec/lastenheft.md): Produktziele, funktionale Anforderungen, Quality Gates, Abnahmekriterien und Definition of Done.
- [Architektur](spec/architecture.md): Zielarchitektur, Komponenten, Ports, Adapter, Datenfluesse und offene Architekturpunkte.
- [Roadmap](docs/plan/planning/in-progress/roadmap.md): geplanter Umsetzungsverlauf mit Meilensteinen und Abnahmeschnitten.
- [ADR-Index](docs/plan/adr/README.md): dokumentierte Architekturentscheidungen.
- [User-Dokumentation](docs/user): anwender- und betreibernahe Erklaerungen zu Funktion, Replay-Sicherheit und Qualitaet.
- [Harness](harness/README.md): Source Precedence, Guides, Sensors und Agent-Workflow; Agent-Briefing in [AGENTS.md](AGENTS.md).
- [Carveouts](docs/plan/carveouts/README.md): dokumentierte Ausnahmen mit Aufloesungs-Trigger.
- [Changelog](CHANGELOG.md): nachvollziehbare Aenderungen am Projektstand.

## Dokumentationsstruktur

```text
spec/                         normative Spezifikation
docs/plan/adr/                Architekturentscheidungen (mit Index)
docs/plan/carveouts/          Ausnahmen mit Aufloesungs-Trigger
docs/plan/planning/open/      offene Folgearbeiten und Trigger-Watch
docs/plan/planning/next/      naechste geplante Welle
docs/plan/planning/in-progress/ aktive Roadmap und laufende Plaene
docs/plan/planning/done/      abgeschlossene Plaene
docs/reviews/                 Review-Reports
docs/user/                    Anwender- und Betreiber-Dokumentation
docs/archive/                 historische oder unverbindliche Ideenskizzen
harness/                      Harness-Einstieg und Konventionen
AGENTS.md                     Agent-Briefing
```

## Entwicklung

Das Projekt ist fuer einen Gradle-basierten Java-21-Aufbau vorbereitet.
Solange noch kein Gradle-Build angelegt ist, laufen die Make- und
Docker-Ziele fuer Dokumentationspruefungen und ueberspringen Gradle
explizit.

```bash
make help
make docs-check
make gates
make docker-docs-check
make docker-build
```

## Projektstatus

Implementierungsdetails wie das finale Backend-Framework, Build-System und der CI-Anbieter bleiben bewusst dem Pflichtenheft oder der Implementierungsphase vorbehalten. Die aktuellen Anforderungen definieren erwartetes Verhalten, Sicherheitsgrenzen und Abnahmekriterien.

## Lizenz

Dieses Projekt steht unter der MIT-Lizenz. Siehe [LICENSE](LICENSE).
