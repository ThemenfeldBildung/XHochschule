XHochschule - Versionshistorie

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
