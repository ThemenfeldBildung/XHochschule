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
   <sch:ns prefix="xbd" uri="http://xbildung.de/def/xbildung/1.0/xsd"/>
   <sch:ns prefix="xhs" uri="http://xhochschule.de/def/xhochschule/0.95/xsd"/>
   <sch:ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>
   <sch:ns prefix="xoev-code" uri="http://xoev.de/schemata/code/1_0"/>
   <sch:ns prefix="xoev-lc" uri="http://xoev.de/latinchars/1_1/datatypes"/>
   <sch:pattern><!--Abstrakte Regeln--><!-- /Data/XHochschule/Baukasten/Leistung -->
      <sch:rule id="rule-SCH-XHS-0018-Benotungsschema" abstract="true">
         <sch:assert id="SCH-XHS-0018-Benotungsschema" test="(matches(., '^\d+,\d+$'))">XHS-0018 Das Feld Note muss in dem Format "Zahl,Komma,Zahl" angegeben werden. Ein Beispiel hierfür wäre "2,5".</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0020-KeineSWSBeiPruefungen" abstract="true">
         <sch:assert id="SCH-XHS-0020-KeineSWSBeiPruefungen"
                     test="if(ends-with(*:leistungsart/leistungsartCode/code/text(), 'klausur') or  ends-with(*:leistungsart/leistungsartCode/code/text(), 'pruefung')) then not(exists(*:beschreibung/*:umfangInSWS)) else (not(exists(*:beschreibung/*:umfangInSWS)) or exists(*:beschreibung/*:umfangInSWS))">XHS-0020 Der Wert "UmfangInSWS" darf nicht angegeben werden, wenn der Inhalt des Codewertes von "leistungsart" mit "klausur" oder "pruefung" endet. Bei Prüfungen handelt es sich um punktuelle Ereignisse, die nicht über das Semester verteilt sind.</sch:assert>
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
                     test="if(ends-with(*:benotet/text(),'true') or ends-with(*:benotet/text(),'1')) then (exists(*:leistungsbenotungsstatus)) else (not(exists(*:leistungsbenotungsstatus)))">XHS-0027 Wenn und nur wenn eine Leistung benotet ist (boolean 'benotet' = 'true' oder '1'), soll der Leistungsbenotungsstatus angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0028-nurWennBenotetNote" abstract="true">
         <sch:assert id="SCH-XHS-0028-nurWennBenotetNote"
                     test="if(ends-with(*:benotet/text(),'true') or ends-with(*:benotet/text(),'1')) then (exists(*:benotung)) else (not(exists(*:benotung)))">XHS-0028 Wenn und nur wenn eine Leistung benotet ist (boolean 'benotet' = 'true' oder '1'), soll die Benotung angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0029-nurWennModulModulbeschreibungNachKMK"
                abstract="true">
         <sch:assert id="SCH-XHS-0029-nurWennModulModulbeschreibungNachKMK"
                     test="((ends-with(*:leistungsart/code/code/text(), 'modul')) and (not(exists(*:beschreibung/*:modulbeschreibungNachKMK)) or exists(*:beschreibung/*:modulbeschreibungNachKMK))) or (not(ends-with(*:leistungsart/code/code/text(), 'modul')) and (not(exists(*:beschreibung/*:modulbeschreibungNachKMK))))">XHS-0029 Nur wenn der Wert der Codeliste Leistungsart auf 'modul' gesetzt wurde, soll die Beschreibung nach den Vorgaben der KMK ausgefüllt werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0031-faecherschluesselDESTATIS" abstract="true">
         <sch:assert id="SCH-XHS-0031-faecherschluesselDESTATIS"
                     test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:faecherschluesseDESTATIS) or not(exists(*:faecherschluesseDESTATIS))) else not(exists(*:faecherschluesseDESTATIS))">XHS-0031 Der Fächerschlüssel nach DESTATIS darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/Leistungsbenotungsstatus -->
      <sch:rule id="rule-SCH-XHS-0030-WertNichtInListeLeistungsbenotungsstatus"
                abstract="true">
         <sch:assert id="SCH-XHS-0030-WertNichtInListeLeistungsbenotungsstatus"
                     test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))">XHS-0030 Wenn und nur wenn der Wert der Codeliste Leistungsbenotungsstatus 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden. </sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/beurlaubungsstatus -->
      <sch:rule id="rule-SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus"
                abstract="true">
         <sch:assert id="SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus"
                     test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))">XHS-0015 Wenn und nur wenn der Wert der Codeliste Beurlaubungsstatus 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bildungsnachweise/diplomaSupplement -->
      <sch:rule id="rule-SCH-XHS-0008-KeinAusstellungsortDS" abstract="true">
         <sch:assert id="SCH-XHS-0008-KeinAusstellungsortDS"
                     test="not(exists(*:ausstellung/ort))">XHS-0008 Ein Ausstellungsort darf auf dem Diploma Supplement nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/exmatrikulationsbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0000-KeineLeerenElemente" abstract="true">
         <sch:assert id="SCH-XHS-0000-KeineLeerenElemente"
                     test="normalize-space(string())!=''">XHS-0000 GlobaleRegel: Das Element <sch:name/>  in <sch:value-of select="ancestor::*/name()"/> ist leer. Leere Elemente sind nicht erlaubt.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0003-KeinAusstellungsortExmatrikulationsbescheinigung"
                abstract="true">
         <sch:assert id="SCH-XHS-0003-KeinAusstellungsortExmatrikulationsbescheinigung"
                     test="not(exists(*:ausstellung/ort))">XHS-0003 Ein Ausstellungsort darf auf der Exmatrikulationsbescheinigung nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bildungsnachweise/hochschulabschlusszeugnis -->
      <sch:rule id="rule-SCH-XHS-0007-KeinAusstellungsortHAZ" abstract="true">
         <sch:assert id="SCH-XHS-0007-KeinAusstellungsortHAZ"
                     test="not(exists(*:ausstellung/ort))">XHS-0007 Ein Ausstellungsort darf auf dem Hochschulabschlusszeugnis nicht angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0011-PflichtfelderBenotung" abstract="true">
         <sch:assert id="SCH-XHS-0011-PflichtfelderBenotung"
                     test="exists(*:gesamtnote/*:note)">XHS-0011 Fehlende Angabe in 'benotung'. 'note' muss angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0019-BenotungsschemaGesamtnoteundAbschlussarbeit"
                abstract="true">
         <sch:assert id="SCH-XHS-0019-BenotungsschemaGesamtnoteundAbschlussarbeit"
                     test="(matches(., '^\d+,\d+$'))">XHS-0019 Das Feld Note muss in dem Format "Zahl,Komma,Zahl" angegeben werden. Ein Beispiel hierfür wäre "2,5".</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/immatrikulationsbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0005-KeinAusstellungsortImmatrikulationsbescheinigung"
                abstract="true">
         <sch:assert id="SCH-XHS-0005-KeinAusstellungsortImmatrikulationsbescheinigung"
                     test="not(exists(*:ausstellung/ort))">XHS-0005 Ein Ausstellungsort darf auf der Immatrikulationsbescheinigung nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/immatrikulationsbescheinigungBAfoeGP9 -->
      <sch:rule id="rule-SCH-XHS-0004-KeinAusstellungsortImmatrikulationsbescheinigungBAfoeGP9"
                abstract="true">
         <sch:assert id="SCH-XHS-0004-KeinAusstellungsortImmatrikulationsbescheinigungBAfoeGP9"
                     test="not(exists(*:ausstellung/ort))">XHS-0004 Ein Ausstellungsort darf auf der Immatrikulationsbescheinigung nach BaföG § 9 nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/immatrikulationsstatus -->
      <sch:rule id="rule-SCH-XHS-0016-WertNichtInListeImmatrikulationsstatus"
                abstract="true">
         <sch:assert id="SCH-XHS-0016-WertNichtInListeImmatrikulationsstatus"
                     test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))">XHS-0016 Wenn und nur wenn der Wert der Codeliste Immatrikulationsstatus 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/lateinischeEhrenbezeichnung -->
      <sch:rule id="rule-SCH-XHS-0017-WertNichtInListeLateinischeEhrenbezeichnung"
                abstract="true">
         <sch:assert id="SCH-XHS-0017-WertNichtInListeLateinischeEhrenbezeichnung"
                     test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))">XHS-0017 Wenn und nur wenn der Wert der Codeliste LateinischeEhrenbezeichnung 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden. </sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/leistungsart -->
      <sch:rule id="rule-SCH-XHS-0012-WertNichtInListeLeistungsart" abstract="true">
         <sch:assert id="SCH-XHS-0012-WertNichtInListeLeistungsart"
                     test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))">XHS-0012 Wenn und nur wenn der Wert der Codeliste Leistungsart 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/leistungsstatus -->
      <sch:rule id="rule-SCH-XHS-0013-WertNichtInListeLeistungsstatus" abstract="true">
         <sch:assert id="SCH-XHS-0013-WertNichtInListeLeistungsstatus"
                     test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))">XHS-0013 Wenn und nur wenn der Wert der Codeliste Leistungsstatus 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden. </sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/lernzeitmodell -->
      <sch:rule id="rule-SCH-XHS-0010-LernzeitmodellVollOderTeilzeit" abstract="true">
         <sch:assert id="SCH-XHS-0010-LernzeitmodellVollOderTeilzeit"
                     test="ends-with(*:code/code/text(),'/vollzeit') or ends-with(*:code/code/text(),'/teilzeit')">XHS-0010 Das Lernzeitmodell muss in der Immatrikulationsbescheinigung nach BaföG § 9 die Ausprägung "Teilzeit" oder "Vollzeit" haben.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0014-WertNichtInListeLernzeitmodell" abstract="true">
         <sch:assert id="SCH-XHS-0014-WertNichtInListeLernzeitmodell"
                     test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))">XHS-0014 Wenn und nur wenn der Wert der Codeliste Lernzeitmodell 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/rentenbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"
                abstract="true">
         <sch:assert id="SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"
                     test="if (*:beurlaubungsstatus/code/code = 'http://xhochschule.de/def/xhochschule/1.0/code/beurlaubungsstatus/beurlaubt') then exists(*:beurlaubungsgrund) else empty(*:beurlaubungsgrund)">XHS-0001 Wenn und nur wenn der Beurlaubungsstatus "beurlaubt" ist, darf der Beurlaubungsgrund angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0006-KeinAusstellungsortRentenbescheinigung"
                abstract="true">
         <sch:assert id="SCH-XHS-0006-KeinAusstellungsortRentenbescheinigung"
                     test="not(exists(*:ausstellung/ort))">XHS-0006 Ein Ausstellungsort darf auf der Rentenbescheinigung nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/studienverlaufsbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0002-KeinAusstellungsortSVB" abstract="true">
         <sch:assert id="SCH-XHS-0002-KeinAusstellungsortSVB"
                     test="not(exists(*:ausstellung/ort))">XHS-0002 Ein Ausstellungsort darf auf der Studienverlaufsbescheinigung nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bildungsnachweise/transcriptOfRecords -->
      <sch:rule id="rule-SCH-XHS-0009-KeinAusstellungsortTOR" abstract="true">
         <sch:assert id="SCH-XHS-0009-KeinAusstellungsortTOR"
                     test="not(exists(*:ausstellung/ort))">XHS-0009 Ein Ausstellungsort darf auf dem Transcript of Records nicht angegeben werden.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <!--Globale Regeln-->
   <!--Konkrete Regeln-->
   <sch:pattern>
      <sch:rule context="xhs:exmatrikulationsbescheinigung">
         <sch:extends rule="rule-SCH-XHS-0000-KeineLeerenElemente"/>
         <sch:extends rule="rule-SCH-XHS-0003-KeinAusstellungsortExmatrikulationsbescheinigung"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:rentenbescheinigung//studienabschnitt">
         <sch:extends rule="rule-SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:studienverlaufsbescheinigung">
         <sch:extends rule="rule-SCH-XHS-0002-KeinAusstellungsortSVB"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:immatrikulationsbescheinigungBAfoeGP9">
         <sch:extends rule="rule-SCH-XHS-0004-KeinAusstellungsortImmatrikulationsbescheinigungBAfoeGP9"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:immatrikulationsbescheinigung">
         <sch:extends rule="rule-SCH-XHS-0005-KeinAusstellungsortImmatrikulationsbescheinigung"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:rentenbescheinigung">
         <sch:extends rule="rule-SCH-XHS-0006-KeinAusstellungsortRentenbescheinigung"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis">
         <sch:extends rule="rule-SCH-XHS-0007-KeinAusstellungsortHAZ"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:diplomaSupplement">
         <sch:extends rule="rule-SCH-XHS-0008-KeinAusstellungsortDS"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//diplomaSupplement">
         <sch:extends rule="rule-SCH-XHS-0008-KeinAusstellungsortDS"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:transcriptOfRecords">
         <sch:extends rule="rule-SCH-XHS-0009-KeinAusstellungsortTOR"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:exmatrikulationsbescheinigung//lernzeitmodell">
         <sch:extends rule="rule-SCH-XHS-0010-LernzeitmodellVollOderTeilzeit"/>
         <sch:extends rule="rule-SCH-XHS-0014-WertNichtInListeLernzeitmodell"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:immatrikulationsbescheinigung//lernzeitmodell">
         <sch:extends rule="rule-SCH-XHS-0010-LernzeitmodellVollOderTeilzeit"/>
         <sch:extends rule="rule-SCH-XHS-0014-WertNichtInListeLernzeitmodell"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:immatrikulationsbescheinigungBAfoeGP9//lernzeitmodell">
         <sch:extends rule="rule-SCH-XHS-0010-LernzeitmodellVollOderTeilzeit"/>
         <sch:extends rule="rule-SCH-XHS-0014-WertNichtInListeLernzeitmodell"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:rentenbescheinigung//lernzeitmodell">
         <sch:extends rule="rule-SCH-XHS-0010-LernzeitmodellVollOderTeilzeit"/>
         <sch:extends rule="rule-SCH-XHS-0014-WertNichtInListeLernzeitmodell"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:studienverlaufsbescheinigung//lernzeitmodell">
         <sch:extends rule="rule-SCH-XHS-0010-LernzeitmodellVollOderTeilzeit"/>
         <sch:extends rule="rule-SCH-XHS-0014-WertNichtInListeLernzeitmodell"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis/benotung">
         <sch:extends rule="rule-SCH-XHS-0011-PflichtfelderBenotung"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//leistungsart">
         <sch:extends rule="rule-SCH-XHS-0012-WertNichtInListeLeistungsart"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:transcriptOfRecords//leistungsart">
         <sch:extends rule="rule-SCH-XHS-0012-WertNichtInListeLeistungsart"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//leistungsstatus">
         <sch:extends rule="rule-SCH-XHS-0013-WertNichtInListeLeistungsstatus"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:transcriptOfRecords//leistungsstatus">
         <sch:extends rule="rule-SCH-XHS-0013-WertNichtInListeLeistungsstatus"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:exmatrikulationsbescheinigung//beurlaubungsstatus">
         <sch:extends rule="rule-SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:immatrikulationsbescheinigung//beurlaubungsstatus">
         <sch:extends rule="rule-SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:immatrikulationsbescheinigungBAfoeGP9//beurlaubungsstatus">
         <sch:extends rule="rule-SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:rentenbescheinigung//beurlaubungsstatus">
         <sch:extends rule="rule-SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:studienverlaufsbescheinigung//beurlaubungsstatus">
         <sch:extends rule="rule-SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:immatrikulationsbescheinigung//immatrikulationsstatus">
         <sch:extends rule="rule-SCH-XHS-0016-WertNichtInListeImmatrikulationsstatus"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:immatrikulationsbescheinigungBAfoeGP9//immatrikulationsstatus">
         <sch:extends rule="rule-SCH-XHS-0016-WertNichtInListeImmatrikulationsstatus"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//lateinischeEhrenbezeichnung">
         <sch:extends rule="rule-SCH-XHS-0017-WertNichtInListeLateinischeEhrenbezeichnung"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis/leistung//note">
         <sch:extends rule="rule-SCH-XHS-0018-Benotungsschema"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:transcriptOfRecords//note">
         <sch:extends rule="rule-SCH-XHS-0018-Benotungsschema"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//note">
         <sch:extends rule="rule-SCH-XHS-0019-BenotungsschemaGesamtnoteundAbschlussarbeit"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//leistung">
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
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:transcriptOfRecords//leistung">
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
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//leistungsbenotungsstatus">
         <sch:extends rule="rule-SCH-XHS-0030-WertNichtInListeLeistungsbenotungsstatus"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:transcriptOfRecords//leistungsbenotungsstatus">
         <sch:extends rule="rule-SCH-XHS-0030-WertNichtInListeLeistungsbenotungsstatus"/>
      </sch:rule>
   </sch:pattern>
   <!--Konkrete Regeln mit Kindelementen-->
</sch:schema>
