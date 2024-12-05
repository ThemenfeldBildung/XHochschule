**XHochschule - Versionshistorie**

<!-- TOC start -->

- [Pre-Release Version 1.1](#pre-release-version-11)
- [Version 1.0](#version-10)
- [Version 0.95](#version-095)

<!-- TOC end -->

<!-- TOC --><a name="pre-release-version-11"></a>
# Pre-Release Version 1.1
**Veröffentlichungsdatum:** 21.10.2024

## 1. Strukturelle Änderungen
### 1.1 Codelisten
Die Codeliste „Lernzeitmodell“ wird zukünftig von XBildung bezogen und nicht mehr in XHochschule bereitgestellt. Die Codelistenwerte haben sich nicht geändert. Die aktuellen Versionen der Destatis-Codelisten „Beurlaubungsgrund“, „Hochschulsignatur“ und „Fächerschlüssel“ wurden referenziert.

### 1.2 Beziehung zu externen Modellen
Die Nachnutzung von XÖV-Kernkomponenten wurde systematisch geprüft. "Zeitraum" wird zukünftig als XÖV-Kernkomponente eingebunden und nicht mehr über XBildung. Die Klasse „Dokument“ wurde als Klasse in XHochschule modelliert und wird zukünftig nicht mehr von XBildung nachgenutzt. Die Einbindung der Namensraumpräfixe in den Instanzdateien wurde korrigiert.

### 1.3 Schematron
Die Schematron-Regel zur logischen Prüfung des Verbots leerer Elemente wurde entfernt um der gemeinsamen Handhabung der XBildung-Projekte zu entsprechen. Eine fehlerhafte Regel zum „Lernzeitmodell“ wurde korrigiert. Die Gesamtdarstellung der Schematron-Regeln wurde im Hinblick auf Verständlichkeit überarbeitet. Ein Satz zur Relevanz von Schematron wurde im Abschnitt „Hinweise zur Implementierung“ eingefügt.

## 2. Änderungen am Modell
### 2.1 Nachweis „Diploma Supplement“
Das Diploma Supplement wurde um optionale Felder erweitert um bei "Sprache" sowie bei mehreren Elementen der " Dauer und Ebene der Qualifikation" sowie der Erzielte Ergebnisse" Codelistenwerte mit angeben zu können. Hiermit soll die Konsistenz und die Interoperabilität des Datenmodells erhöht werden.

### 2.2 Änderungen in Klasse „Leistung"
Um Darstellungen von Benotungen außerhalb eines Dezimalschemas zu ermöglichen, wurde als Stakeholder-Anforderung eine optionale alternative Repräsentation eingeführt.Ein neues Feld zur Angabe einer lehrenden oder prüfenden Person in Bezug auf eine Leistung wurde eingeführt. Die Beschreibung der „Leistungsart“ wurde präzisiert. Die Beschreibungen von „Leistungsstatus“, „Leistungsbenotungsstatus“ und „Benotet“ wurden präzisiert, um ihren logischen Zusammenhang zu verdeutlichen. Der Datentyp von "semesterDerLeistungserbringung" wurde geändert auf xhs:Studienzeitraum, um eine automatisierte Auswertung zu gewährleisten.

## 3. Sonstiges
Die URIs aller Codelisten wurden auf Übereinstimmung mit dem XRepository geprüft. Es wurden keine Auffälligkeiten festgestellt.

## 4. Liste der umgestezten Tickets
* XHS-630 Darstellung von Schematron-Regeln überarbeiten
* XHS-647 Systematisch Prüfen: Rückmeldung aus CaMS-Gesprächen zu XHS v 0.95
* XHS-657 Tbd: Leistungsarten inhaltlich definieren?
* XHS-662 Diploma Supplement stärker strukturiert modellieren
* XHS-676 Prüfen: zeigeNamensraumpraefix
* XHS-678 "4,0-Bescheinigung" - noch nicht endgültig benotete Leistung als bestanden kennzeichnen können
* XHS-679 Neue Version von Destatis-Codelisten einbinden
* XHS-680 Verlinkung zum Glossar anpassen / Vereinheitlichung mit XBD
* XHS-681 Anpassen der Anleitung für Schematron-Prüfung nach XBildung
* XHS-685 Tabelle der Schematron-Regeln: Spalten umbenennen
* XHS-686 Fehlerhafte Schematronregel "Lernzeitmodell"
* XHS-687 RDF-Erzeugung aktualisieren
* XHS-688 Modellierung von Ausstellungsort in XHS-Dokumenten überarbeiten
* XHS-689 Release Routine nach Vorbild von XBildung anpassen oder übernehmen
* XHS-690 Codelisten-URNs auf Konsistenz mit XRepository prüfen
* XHS-695 Versionsangaben bei externen Codelisten überprüfen und ggf. nachziehen
* XHS-698 Prüfen und Diskutieren: Feld "Prüfende/Lehrende" bei Leistungen
* XHS-700 Einheitlich "Ortsangabe" verwenden
* XHS-701 Übernahme von Satz aus XBD-Spezifikation
* XHS-704 Konsistente Nachnutzung von XBD- und XÖV-Datentypen sicherstellen
* XHS-705 Codeliste "Lernzeitmodell" von XBD neu einbinden
* XHS-707 Datentyp anpassen für "semesterDerLeistungserbringung"

<!-- TOC --><a name="version-10"></a>
# Version 1.0

**Veröffentlichungsdatum:** 01.02.2024

## 1. Strukturelle Änderungen

### 1.1. Direkte Einbindung von XÖV-Kernkomponenten

Die XÖV-Kernkomponenten wurden aus XBildung entfernt, da sie zukünftig von den Vorhaben XSchule, XHochschule und XBerufsbildung direkt über die XÖV-Bibliothek eingebunden werden. Ausnahmen bilden die Kernkomponenten „Zeitraum“ und „Ortsangabe“ (ehemals Geburtsort, basierend auf Anschrift), diese verbleiben im Modell von XBildung. „Ortsangabe“, bestehend aus Ort und Staat, wird als reduzierte Anschrift genutzt. Sie ersetzt in Dokument und Praktikum die bisherige Angabe des Orts als Text.

### 1.2. Teilweises Ersetzen von Schematron-Regeln durch Restrictions

Innerhalb des Modells wurden zum Zwecke der Verschlankung eine Reihe von Schematron-Regeln durch XML-Schema-Restrictions ersetzt. Die verbleibenden Schematron-Regeln wurden vereinheitlicht, insbesondere hinsichtlich der Angabe von "wert_nicht_in_liste" bei Codelisten. Eine neue Regel verbietet Leerfelder bei Pflichtangaben.

### 1.3. Direkte Einbindung des XBD-Modells

Das XBildung-Modell wird nun direkt mit XHochschule ausgeliefert.

### 1.4. Nutzung von HTML in speziellen Feldern

Für weniger Felder, in denen HTML-Code notwendig sein könnte, um Datensätze abzubilden („Beschreibung“ in „Leistungsbeschreibung“ / „Bezeichnung“ in „Leistung“), ist dies zukünftig mittels HTML-Escape-Zeichen möglich. Eine Erläuterung und eine Tabelle der nutzbaren Zeichen finden sich im Kapitel „Wichtige Hinweise zur Implementierung“.

## 2. Änderungen am Modell

### 2.1. Änderungen in Klasse „Leistung“

In der Klasse „Leistung“, die mit Version 0.95 in das Datenmodell eingeführt wurde, wurden verschiedene Änderungen vorgenommen. Die Codeliste „Leistungsart“ wurde um die Einträge „Modulteilleistung“ und „Tutorium“ ergänzt. Weiterhin wurde „ModulNachKMK“ entfernt und die „ModulbeschreibungNachKMK“ überarbeitet und an den Codelisten-Wert „Modul“ als optionales Element angehängt. Für das „Modulhandbuch“ wurde ein Feld zur Angabe einer Versionierung hinzugefügt. Das Element „Abschlussarbeit“ wurde aus dem Hochschulabschlusszeugnis entfernt und kann zukünftig allein über die Einbindung von „Leistung“ in das Hochschulabschlusszeugnis als „Leistungsart“ dargestellt werden. Der Destatis-Fächerschlüssel wurde auf der Ebene „Leistung“ aufgrund Stakeholder-Anforderung als Typ3-Codeliste wieder eingebaut. Um einheitliche Geschäftsregeln durch alle Rekursivitätsstufen zu ermöglichen, wurde „Teilleistung“ in „Leistung“ überführt.

### 2.2. Eindeutige Semantik im Hinblick auf den Status und die Benotung von Leistungen

Es wurden Anpassungen vorgenommen, die eine klare semantische Trennung ermöglichen, inwieweit es sich um eine grundsätzlich benotete oder unbenotete Leistung handelt und in welchem Status sich die Leistungserbringung befindet. Entsprechend wurden auch die Beschreibungen angepasst.

## 3. Weitere Änderungen

### 3.1. Überarbeiten der Spezifikation

Die Spezifikation wurde umfassend überarbeitet im Hinblick auf die allgemeine Verständlichkeit. So wurde die „Hochschuljourney“ graphisch überarbeitet und die einzelnen Stationen in ein besser lesbares Format überführt. Weiterhin wurden einleitende Abschnitte überarbeitet und aktualisiert sowie ein im Hinblick auf die Implementierung wichtiges Kapitel mit Hinweisen für Campus-Management-System-Hersteller eingefügt.

## 4. Liste der umgestezten Tickets
* XHS-521: Studienabschnitt: AbgeschlossenOderDatum wird zu VorzeitigBeendet
* XHS-563: Redirect-URL auf aktuelle Spezifikation erstellen/anpassen
* XHS-595: Schematron-Regeln überarbeiten und vereinheitlichen
* XHS-606: Anpassen der Spezifikation
* XHS-608: Version des Modulhandbuchs in Leistungsbeschreibung einfügen
* XHS-619: Codeliste Lateinische Ehrenbezeichnung Errata
* XHS-629: Anpassung Benotungsstatus
* XHS-630: Formulierung Schematron-Regeln
* XHS-633: Schematron-Regeln durch Restrictions ersetzen / Kernkomponenten einbinden
* XHS-634: Renovieren der Spezifikation
* XHS-635: Anpassung aller Schematronregeln, die "wert_nicht_in_liste" ausdrücken.
* XHS-636: Benotungsstatus Datenfelder überarbeiten
* XHS-637: Prüfen: Beschränkung in "Geburt" aus natürlichePerson in XBD
* XHS-640: Errata in HAZ: Verweis auf ToR entfernen und DS-Verweis überarbeiten
* XHS-641: Codeliste Leistungsart ergänzen
* XHS-642: Element Abschlussarbeit aus HAZ entfernen
* XHS-643: Umsetzung der Schritte zur Nutzung von HTML in speziellen Feldern
* XHS-644: Anpassen von Modul/ModulnachKMK
* XHS-646: Leistung und entsprechende Schematron-Regeln anpassen
* XHS-649: Erratum: "rite" als lateinische Ehrenbezeichnung
* XHS-653: Versionierung von Codelisten prüfen und ggf. anpassen
* XHS-656: Empfehlungen und Hinweise für Hersteller
* XHS-659: Schreibfehler in angabenStudierender im DiplomaSupplement
* XHS-661: Einbindung des XBD-Modells nach Vorbild anderer Teilvorhaben
* XHS-665: Nachnutzung von XBD "Ortsangabe"
* XHS-666: Rechtschreibfehler in Beschreibung von "Identifikation" beheben
* XHS-668: Beschreibung von "Identifikation" ändern
* XHS-669: Destatis-FS wieder einbauen
* XHS-670: Erratum: DatatypeE doppelt eingebunden?

<!-- TOC --><a name="version-095"></a>
# Version 0.95

**Veröffentlichungsdatum:** 1. Februar 2024

## 1. Einheitliches Vorgehen für String-basierte Datentypen in Anlehnung an XBildung

### 1.1. Wahl des Datentyps

Für String-basierte Elemente kommen fünf verschiedene Datentypen in Frage: xs:string, xbd:String.Localized, din91379:datatypeB, din91379:datatypeC und din91379:datatypeE. Die Datentypen der DIN-Norm werden für Namen und einsprachige Texte verwendet. xs:string für "technische" Angaben, wie IDs. String.Localized für Texte, die theoretisch auch in einer von der Dokumentensprache abweichenden Sprache vorliegen können.

### 1.2. Umgang mit Mehrsprachigkeit

Mit dieser Version wird Mehrsprachigkeit nicht mehr auf Datenfeld-Ebene abgebildet. Muss das ganze Dokument in mehreren Sprachen vorliegen, wird davon ausgegangen, dass je Sprache ein XML-Dokument erstellt wird. Dieser Ansatz führt zu folgenden Änderungen: In der Klasse Dokument ist die Eigenschaft "sprache" nun verpflichtend (Häufigkeit 1, statt 0..n). Damit wird die Standard-Sprache des Dokuments festgelegt. Die Sprache eines Elements vom Typ xbd:String.Localized muss nur noch angegeben werden, wenn sie davon abweicht.

### 1.3. Häufigkeit bei xbd:String.Localized

Statt wie bisher Eigenschaften vom Typ xbd:String.Localized immer beliebig oft zu erlauben, um Mehrsprachigkeit abzubilden, sind sie nun nur so oft erlaubt, wie sie tatsächlich vorkommen dürfen. Daher wurde die Kardinalität der Eigenschaften vom Typ xbd:String.Localized in mehreren Klassen von 0..n auf 0..1 geändert.

## 2. Änderungen an Codelisten

### 2.1. Streichung der Destatis-Codelisten "Studienbereich", "Fächerschlüssel", "Art der Hochschule" und "Art des Hochschulabschlusses"

Beide Codelisten haben sich in mehrfacher Hinsicht als nicht sinnvoll zur weiteren Verwendung im Datenmodell erwiesen. Um Probleme bei der Konsistenz wie der Persistenz der Identifikatoren zu vermeiden und wegen des geringen Mehrwerts für das Datenmodell werden diese ausgebaut.

### 2.2. Umstellung von Destatis-Codelisten auf XÖV-Codelisten-Nutzungstyp 3

Verbleibende Destatis-Codelisten "Hochschulsignatur" und "Beurlaubungsgrund" werden als Typ3-Codelisten ("Benannte Codeliste") eingebunden, damit ihre Werte über verschiedene Versionen hinweg gültig und referenzierbar bleiben, siehe XÖV-Codelisten-Handbuch der KoSIT, S. 11.

### 2.3. Einführung von Standard-Codes

Für einige Codelisten werden die Codes "Wert nicht in Liste" und/oder „Wert nicht bekannt“ zur Verfügung gestellt.

### 2.4. Aufnahme der Codeliste „European Qualifications Framework“

Für das European Qualifications Framework wird die Codeliste EQF als zusätzliche Möglichkeit zur Bestimmung des Qualifikationsniveaus aufgenommen.

## 3. Änderungen an Dokumenten für den Datenaustausch

### 3.1. Überarbeitung des "Diploma Supplement"

Das Diploma Supplement wurde entsprechend der Vorgaben der HRK (HRK Diploma Supplement) überarbeitet und referenziert in den Beschreibungen der Datenfelder die jeweiligen Sektionen des HRK-Dokuments. Optional wird die Möglichkeit einer Signatur sowie die direkte Einbindung in das Hochschulabschlusszeugnis angeboten. Um den internationalen Austausch zu erleichtern, werden Datenfelder als Freitext modelliert und kleinere Anpassungen der Datenfelder vorgenommen.

### 3.2. Erstellung eines "Transcript of Records" und Modellierung von Leistungen

Als Dokument für den Datenaustausch wird erstmalig ein "Transcript of Records" aufgenommen. Dieses basiert auf einem Modell zur Darstellung von Leistungen anhand der Klassen "Leistung" und "Leistungsbeschreibung", das durch die Möglichkeit zur Verschachtelung von individuell festlegbaren "Teilleistungen" die Divergenzen zwischen Hochschulen berücksichtigt und bestmögliche Abbildbarkeit bei höchstmöglicher Vereinheitlichung anbietet. Als oberste Ebene ist stets "Studiengang" oder "Studienfach" anzulegen. Das Feld "ModulNachKMK" und die Klasse "ModulbeschreibungNachKMK" besitzen normierenden Charakter. Es lässt sich festlegen, ob es sich um Wahl-, Pflicht- oder Wahlpflichtveranstaltungen handelt. Bei einer als "Studienfach" angelegten Leistung besteht die Möglichkeit, einen Unbedenklichkeitsvermerk anzugeben.

### 3.3. Änderungen an der Verweisstruktur zwischen Dokumenten

Für die Bildungsnachweise des Hochschulabschlusszeugnisses, des Diploma Supplement und des Transcript of Records wird zukünftig auf Datenfelder zum gegenseitigen Verweis und die Nutzung von xs:ID verzichtet. In das Hochschulabschlusszeugnis kann optional ein vollständiges Diploma Supplement integriert werden. Der Verweis auf das Transcript of Records innerhalb des Hochschulabschlusszeugnisses wird durch die direkte Angabe von Leistungen ersetzt.

## 4. Weitere Änderungen mit Auswirkung auf das Datenmodell

### 4.1. Einbindung der Kernkomponenten von XÖV 3.0

XHochschule bindet nun XÖV 3.0.1 ein.

### 4.2. Möglichkeit zur Angabe einer XML-Signatur

Alle XHochschule-Dokumente können nun mit einer digitalen XML-Signatur signiert werden. Die Signatur ist ein optionales Element, für das keine Vorgaben über das Format ds:signature hinaus gemacht werden.

### 4.3. Änderungen an der Klasse „Studienabschnitt“

Die Klasse „studienabschnitt“ wird ersetzt durch „studienabschnittAufzaehlungOderZusammenfassung“, die die Auswahl zwischen „studienabschnittAufzaehlung" als detaillierte Angabe und „studienabschnittZusammenfassung“ als zusammengefasste Angabe zulässt. Dies berücksichtigt die unterschiedlichen zeitlichen Bezüge je nach Verwendungsart, insbesondere bei der Exmatrikulationsbescheinigung.

## 5. Weitere Änderungen

### 5.1. Korrekter Dateiname für die Spezifikation

Der Name der PDF-Datei enthält nun den Verweis auf XHochschule und die Versionsnummer (XHS_spezifikation_versionsnummer) um diese von anderen XBildung-Spezifikationen unterscheidbar zu machen.

### 5.2. Leitfaden - Wie lese ich die Spezifikation?

Den Nutzenden wird eine kurze Anleitung zur Verfügung gestellt, wie das Dokument der Spezifikation zu lesen ist.

## 6. Liste der umgestezten Tickets
* XHS-460: Externe Modelle: XÖV-Kernkomponenten neu einbinden
* XHS-462: Diploma Supplement fachliche Fragen klären und neu modellieren
* XHS-470: URIs case-insensitiv gestalten
* XHS-480: Stereotypen für ImmaBesch anpassen, sobald diese wieder im Modell aufgenommen ist.
* XHS-485: Unbedenklichkeitsvermerk als Feld ergänzen
* XHS-492: Klasse Transcript of Records (ToR) erstellen
* XHS-493: Prüfen: Bedarf an Verweisen auf Notensysteme (GradingScheme) im Hochschulwesen
* XHS-495: Recherche zu ToR Dokumenten
* XHS-499: Mehrsprachigkeit von XHS-Feldern vereinheitlichen in Abstimmung mit XBD
* XHS-523: Kardinalität von Ausstellende Hochschule auf 1 setzen
* XHS-528: Standard-Codes in Codelisten überarbeiten
* XHS-534: Prüfen: Sollte Diploma Supplement als optionale Eigenschaft von Hochschulabschlusszeugnis abgebildet werden?
* XHS-539: Studienabschnitt anpassen je nach Anwendungstyp
* XHS-540: xhs:fachsemester als letztes Element in Studienfach setzen
* XHS-541: Elemente bei Studierender in Hochschulabschlusszeugnis anpassen
* XHS-542: Dateinamen der Spezifikation ändern
* XHS-548: Im Kapitel "Externe Modelle" den Link auf XBildung anpassen
* XHS-552: Spezifikation, S. 49, Layoutfehler beheben
* XHS-553: Beschreibungen im Notenspiegel den passenden Eigenschaften zuweisen
* XHS-555: Datum des Erwerbs in Hochschulabschlusszeugnis aufnehmen
* XHS-557: Prüfen: Kann das ToR Modell aus ELMO als Vorbild dienen? Und wie?
* XHS-558: Klasse für die Notenübersicht erstellen
* XHS-559: DESTATIS Studienbereich und Fächerschlüssel ausbauen
* XHS-560: Codeliste Art des Hochschulabschlusses löschen und Bedarf weiter klären
* XHS-564: Schematron-Regeln für XBD:Benotung einführen
* XHS-571: Codeliste "Art der Hochschule" entfernen
* XHS-572: Datenfelder zu einer einzelnen Leistung modellieren
* XHS-573: XML-Signatur einbauen
* XHS-576: Verwendung von xs:ID überarbeiten
* XHS-578: Fehler aus XÖV-Suite dokumentieren und ggf. beheben
* XHS-579: EQF als Feld einbauen
* XHS-580: DESTATIS Codelisten umstellen auf Typ 3
* XHS-583: Metadaten zur Konfiguration im Modell aktualisieren
* XHS-585: Modellieren der Lösungen aus dem AK "Leistungsnachweise"
* XHS-586: Klären, inwiefern "angabenQualifikation/-haupstudienfach" sich auf "Studienfach" beziehen sollte
* XHS-587: XBildung-Baukasten "Sprache" ersetzen durch Codeliste Language
* XHS-588: Prüfen: Ausbauen von anonymer Klasse "Location"
* XHS-589: Sektion "Eingebundene externe Modelle" in Spezifikation auf XBD 0.95 anpassen
* XHS-591: Zur Prüfung und Diskussion: Umgang mit "VerweisAufDS" im HAZ
* XHS-592: Schematron-Regeln für "Wert nicht in Liste" erstellen
* XHS-593: Schematron-Regeln für Klasse "Leistung" erstellen
* XHS-597: Ergänzungen zu Werten in der Klasse Leistungsart
* XHS-598: Diskussion: Definition der Begriffe "benotet" und "unbenotet" in Verbindung mit Leistungsstatus "angemeldet"
* XHS-599: absolvierteVersuche: Austausch des Datentyps Integer
* XHS-601: "Studiengang" in allen Beschreibungen ersetzen durch "Studienfach"
* XHS-602: Text für Nutzung des generischen Ansatzes bei Leistungsdaten formulieren
* XHS-609: Anpassung der Modellierung der Klasse Leistung

