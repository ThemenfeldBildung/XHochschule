# XHochschule

![XHochschule Logo](http://xhochschule.de/images/xhochschule_logo.png)

XHochschule ist ein vom [IT-Planungsrat](https://www.it-planungsrat.de/SharedDocs/Sitzungen/DE/2020/Sitzung_33.html?pos=13) auf die Standardisierungsagenda gehobenes, die Lebenslage
Studium betreffendes Standardisierungsvorhaben des Landes Sachsen-Anhalt und des Bundesministeriums für Bildung und Forschung (kurz: BMBF). Es verfolgt das Ziel, den Austausch von Studierendendaten im nationalen Hochschulwesen zu vereinheitlichen, sodass die erforderliche Interoperabilität zwischen den Hochschulsystemen (Campus Management Systeme genannt) zur medienbruchfreien Abwicklung von zukünftig digitalen Verwaltungsleistungen hergestellt werden kann.

Dafür werden bei europäischen und nationalen Standardisierungsvorhaben bewährten Vorgehen entlang
* eine [Standardisierungsstrategie](http://xhochschule.de/def/strat/0.7/2020-04-19-Standardisierungsstrategie_im_Hochschulwesen_V07b.pdf) erarbeitet und abgestimmt,
* der [Standardisierungsbedarf](http://www.xhochschule.de/def/req/1.0/Bedarfsbeschreibung_XHochschule.pdf) erhoben, formuliert und als Entwurf im IT-Planungsrat eingereicht,
* die Anforderungen für die Vereinheitlichung zusammen mit den Hochschulen, Wissenschaftsministerien der Länder, Fachverfahrensherstellern und weiteren Stakeholdern in [virtuellen Workshops](http://xhochschule.de/web/standardisierungsmeetings) erhoben, und
* die Bearbeitung des Bedarfs iterativ in Form dieser öffentlich einsehbaren Spezifikation mit PDFDokumentation und maschinenverarbeitbaren Dateien (XSD, XML) unter [www.xhochschule.de/def/xhochschule/0.4/](www.xhochschule.de/def/xhochschule/0.4/) bereit gestellt.


Zur besseren Anschlussfähigkeit an weitere, vor allem auch internationale Systeme, werden im Rahmen der Vereinheitlichung in- wie ausländische Bestrebungen ebenso berücksichtigt bzw. über die Arbeiten von XHochschule informiert, sodass auch abhängige und parallel laufende Projekte aufeinander abgestimmt konzipiert werden.

Im Ergebnis wird mit der hier vorliegenden **Spezifikation XHochschule** (englisch: XHigherEducationInstitutionExchange, XHEIE) eine Spezifikation erstellt, die den Hochschulen im Rahmen der Digitalisierung Auskunft darüber gibt, wie die hochschulübergreifende Datenkommunikation geregelt ist. Ein [Animationsvideo](https://www.youtube.com/watch?v=c3P4dU6hAYU) illustriert den fachlichen Bedarf dieser Spezifikation im Hochschulwesen.


Die Grundlage dieses Vorhabens bildet das Onlinezugangsgesetz (kurz: OZG), das im August 2017 in Kraft getreten ist. Das OZG verpflichtet alle deutschen Behörden und damit auch Hochschulen ihre Verwaltungsdienstleistungen bis zum Ende des Jahres 2022 auch digital den Bürgerinnen und Bürgern bzw. den Studierenden anzubieten. 
Weitere Anforderungen stellt die Verordnung zur Errichtung eines einheitlichen digitalen Zugangstores (SDGVo). Diese Verwaltungsleitungen, die durch die deutschen Hochschulen umgesetzt werden müssen, können auf der OZG-Informationsplattform eingesehen werden.


![Logo und Federfuehrer](http://www.xhochschule.de/images/logo_und_federfuehrer.png)

XHochschule stellt im Kontext der Vereinheitlichung des Datenaustauschs im Bildungswesen für die
Lebenslage Studium ein Baustein dar, der sich in ein übergreifendes Konstrukt [XBildung](http://xbildung.de/def/xbildung/0.4/spec/spezifikation_0.3.pdf) einfügt. Als
XBildung wird ein übergreifender Datenaustauschstandard bezeichnet, der das gesamte Bildungswesen
in den Blick nimmt. Das Ziel des Vorhabens ist es, dass Akteure im Bildungswesen (z.B. Hochschulen,
Schulen, Bildungsträger) elektronische Daten standardisiert untereinander austauschen, um sowohl Bildungsteilnehmer als auch die genannten Akteure zu entlasten (weniger analoge Nachweise, Fehlerreduktion, schnellere (Prüf-)Verfahren etc.). XBildung mit seinem Basismodul bildet eine inhaltliche Klammer um verschiedene Fachmodule bzw. -standards wie zum Beispiel XHochschule, [XSchule](http://xschule.digital/info/) und regelt diejenigen Aspekte, die für mindestens zwei Fachmodule und damit übergreifend relevant sind. Zurzeit wird an der Erstellung der Fachstandards XHochschule und XSchule gearbeitet, weitere Fachmodule wie ein "XWeiterbildung" oder ein "XBAföG" könnten in den nächsten Monaten folgen.

## Vorgehen

Das Vorgehen bei der Erarbeitung von XHochschule ist transparent und partizipativ. Bereits zu Beginn der Vorarbeiten von XHochschule wurden alle Wissenschaftsministerien der Länder, Hochschulen und weitere Organisationen (wie z.B. UniAssist oder die Stiftung für Hochschulzulassung (SfH)) in die Arbeiten einbezogen. Diese Vorarbeiten wurden in einer Standardisierungsstrategie zusammengeführt und mit den Hochschulen, den Wissenschaftsministerien der Länder und weiteren Stakeholdern abgestimmt. Im April 2020 begann dann darauf aufbauend die Dokumentation des Standardisierungsbedarfes und erste Bearbeitung des Bedarfs durch Aufnahme von Umsetzungsarbeiten die in frühe Versionen einer im November 2020 veröffentlichten Spezifikation münden.

Seitdem wurden in Standardisierungsmeetings die ersten Anwendungsfälle und Anforderungen an den Datenaustausch zwischen Hochschulen analysiert und der Scope von XHochschule geschärft. [Weitere Treffen](http://www.xhochschule.de/web/webmeetings2021) sind im Jahr 2021 zur Erarbeitung von Folgeversionen zur Abdeckung weiterer Nachweise und Datenaustauschmomente geplant. Das methodische Vorgehen der Datenmodellierung ist an zwei bewährten Methodiken angelehnt:
* deutsches XÖV-Vorgehen und
* europäische Methodik der Entwicklung von Core Vocabularies.
* 
Beiden Methoden gemeinsam ist die modellgetriebene Spezifikationsentwicklung, transparente Erarbeitung durch Veröffentlichung von Änderungsanmerkungen, der Aspekt der starken Nachnutzung von bereits Bewährten und die Verwendung von nicht-propriäteren zukunftssicheren und freien Technologien z.B. des W3C Technology Stacks (XML, XSD; Schematron).

Die Spezifikation XHochschule als Fachmodul des Basismoduls XBildung versucht die Komplexität im Bildungswesen soweit abzubilden, dass störende und unnötige Flexibilität zugunsten von Interoperabilität zwischen den Fachverfahren im Hochschulwesen aufgelöst wird. Dazu ist der Einsatz von abgestimmten harmonisierten Interoperabilitätsartefakten wie gemeinsame Datenmodelle, Wertelisten und Datentypen notwendig. Es gilt vor dem Hintergrund des Bildungsföderalismus in Deutschland und unter Wahrung der Hochschulautonomie der Grundsatz "So viel Vielfalt wie möglich bei soviel Einheit wie nötig"