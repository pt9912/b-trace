# b-trace

B-Trace ist eine cloud-native Incident- und Replay-Plattform zur Analyse, Nachverfolgung und Wiederholung verteilter Transaktionen in Banking- und Enterprise-Systemen.  
Das System basiert auf einer hexagonalen Architektur und verfolgt einen konsequenten Domain-Driven- und SOLID-Ansatz, um eine hohe Wartbarkeit und Erweiterbarkeit sicherzustellen.  
Requests, Events und technische Fehler können vollständig auditierbar gespeichert, analysiert und reproduzierbar erneut ausgeführt werden.  
Die Plattform integriert moderne Technologien wie OpenTelemetry, Kafka, PostgreSQL, Keycloak sowie containerisierte Deployments mit Docker und Kubernetes.  
Besonderer Fokus liegt auf Observability, Event-Driven-Architecture, Replay-Mechanismen und einer klaren Trennung zwischen Domäne, Infrastruktur und Adaptern.  
Alle Komponenten werden durch automatisierte Tests, Architekturvalidierung und Quality-Gates mit mindestens 90% Testabdeckung abgesichert.


Das Projekt befindet sich aktuell in der Anforderungsphase. Die verbindlichen Produktanforderungen werden im [Lastenheft](spec/lastenheft.md) gepflegt.

## Ziele

- Requests, Responses, Header, Correlation-IDs und Replay-Metadaten aufzeichnen.
- Requests sicher gegen freigegebene Zielsysteme wiederholen.
- Dry-Run-Replay, Batch-Replay, Payload-Manipulation, Rate-Limits und Audit-Trails unterstützen.
- Incident-Analyse mit Verknüpfungen zu Requests, Replays und Audit-Einträgen bereitstellen.
- Authentifizierung, rollenbasierte Zugriffskontrolle und OpenTelemetry-Observability integrieren.
- Containerisierten Betrieb mit Docker und einen Kubernetes-fähigen Deployment-Pfad unterstützen.

## Sicherheitsmodell

Replay-Funktionen werden als privilegierte Operationen behandelt. Die Produktanforderungen definieren Schutzmechanismen für:

- Whitelists für Zielsysteme,
- explizite Freigaben für produktive Replays,
- Dry-Run-Validierung ohne Aufruf des Zielsystems,
- rate-limitierte Batch-Ausführung,
- Audit-Logging von Replay-Versuchen und Replay-Ergebnissen,
- Maskierung von Secrets und sensiblen Payload-Daten vor der Speicherung.

## Dokumentation

- [Lastenheft](spec/lastenheft.md): Produktziele, funktionale Anforderungen, Quality Gates, Abnahmekriterien und Definition of Done.

## Projektstatus

Status: Anforderungsentwurf.

Implementierungsdetails wie das finale Backend-Framework, Build-System und der CI-Anbieter bleiben bewusst dem Pflichtenheft oder der Implementierungsphase vorbehalten. Die aktuellen Anforderungen definieren erwartetes Verhalten, Sicherheitsgrenzen und Abnahmekriterien.

## Lizenz

Dieses Projekt steht unter der MIT-Lizenz. Siehe [LICENSE](LICENSE).
