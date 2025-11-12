<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            queryBinding="xslt2">
   <sch:ns prefix="bn-beh"
           uri="http://xoev.de/schemata/basisnachricht/behoerde/1_0"/>
   <sch:ns prefix="bn-g2g" uri="http://xoev.de/schemata/basisnachricht/g2g/1_0"/>
   <sch:ns prefix="bn-kom"
           uri="http://xoev.de/schemata/basisnachricht/kommunikation/1_0"/>
   <sch:ns prefix="bn-uq-g2g"
           uri="http://xoev.de/schemata/basisnachricht/unqualified/g2g/1_0"/>
   <sch:ns prefix="din91379"
           uri="urn:xoev-de:kosit:xoev:datentyp:din-91379_2022-08"/>
   <sch:ns prefix="dinspec91379"
           uri="urn:xoev-de:kosit:xoev:datentyp:din-spec-91379_2019-03"/>
   <sch:ns prefix="ds" uri="http://www.w3.org/2000/09/xmldsig#"/>
   <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>
   <sch:ns prefix="xbd" uri="http://xbildung.de/def/xbildung/1.2/xsd"/>
   <sch:ns prefix="xhs" uri="http://xhochschule.de/def/xhochschule/1.2/xsd"/>
   <sch:ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>
   <sch:ns prefix="xoev-code" uri="http://xoev.de/schemata/code/1_0"/>
   <sch:ns prefix="xoev-lc" uri="http://xoev.de/latinchars/1_1/datatypes"/>
   <sch:pattern>
      <!--Abstrakte Regeln-->
      <!-- /Data/XHochschule/Baukasten/Leistung -->
      <sch:rule id="rule-SCH-XHS-0018-Benotungsschema" abstract="true">
         <sch:assert id="SCH-XHS-0018-Benotungsschema"
                     test="(matches(., '^(6([,.]0)?|([1-5]([,.]\d+)))|[A-F][+-]?$'))">XHS-0018 Im Feld Note dürfen nur die folgenden Formate angegeben werden: 1. 'Zahl-Komma-Zahl' Beispiel "2,6" oder 2. 'Buchstabe A-F (+/-)' Beispiel "A" oder "A+".</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0020-KeineSWSBeiPruefungen" abstract="true">
         <sch:assert id="SCH-XHS-0020-KeineSWSBeiPruefungen"
                     test="if(ends-with(*:leistungsart/leistungsartCode/code/text(), 'klausur') or  ends-with(*:leistungsart/leistungsartCode/code/text(), 'pruefung')) then not(exists(*:beschreibung/*:umfangInSWS)) else (not(exists(*:beschreibung/*:umfangInSWS)) or exists(*:beschreibung/*:umfangInSWS))">XHS-0020 Der Wert 'UmfangInSWS' darf nicht angegeben werden, wenn der Inhalt des Codewertes von 'leistungsart' mit 'klausur' oder 'pruefung' endet. Bei Prüfungen und Klausuren handelt es sich um punktuelle Ereignisse, die nicht über das Semester verteilt sind.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0021-UnbedenklichkeitNurBeiStudienfach"
                abstract="true">
         <sch:assert id="SCH-XHS-0021-UnbedenklichkeitNurBeiStudienfach"
                     test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:unbedenklichkeitsvermerk) or not(exists(*:unbedenklichkeitsvermerk))) else not(exists(*:unbedenklichkeitsvermerk))">XHS-0021 Der Unbedenklichkeitsvermerk darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0022-angestrebterAbschluss" abstract="true">
         <sch:assert id="SCH-XHS-0022-angestrebterAbschluss"
                     test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:angestrebterAbschluss) or not(exists(*:angestrebterAbschluss))) else not(exists(*:angestrebterAbschluss))">XHS-0022 Der angestrebte Abschluss darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0023-fachsemester" abstract="true">
         <sch:assert id="SCH-XHS-0023-fachsemester"
                     test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:fachsemester) or not(exists(*:fachsemester))) else not(exists(*:fachsemester))">XHS-0023 Das Fachsemester darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0024-schluesselISCED2011" abstract="true">
         <sch:assert id="SCH-XHS-0024-schluesselISCED2011"
                     test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:schluesselISCED2011) or not(exists(*:schluesselISCED2011))) else not(exists(*:schluesselISCED2011))">XHS-0024 Der Schlüssel nach ISCED2011 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0025-schluesselISCEDF2013" abstract="true">
         <sch:assert id="SCH-XHS-0025-schluesselISCEDF2013"
                     test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:schluesselISCEDF2013) or not(exists(*:schluesselISCEDF2013))) else not(exists(*:schluesselISCEDF2013))">XHS-0025 Der Schlüssel nach ISCEDF2013 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0026-schluesselEQF" abstract="true">
         <sch:assert id="SCH-XHS-0026-schluesselEQF"
                     test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:schluesselEQF) or not(exists(*:schluesselEQF))) else not(exists(*:schluesselEQF))">XHS-0026 Der Schlüssel nach EQF darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0027-nurWennBenotetLeistungsbenotungsstatus"
                abstract="true">
         <sch:assert id="SCH-XHS-0027-nurWennBenotetLeistungsbenotungsstatus"
                     test="if(ends-with(*:benotet/text(),'true') or ends-with(*:benotet/text(),'1')) then (exists(*:leistungsbenotungsstatus)) else (not(exists(*:leistungsbenotungsstatus)))">XHS-0027 Wenn eine Leistung benotet ist (boolean 'benotet' = 'true' oder '1'), muss der Leistungsbenotungsstatus angegeben werden. Ansonsten darf der Leistungsbenotungsstatus nicht angegeben werden."</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0028-nurWennBenotetNote" abstract="true">
         <sch:assert id="SCH-XHS-0028-nurWennBenotetNote"
                     test="if(ends-with(*:benotet/text(),'true') or ends-with(*:benotet/text(),'1')) then (exists(*:benotung)) else (not(exists(*:benotung)))">XHS-0028 Wenn eine Leistung benotet ist (boolean 'benotet' = 'true' oder '1'), muss die Benotung angegeben werden. Ansonsten darf die Benotung nicht angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0029-nurWennModulModulbeschreibungNachKMK"
                abstract="true">
         <sch:assert id="SCH-XHS-0029-nurWennModulModulbeschreibungNachKMK"
                     test="((ends-with(*:leistungsart/code/code/text(), 'modul')) and (not(exists(*:beschreibung/*:modulbeschreibungNachKMK)) or exists(*:beschreibung/*:modulbeschreibungNachKMK))) or (not(ends-with(*:leistungsart/code/code/text(), 'modul')) and (not(exists(*:beschreibung/*:modulbeschreibungNachKMK))))">XHS-0029 Nur wenn der Wert der Codeliste Leistungsart auf 'modul' gesetzt wurde, soll die Beschreibung nach den Vorgaben der KMK ausgefüllt werden. Ansonsten darf die Beschreibung nicht nach den Vorgaben der KMK ausgefüllt werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0031-faecherschluesselDESTATIS" abstract="true">
         <sch:assert id="SCH-XHS-0031-faecherschluesselDESTATIS"
                     test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:faecherschluesselDESTATIS) or not(exists(*:faecherschluesselDESTATIS))) else not(exists(*:faecherschluesselDESTATIS))">XHS-0031 Der Fächerschlüssel nach Destatis darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/Leistungsbenotungsstatus -->
      <sch:rule id="rule-SCH-XHS-0030-WertNichtInListeLeistungsbenotungsstatus"
                abstract="true">
         <sch:assert id="SCH-XHS-0030-WertNichtInListeLeistungsbenotungsstatus"
                     test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))">XHS-0030 Wenn der Wert der Codeliste Leistungsbenotungsstatus '~wert_nicht_in_liste' ist, muss das Freitextfeld 'nichtGelisteterWert' angegeben werden. Ansonsten darf das Freitextfeld 'nichtGelisteterWert' nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/beurlaubungsstatus -->
      <sch:rule id="rule-SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus"
                abstract="true">
         <sch:assert id="SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus"
                     test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))">XHS-0015 Wenn der Wert der Codeliste Beurlaubungsstatus '~wert_nicht_in_liste' ist, muss das Freitextfeld 'nichtGelisteterWert' angegeben werden. Ansonsten darf das Freitextfeld 'nichtGelisteterWert' nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/exmatrikulationsbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0000-KeineLeerenElemente" abstract="true">
         <sch:assert id="SCH-XHS-0000-KeineLeerenElemente"
                     test="normalize-space(string())!=''">XHS-0000 GlobaleRegel: Das Element in ist leer. Leere Elemente sind nicht erlaubt.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bildungsnachweise/hochschulabschlusszeugnis -->
      <sch:rule id="rule-SCH-XHS-0011-PflichtfelderBenotung" abstract="true">
         <sch:assert id="SCH-XHS-0011-PflichtfelderBenotung"
                     test="exists(*:gesamtnote/*:note)">XHS-0011 Fehlende Angabe in 'benotung'. 'note' muss angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0019-BenotungsschemaGesamtnoteundAbschlussarbeit"
                abstract="true">
         <sch:assert id="SCH-XHS-0019-BenotungsschemaGesamtnoteundAbschlussarbeit"
                     test="(matches(., '^(6([,.]0)?|([1-5]([,.]\d+)))|[A-F][+-]?$'))">XHS-0019 Im Feld Note dürfen nur die folgenden Formate angegeben werden: 1. 'Zahl-Komma-Zahl' Beispiel "2,6" oder 2. 'Buchstabe A-F (+/-)' Beispiel "A" oder "A+".</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/immatrikulationsbescheinigungBAfoeGP9 -->
      <sch:rule id="rule-SCH-XHS-0010-LernzeitmodellVollOderTeilzeit" abstract="true">
         <sch:assert id="SCH-XHS-0010-LernzeitmodellVollOderTeilzeit"
                     test="ends-with(*:code/code/text(),'/vollzeit') or ends-with(*:code/code/text(),'/teilzeit')">XHS-0010 Das Lernzeitmodell muss in der Immatrikulationsbescheinigung nach BaföG § 9 die Ausprägung 'Teilzeit' oder 'Vollzeit' haben.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/immatrikulationsstatus -->
      <sch:rule id="rule-SCH-XHS-0016-WertNichtInListeImmatrikulationsstatus"
                abstract="true">
         <sch:assert id="SCH-XHS-0016-WertNichtInListeImmatrikulationsstatus"
                     test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))">XHS-0016 Wenn der Wert der Codeliste Immatrikulationsstatus '~wert_nicht_in_liste' ist, muss das Freitextfeld 'nichtGelisteterWert' angegeben werden. Ansonsten darf das Freitextfeld 'nichtGelisteterWert' nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/lateinischeEhrenbezeichnung -->
      <sch:rule id="rule-SCH-XHS-0017-WertNichtInListeLateinischeEhrenbezeichnung"
                abstract="true">
         <sch:assert id="SCH-XHS-0017-WertNichtInListeLateinischeEhrenbezeichnung"
                     test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))">XHS-0017 Wenn der Wert der Codeliste LateinischeEhrenbezeichnung '~wert_nicht_in_liste' ist, muss das Freitextfeld 'nichtGelisteterWert' angegeben werden. Ansonsten darf das Freitextfeld 'nichtGelisteterWert' nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/leistungsart -->
      <sch:rule id="rule-SCH-XHS-0012-WertNichtInListeLeistungsart" abstract="true">
         <sch:assert id="SCH-XHS-0012-WertNichtInListeLeistungsart"
                     test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))">XHS-0012 Wenn der Wert der Codeliste Leistungsart '~wert_nicht_in_liste' ist, muss das Freitextfeld 'nichtGelisteterWert' angegeben werden. Ansonsten darf das Freitextfeld 'nichtGelisteterWert' nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/leistungsstatus -->
      <sch:rule id="rule-SCH-XHS-0013-WertNichtInListeLeistungsstatus" abstract="true">
         <sch:assert id="SCH-XHS-0013-WertNichtInListeLeistungsstatus"
                     test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))">XHS-0013 Wenn der Wert der Codeliste Leistungsstatus '~wert_nicht_in_liste' ist, muss das Freitextfeld 'nichtGelisteterWert' angegeben werden. Ansonsten darf das Freitextfeld 'nichtGelisteterWert' nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/lernzeitmodell -->
      <sch:rule id="rule-SCH-XHS-0014-WertNichtInListeLernzeitmodell" abstract="true">
         <sch:assert id="SCH-XHS-0014-WertNichtInListeLernzeitmodell"
                     test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))">XHS-0014 Wenn der Wert der Codeliste Lernzeitmodell '~wert_nicht_in_liste' ist, muss das Freitextfeld 'nichtGelisteterWert' angegeben werden. Ansonsten darf das Freitextfeld 'nichtGelisteterWert' nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/rentenbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"
                abstract="true">
         <sch:assert id="SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"
                     test="if (*:beurlaubungsstatus/code/code = 'http://xhochschule.de/def/xhochschule/1.0/code/beurlaubungsstatus/beurlaubt') then exists(*:beurlaubungsgrund) else empty(*:beurlaubungsgrund)">XHS-0001 Wenn und nur wenn der Beurlaubungsstatus 'beurlaubt' ist, darf der Beurlaubungsgrund angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0032-keinAblaufdatumRentenversicherungsnummer"
                abstract="true">
         <sch:assert id="SCH-XHS-0032-keinAblaufdatumRentenversicherungsnummer"
                     test="not(exists(*:rentenversicherungsnummer/gueltigkeit/ende))">XHS-0032 Die Rentenversicheurngsnummer ist ab Geburt ein Leben lang gültig. Das Ablaufdatum darf nicht angezeigt werden.</sch:assert>
      </sch:rule>
      <!--Konkrete Regeln-->
      <sch:rule context="xhs:exmatrikulationsbescheinigung">
         <sch:extends rule="rule-SCH-XHS-0000-KeineLeerenElemente"/>
      </sch:rule>
      <sch:rule context="xhs:rentenbescheinigung//xhs:studienabschnitt">
         <sch:extends rule="rule-SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"/>
      </sch:rule>
      <sch:rule context="xhs:immatrikulationsbescheinigungBAfoeGP9//xhs:lernzeitmodell">
         <sch:extends rule="rule-SCH-XHS-0010-LernzeitmodellVollOderTeilzeit"/>
         <sch:extends rule="rule-SCH-XHS-0014-WertNichtInListeLernzeitmodell"/>
      </sch:rule>
      <sch:rule context="xhs:hochschulabschlusszeugnis/xhs:benotung">
         <sch:extends rule="rule-SCH-XHS-0011-PflichtfelderBenotung"/>
      </sch:rule>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xhs:leistungsart">
         <sch:extends rule="rule-SCH-XHS-0012-WertNichtInListeLeistungsart"/>
      </sch:rule>
      <sch:rule context="xhs:transcriptOfRecords//xhs:leistungsart">
         <sch:extends rule="rule-SCH-XHS-0012-WertNichtInListeLeistungsart"/>
      </sch:rule>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xhs:leistungsstatus">
         <sch:extends rule="rule-SCH-XHS-0013-WertNichtInListeLeistungsstatus"/>
      </sch:rule>
      <sch:rule context="xhs:transcriptOfRecords//xhs:leistungsstatus">
         <sch:extends rule="rule-SCH-XHS-0013-WertNichtInListeLeistungsstatus"/>
      </sch:rule>
      <sch:rule context="xhs:exmatrikulationsbescheinigung//xhs:lernzeitmodell">
         <sch:extends rule="rule-SCH-XHS-0014-WertNichtInListeLernzeitmodell"/>
      </sch:rule>
      <sch:rule context="xhs:immatrikulationsbescheinigung//xhs:lernzeitmodell">
         <sch:extends rule="rule-SCH-XHS-0014-WertNichtInListeLernzeitmodell"/>
      </sch:rule>
      <sch:rule context="xhs:rentenbescheinigung//xhs:lernzeitmodell">
         <sch:extends rule="rule-SCH-XHS-0014-WertNichtInListeLernzeitmodell"/>
      </sch:rule>
      <sch:rule context="xhs:studienverlaufsbescheinigung//xhs:lernzeitmodell">
         <sch:extends rule="rule-SCH-XHS-0014-WertNichtInListeLernzeitmodell"/>
      </sch:rule>
      <sch:rule context="xhs:exmatrikulationsbescheinigung//xhs:beurlaubungsstatus">
         <sch:extends rule="rule-SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus"/>
      </sch:rule>
      <sch:rule context="xhs:immatrikulationsbescheinigung//xhs:beurlaubungsstatus">
         <sch:extends rule="rule-SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus"/>
      </sch:rule>
      <sch:rule context="xhs:immatrikulationsbescheinigungBAfoeGP9//xhs:beurlaubungsstatus">
         <sch:extends rule="rule-SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus"/>
      </sch:rule>
      <sch:rule context="xhs:rentenbescheinigung//xhs:beurlaubungsstatus">
         <sch:extends rule="rule-SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus"/>
      </sch:rule>
      <sch:rule context="xhs:studienverlaufsbescheinigung//xhs:beurlaubungsstatus">
         <sch:extends rule="rule-SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus"/>
      </sch:rule>
      <sch:rule context="xhs:immatrikulationsbescheinigung//xhs:immatrikulationsstatus">
         <sch:extends rule="rule-SCH-XHS-0016-WertNichtInListeImmatrikulationsstatus"/>
      </sch:rule>
      <sch:rule context="xhs:immatrikulationsbescheinigungBAfoeGP9//xhs:immatrikulationsstatus">
         <sch:extends rule="rule-SCH-XHS-0016-WertNichtInListeImmatrikulationsstatus"/>
      </sch:rule>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xhs:lateinischeEhrenbezeichnung">
         <sch:extends rule="rule-SCH-XHS-0017-WertNichtInListeLateinischeEhrenbezeichnung"/>
      </sch:rule>
      <sch:rule context="xhs:hochschulabschlusszeugnis/xhs:leistung//xbd:note">
         <sch:extends rule="rule-SCH-XHS-0018-Benotungsschema"/>
      </sch:rule>
      <sch:rule context="xhs:transcriptOfRecords//xbd:note">
         <sch:extends rule="rule-SCH-XHS-0018-Benotungsschema"/>
      </sch:rule>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xbd:note">
         <sch:extends rule="rule-SCH-XHS-0019-BenotungsschemaGesamtnoteundAbschlussarbeit"/>
      </sch:rule>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xhs:leistung">
         <sch:extends rule="rule-SCH-XHS-0020-KeineSWSBeiPruefungen"/>
         <sch:extends rule="rule-SCH-XHS-0021-UnbedenklichkeitNurBeiStudienfach"/>
         <sch:extends rule="rule-SCH-XHS-0022-angestrebterAbschluss"/>
         <sch:extends rule="rule-SCH-XHS-0023-fachsemester"/>
         <sch:extends rule="rule-SCH-XHS-0024-schluesselISCED2011"/>
         <sch:extends rule="rule-SCH-XHS-0025-schluesselISCEDF2013"/>
         <sch:extends rule="rule-SCH-XHS-0026-schluesselEQF"/>
         <sch:extends rule="rule-SCH-XHS-0027-nurWennBenotetLeistungsbenotungsstatus"/>
         <sch:extends rule="rule-SCH-XHS-0028-nurWennBenotetNote"/>
         <sch:extends rule="rule-SCH-XHS-0029-nurWennModulModulbeschreibungNachKMK"/>
         <sch:extends rule="rule-SCH-XHS-0031-faecherschluesselDESTATIS"/>
      </sch:rule>
      <sch:rule context="xhs:transcriptOfRecords//xhs:leistung">
         <sch:extends rule="rule-SCH-XHS-0020-KeineSWSBeiPruefungen"/>
         <sch:extends rule="rule-SCH-XHS-0021-UnbedenklichkeitNurBeiStudienfach"/>
         <sch:extends rule="rule-SCH-XHS-0022-angestrebterAbschluss"/>
         <sch:extends rule="rule-SCH-XHS-0023-fachsemester"/>
         <sch:extends rule="rule-SCH-XHS-0024-schluesselISCED2011"/>
         <sch:extends rule="rule-SCH-XHS-0025-schluesselISCEDF2013"/>
         <sch:extends rule="rule-SCH-XHS-0026-schluesselEQF"/>
         <sch:extends rule="rule-SCH-XHS-0027-nurWennBenotetLeistungsbenotungsstatus"/>
         <sch:extends rule="rule-SCH-XHS-0028-nurWennBenotetNote"/>
         <sch:extends rule="rule-SCH-XHS-0029-nurWennModulModulbeschreibungNachKMK"/>
         <sch:extends rule="rule-SCH-XHS-0031-faecherschluesselDESTATIS"/>
      </sch:rule>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xhs:leistungsbenotungsstatus">
         <sch:extends rule="rule-SCH-XHS-0030-WertNichtInListeLeistungsbenotungsstatus"/>
      </sch:rule>
      <sch:rule context="xhs:transcriptOfRecords//xhs:leistungsbenotungsstatus">
         <sch:extends rule="rule-SCH-XHS-0030-WertNichtInListeLeistungsbenotungsstatus"/>
      </sch:rule>
      <sch:rule context="xhs:rentenbescheinigung">
         <sch:extends rule="rule-SCH-XHS-0032-keinAblaufdatumRentenversicherungsnummer"/>
      </sch:rule>
   </sch:pattern>
</sch:schema>
