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
   <sch:ns prefix="xbd" uri="http://xbildung.de/def/xbildung/0.95/xsd"/>
   <sch:ns prefix="xhs" uri="http://xhochschule.de/def/xhochschule/0.95/xsd"/>
   <sch:ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>
   <sch:ns prefix="xoev-code" uri="http://xoev.de/schemata/code/1_0"/>
   <sch:ns prefix="xoev-lc" uri="http://xoev.de/latinchars/1_1/datatypes"/>
   <sch:pattern><!--Abstrakte Regeln--><!-- /Data/XHochschule/Baukasten/Leistung -->
      <sch:rule id="rule-SCH-XHS-0033-Benotungsschema" abstract="true">
         <sch:assert id="SCH-XHS-0033-Benotungsschema" test="(matches(., '^\d+,\d+$'))">XHS-0033 das Feld Benotung muss in dem Format "Zahl,Komma,Zahl" angegeben werden. Ein Beispiel hierfür wäre "2,5".</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/StudienabschnittAufzaehlung -->
      <sch:rule id="rule-SCH-XHS-0026-WertNichtInListeLernzeitmodellStudienabschnitt"
                abstract="true">
         <sch:assert id="SCH-XHS-0026-WertNichtInListeLernzeitmodellStudienabschnitt"
                     test="(exists(*:lernzeitmodellFreitext) and ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')) or (empty(*:lernzeitmodellFreitext) and not(ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')))">XHS-0026 Wenn und nur wenn der Wert von lernzeitmodell 'wert_nicht_in_liste' ist, soll das Feld lernzeitmodellFreitext  angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0029-WertNichtInListeBeurlaubungsstatusStudienabschnitt"
                abstract="true">
         <sch:assert id="SCH-XHS-0029-WertNichtInListeBeurlaubungsstatusStudienabschnitt"
                     test="(exists(*:beurlaubungsstatusFreitext) and ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:beurlaubungsstatusFreitext) and not(ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')))">XHS-0029 Wenn und nur wenn der Wert von beurblaubungsstatus 'wert_nicht_in_liste' ist, soll das Feld beurlaubungsstatusFreitext  angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/StudienabschnittZusammenfassung -->
      <sch:rule id="rule-SCH-XHS-0038-WertNichtInListeLernzeitmodellStudienabschnittZusammenfassung"
                abstract="true">
         <sch:assert id="SCH-XHS-0038-WertNichtInListeLernzeitmodellStudienabschnittZusammenfassung"
                     test="(exists(*:lernzeitmodellFreitext) and ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')) or (empty(*:lernzeitmodellFreitext) and not(ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')))">XHS-0026 Wenn und nur wenn der Wert von lernzeitmodell 'wert_nicht_in_liste' ist, soll das Feld lernzeitmodellFreitext  angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/angabenBenotung -->
      <sch:rule id="rule-SCH-XHS-0032-WertNichtInListeLateinischeEhrenbezeichnung"
                abstract="true">
         <sch:assert id="SCH-XHS-0032-WertNichtInListeLateinischeEhrenbezeichnung"
                     test="(exists(*:lateinischeEhrenbezeichnungFreitext) and ends-with(*:lateinischeEhrenbezeichnung/code/text(), 'wert_nicht_in_liste')) or (empty(*:lateinischeEhrenbezeichnungFreitext) and not(ends-with(*:lateinischeEhrenbezeichnung/code/text(), 'wert_nicht_in_liste')))">XHS-0032 Wenn und nur wenn der Wert von lateinischeEhrenbezeichnung 'wert_nicht_in_liste' ist, soll das Feld lateinischeEhrenbezeichnungFreitext  angegeben werden. </sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/angabenStudierenderBAfoeGP9 -->
      <sch:rule id="rule-SCH-XHS-0010-MussNameNatuerlichePerson" abstract="true">
         <sch:assert id="SCH-XHS-0010-MussNameNatuerlichePerson"
                     test="exists(xbd:nameNatuerlichePerson/xbd:familienname)">XHS-0010 Für den Studierenden muss zur Identifikation auf der Immatrikulationsbescheinigung nach BAföG §9 ein Familienname angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0011-KeinGeschlecht" abstract="true">
         <sch:assert id="SCH-XHS-0011-KeinGeschlecht" test="empty(xbd:geschlecht)">XHS-0011 Für den Studierenden darf auf der Immatrikulationsbescheinigung nach BaföG §9 kein Geschlecht angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0012-KeineWohnanschrift" abstract="true">
         <sch:assert id="SCH-XHS-0012-KeineWohnanschrift" test="empty(xbd:anschrift)">XHS-0012 Für den Studierenden wird auf der Immatrikulationsbescheinigung nach BAföG §9 keine Wohnanschrift benötigt.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0013-KeineSemester" abstract="true">
         <sch:assert id="SCH-XHS-0013-KeineSemester"
                     test="empty(xhs:hochschulsemester) and empty(xhs:urlaubssemester)">XHS-0013 Die Zahl der Hochschulsemester und Urlaubssemester des Studierenden werden auf der Immatrikulationsbescheinigung nach BaföG § 9 nicht benötigt.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0014-KeineAnrede" abstract="true">
         <sch:assert id="SCH-XHS-0014-KeineAnrede" test="empty(xbd:anrede)">XHS-0014 Die Anrede des Studierenden wird auf der Immatrikulationsbescheinigung nach BaföG § 9 nicht benötigt.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0018-GeburtPflicht" abstract="true">
         <sch:assert id="SCH-XHS-0018-GeburtPflicht"
                     test="exists(*:geburt/*:datum) and exists(*:geburt/*:geburtsort/*:ort)">XHS-0018 Geburtsort und Geburtsdatum des Studierenden müssen auf der Immatrikulationsbescheinigung nach BaföG § 9 angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/exmatrikulationsbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0000-KeineLeerenElemente" abstract="true">
         <sch:assert id="SCH-XHS-0000-KeineLeerenElemente"
                     test="normalize-space(string())!=''">XHS-0000 GlobaleRegel:_ Das Element <sch:name/>  in <sch:value-of select="ancestor::*/name()"/> ist leer. Leere Elemente sind nicht erlaubt.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0008-KeinAusstellungsortExmatrikulationsbescheinigung"
                abstract="true">
         <sch:assert id="SCH-XHS-0008-KeinAusstellungsortExmatrikulationsbescheinigung"
                     test="not(ends-with(name(),':ort'))">XHS-0008 KindUnterElement:_xbd:ausstellung__ Ein Ausstellungsort darf auf der Exmatrikulationsbescheinigung nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bildungsnachweise/hochschulabschlusszeugnis -->
      <sch:rule id="rule-SCH-XHS-0007-KeinAblaufdatumZeugnis" abstract="true">
         <sch:assert id="SCH-XHS-0007-KeinAblaufdatumZeugnis"
                     test="not(ends-with(name(),':ende'))">XHS-0007 KindUnterElement:_xbd:gueltigkeitszeitraum__ Das Element <sch:name/> darf nicht angegeben werden. Die Gültigkeit eines Zeugnisses läuft nicht ab.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0017-PflichtfelderBenotung" abstract="true">
         <sch:assert id="SCH-XHS-0017-PflichtfelderBenotung"
                     test="exists(*:gesamtnote/*:note)">XHS-0017 Fehlende Angabe in xhs:benotung. Es muss angegeben werden: xhs:gesamtnote/xbd:note.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0019-KeineSemesterHAZ" abstract="true">
         <sch:assert id="SCH-XHS-0019-KeineSemesterHAZ"
                     test="ends-with(name(),':nameNatuerlichePerson') or ends-with(name(),':geburt') or ends-with(name(),':matrikelnummer') or ends-with(name(),':identifikationsnummer')">XHS-0019 KindElement:_ Das Feld "<sch:name/>" darf in "<sch:value-of select="ancestor::*/name()"/>" nicht angegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0020-WertNichtInListeLeistungsart_HAZ" abstract="true">
         <sch:assert id="SCH-XHS-0020-WertNichtInListeLeistungsart_HAZ"
                     test="(exists(*:leistungsartFreitext) and ends-with(*:leistungsart/code/text(), 'wert_nicht_in_liste')) or (empty(*:leistungsartFreitext) and not(ends-with(*:leistungsart/code/text(), 'wert_nicht_in_liste')))">XHS-0020 Wenn und nur wenn der Wert von leistungsart 'wert_nicht_in_liste' ist, soll das Feld leistungsartFreitext  angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0022-WertNichtInListeLeistungsstatus_HAZ"
                abstract="true">
         <sch:assert id="SCH-XHS-0022-WertNichtInListeLeistungsstatus_HAZ"
                     test="(exists(*:leistungsstatusFreitext) and ends-with(*:leistungsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:leistungsstatusFreitext) and not(ends-with(*:leistungsstatus/code/text(), 'wert_nicht_in_liste')))">XHS-0022 Wenn und nur wenn der Wert von leistungsstatus 'wert_nicht_in_liste' ist, soll das Feld leistungsstatusFreitext  angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0033-BenotungsschemaGesamtnoteundAbschlussarbeit"
                abstract="true">
         <sch:assert id="SCH-XHS-0033-BenotungsschemaGesamtnoteundAbschlussarbeit"
                     test="(matches(., '^\d+,\d+$'))">XHS-0033 das Feld Benotung muss in dem Format "Zahl,Komma,Zahl" angegeben werden. Ein Beispiel hierfür wäre "2,5".</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0034-KeineNoteWennStatusUnbenotet_HAZ" abstract="true">
         <sch:assert id="SCH-XHS-0034-KeineNoteWennStatusUnbenotet_HAZ"
                     test="if(ends-with(*:leistungsbenotungsstatus/code/text(), 'unbenotet')) then not(exists(*:note)) else (exists(*:note) or empty(*:note))">XHS-0034 Wenn die Benotung der Leistung den Status "unbenotet" hat, darf keine Note für diese Leistung angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0036-ModulbeschreibungNachKMK_HAZ" abstract="true">
         <sch:assert id="SCH-XHS-0036-ModulbeschreibungNachKMK_HAZ"
                     test="if(ends-with(*:leistungsart/code/text(), 'modul_nach_kmk')) then exists(*:beschreibung/*:modulbeschreibungNachKMK) else not(exists(*:beschreibung/*:modulbeschreibungNachKMK))">XHS-0036 Wenn und nur wenn die Leistung ein Modul nach KMK ist, soll die Beschreibung nach den Vorgaben der KMK ausgefüllt werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0040-KeineSWSBeiPruefungen_HAZ" abstract="true">
         <sch:assert id="SCH-XHS-0040-KeineSWSBeiPruefungen_HAZ"
                     test="if(ends-with(*:leistungsart/code/text(), 'klausur') or ends-with(*:leistungsart/code/text(), 'pruefung')) then empty(*:beschreibung/*:umfangInSWS) else (empty(*:beschreibung/*:umfangInSWS) or exists(*:beschreibung/*:umfangInSWS))">XHS-0040 Der Wert UmfangInSWS darf nicht angegeben werden, wenn der Inhalt des Codewertes von leistungsart mit klausur oder pruefung endet. Bei Prüfungen handelt es sich um punktuelle Ereignisse, die nicht über das Semester verteilt sind.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0041-UnbedenklichkeitNurBeiStudienfach_HAZ"
                abstract="true">
         <sch:assert id="SCH-XHS-0041-UnbedenklichkeitNurBeiStudienfach_HAZ"
                     test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:unbedenklichkeitsvermerk) else empty(*:unbedenklichkeitsvermerk)">XHS-0041 Der Unbedenklichkeitsvermerk darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf "studienfach" oder "studiengang" gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0042-angestrebterAbschluss_HAZ" abstract="true">
         <sch:assert id="SCH-XHS-0042-angestrebterAbschluss_HAZ"
                     test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:angestrebterAbschluss) else empty(*:angestrebterAbschluss)">XHS-0042 Der angestrebte Abschluss darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0043-fachsemester_HAZ" abstract="true">
         <sch:assert id="SCH-XHS-0043-fachsemester_HAZ"
                     test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:fachsemester) else empty(*:fachsemester)">XHS-0043 Das Fachsemester darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0044-schluesselISCED2011_HAZ" abstract="true">
         <sch:assert id="SCH-XHS-0044-schluesselISCED2011_HAZ"
                     test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselISCED2011) else empty(*:schluesselISCED2011)">XHS-0044 Der Schlüssel nach ISCED2011 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0045-schluesselISCEDF2013_HAZ" abstract="true">
         <sch:assert id="SCH-XHS-0045-schluesselISCEDF2013_HAZ"
                     test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselISCEDF2013) else empty(*:schluesselISCEDF2013)">XHS-0045 Der Schlüssel nach ISCEDF2013 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0046-schluesselEQF_HAZ" abstract="true">
         <sch:assert id="SCH-XHS-0046-schluesselEQF_HAZ"
                     test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselEQF) else empty(*:schluesselEQF)">XHS-0046 Der Schlüssel nach EQF darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/immatrikulationsbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0024-WertNichtInListeLernzeitmodellImmaBesch"
                abstract="true">
         <sch:assert id="SCH-XHS-0024-WertNichtInListeLernzeitmodellImmaBesch"
                     test="(exists(*:lernzeitmodellFreitext) and ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')) or (empty(*:lernzeitmodellFreitext) and not(ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')))">XHS-0024 Wenn und nur wenn der Wert von lernzeitmodell 'wert_nicht_in_liste' ist, soll das Feld lernzeitmodellFreitext  angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0027-WertNichtInListeBeurlaubungsstatusImmaBesch"
                abstract="true">
         <sch:assert id="SCH-XHS-0027-WertNichtInListeBeurlaubungsstatusImmaBesch"
                     test="(exists(*:beurlaubungsstatusFreitext) and ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:beurlaubungsstatusFreitext) and not(ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')))">XHS-0027 Wenn und nur wenn der Wert von beurblaubungsstatus 'wert_nicht_in_liste' ist, soll das Feld beurlaubungsstatusFreitext  angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0030-WertNichtInListeImmatrikulationsstatusImmaBesch"
                abstract="true">
         <sch:assert id="SCH-XHS-0030-WertNichtInListeImmatrikulationsstatusImmaBesch"
                     test="(exists(*:immatrikulationsstatusFreitext) and ends-with(*:immatrikulationsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:immatrikulationsstatusFreitext) and not(ends-with(*:immatrikulationsstatus/code/text(), 'wert_nicht_in_liste')))">XHS-0030 Wenn und nur wenn der Wert von immatrikulationsstatus 'wert_nicht_in_liste' ist, soll das Feld immatrikulationsstatusFreitext  angegeben werden. </sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/immatrikulationsbescheinigungBAfoeGP9 -->
      <sch:rule id="rule-SCH-XHS-0015-LernzeitmodellVollOderTeilzeit" abstract="true">
         <sch:assert id="SCH-XHS-0015-LernzeitmodellVollOderTeilzeit"
                     test="ends-with(xhs:lernzeitmodell/code/text(),'/vollzeit') or ends-with(xhs:lernzeitmodell/code/text(),'/teilzeit')">XHS-0015 Das Lernzeitmodell muss auf der Immatrikulationsbescheinigung nach BaföG § 9 die Ausprägung "Teilzeit" oder "Vollzeit" haben.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0025-WertNichtInListeLernzeitmodellImmaBeschBafoeg"
                abstract="true">
         <sch:assert id="SCH-XHS-0025-WertNichtInListeLernzeitmodellImmaBeschBafoeg"
                     test="(exists(*:lernzeitmodellFreitext) and ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')) or (empty(*:lernzeitmodellFreitext) and not(ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')))">XHS-0025 Wenn und nur wenn der Wert von lernzeitmodell 'wert_nicht_in_liste' ist, soll das Feld lernzeitmodellFreitext angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0028-WertNichtInListeBeurlaubungsstatusImmaBeschBafoeg"
                abstract="true">
         <sch:assert id="SCH-XHS-0028-WertNichtInListeBeurlaubungsstatusImmaBeschBafoeg"
                     test="(exists(*:beurlaubungsstatusFreitext) and ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:beurlaubungsstatusFreitext) and not(ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')))">XHS-0028 Wenn und nur wenn der Wert von beurblaubungsstatus 'wert_nicht_in_liste' ist, soll das Feld beurlaubungsstatusFreitext  angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0031-WertNichtInListeImmatrikulationsstatusImmaBeschBafoeg"
                abstract="true">
         <sch:assert id="SCH-XHS-0031-WertNichtInListeImmatrikulationsstatusImmaBeschBafoeg"
                     test="(exists(*:immatrikulationsstatusFreitext) and ends-with(*:immatrikulationsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:immatrikulationsstatusFreitext) and not(ends-with(*:immatrikulationsstatus/code/text(), 'wert_nicht_in_liste')))">XHS-0031 Wenn und nur wenn der Wert von immatrikulationsstatus 'wert_nicht_in_liste' ist, soll das Feld immatrikulationsstatusFreitext  angegeben werden. </sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/rentenbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"
                abstract="true">
         <sch:assert id="SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"
                     test="if (*:beurlaubungsstatus/code = 'http://xhochschule.de/def/xhochschule/0.95/code/beurlaubungsstatus/beurlaubt') then exists(*:beurlaubungsgrund) else empty(*:beurlaubungsgrund)">XHS-0001 Der Beurlaubungsgrund muss und darf nur angegeben werden, wenn der Berulaubungsstatus "beurlaubt" ist. Sonst soll das Feld Beurlaubungsgrund nicht benutzt werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0002-MussAusbildungsstaetteRentenbescheinigung"
                abstract="true">
         <sch:assert id="SCH-XHS-0002-MussAusbildungsstaetteRentenbescheinigung"
                     test="exists(*:ausbildungsstaette)">XHS-0002 Die Ausbildungsstätte für den Studienabschnitt muss angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/studienverlaufsbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0006-KeinAusstellungsortSVB" abstract="true">
         <sch:assert id="SCH-XHS-0006-KeinAusstellungsortSVB"
                     test="not(ends-with(name(),':ort'))">XHS-0006 KindUnterElement:_xbd:ausstellung__ Ein Ausstellungsort darf auf der Studienverlaufsbescheinigung nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/studierenderEingeschraenkt -->
      <sch:rule id="rule-SCH-XHS-0003-ErlaubtStudierender" abstract="true">
         <sch:assert id="SCH-XHS-0003-ErlaubtStudierender"
                     test="ends-with(name(),':nameNatuerlichePerson') or ends-with(name(),':geburt') or ends-with(name(),':matrikelnummer') or ends-with(name(),':identifikationsnummer') or ends-with(name(),':hochschulsemester') or ends-with(name(),':ersteinschreibung') or ends-with(name(),':urlaubssemester')">XHS-0003 KindElement:_ Das Feld "<sch:name/>" darf in "<sch:value-of select="ancestor::*/name()"/>" nicht angegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer, xbd:identifikationsnummer, xhs:hochschulsemester, xhs:urlaubssemester, xhs:ersteinschreibung</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0004-ErlaubtNameNatuerlichePerson" abstract="true">
         <sch:assert id="SCH-XHS-0004-ErlaubtNameNatuerlichePerson"
                     test="ends-with(name(),':familienname') or ends-with(name(),':vorname') or ends-with(name(),':fruehererFamilienname')">XHS-0004 KindUnterElement:_xbd:nameNatuerlichePerson__ Das Feld "<sch:name/>" darf in "<sch:value-of select="ancestor::*/name()"/>" nicht angegeben werden. Erlaubt sind nur xbd:name, xbd:familienname, xbd:fruehererFamilienname.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0005-PflichtfelderStudierenderName" abstract="true">
         <sch:assert id="SCH-XHS-0005-PflichtfelderStudierenderName"
                     test="exists(*:nameNatuerlichePerson/*:vorname) and exists(*:nameNatuerlichePerson/*:familienname)">XHS-0005 Fehlende Angaben in xhs:Studierender/xbd:nameNatuerlichePerson. Es müssen angegeben werden: xbd:vorname, xbd:nachname</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0016-PflichtfelderStudierenderGeburt" abstract="true">
         <sch:assert id="SCH-XHS-0016-PflichtfelderStudierenderGeburt"
                     test="exists(*:geburt/*:datum)">XHS-0016 Fehlende Angabe in xhs:studierender/xbd:geburt. Es muss angegeben werden: xbd:datum.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bildungsnachweise/transcriptOfRecords -->
      <sch:rule id="rule-SCH-XHS-0020-WertNichtInListeLeistungsart_ToR" abstract="true">
         <sch:assert id="SCH-XHS-0020-WertNichtInListeLeistungsart_ToR"
                     test="(exists(*:leistungsartFreitext) and ends-with(*:leistungsart/code/text(), 'wert_nicht_in_liste')) or (empty(*:leistungsartFreitext) and not(ends-with(*:leistungsart/code/text(), 'wert_nicht_in_liste')))">XHS-0020 Wenn und nur wenn der Wert von leistungsart 'wert_nicht_in_liste' ist, soll das Feld leistungsartFreitext  angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0022-WertNichtInListeLeistungsstatus_ToR"
                abstract="true">
         <sch:assert id="SCH-XHS-0022-WertNichtInListeLeistungsstatus_ToR"
                     test="(exists(*:leistungsstatusFreitext) and ends-with(*:leistungsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:leistungsstatusFreitext) and not(ends-with(*:leistungsstatus/code/text(), 'wert_nicht_in_liste')))">XHS-0022 das Feld leistungsstatusFreitext muss angegeben werden, wenn der Wert von leistungsstatus 'wert_nicht_in_liste' ist. Wenn der Wert von leistungsstatus ein anderer ist, darf leistungsstatusFreitext nicht angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0034-KeineNoteWennStatusUnbenotet_ToR" abstract="true">
         <sch:assert id="SCH-XHS-0034-KeineNoteWennStatusUnbenotet_ToR"
                     test="if(ends-with(*:leistungsbenotungsstatus/code/text(), 'unbenotet')) then not(exists(*:note)) else (exists(*:note) or empty(*:note))">XHS-0034 Wenn die Benotung der Leistung den Status unbenotet hat, darf keine Note für diese Leistung angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0036-ModulbeschreibungNachKMK_ToR" abstract="true">
         <sch:assert id="SCH-XHS-0036-ModulbeschreibungNachKMK_ToR"
                     test="if(ends-with(*:leistungsart/code/text(), 'modul_nach_kmk')) then exists(*:beschreibung/*:modulbeschreibungNachKMK) else not(exists(*:beschreibung/*:modulbeschreibungNachKMK))">XHS-0036 Wenn und nur wenn die Leistung ein Modul nach KMK ist, soll die Beschreibung nach den Vorgaben der KMK ausgefüllt werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0040-KeineSWSBeiPruefungen_ToR" abstract="true">
         <sch:assert id="SCH-XHS-0040-KeineSWSBeiPruefungen_ToR"
                     test="if(ends-with(*:leistungsart/code/text(), 'klausur') or  ends-with(*:leistungsart/code/text(), 'pruefung')) then empty(*:beschreibung/*:umfangInSWS) else (empty(*:beschreibung/*:umfangInSWS) or exists(*:beschreibung/*:umfangInSWS))">XHS-0040 Der Wert "UmfangInSWS" darf nicht angegeben werden, wenn der Inhalt des Codewertes von "leistungsart" mit "klausur" oder "pruefung" endet. Bei Prüfungen handelt es sich um punktuelle Ereignisse, die nicht über das Semester verteilt sind.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0041-UnbedenklichkeitNurBeiStudienfach_ToR"
                abstract="true">
         <sch:assert id="SCH-XHS-0041-UnbedenklichkeitNurBeiStudienfach_ToR"
                     test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:unbedenklichkeitsvermerk) else empty(*:unbedenklichkeitsvermerk)">XHS-0041 Der Unbedenklichkeitsvermerk darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf "studienfach" oder "studiengang" gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0042-angestrebterAbschluss_ToR" abstract="true">
         <sch:assert id="SCH-XHS-0042-angestrebterAbschluss_ToR"
                     test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:angestrebterAbschluss) else empty(*:angestrebterAbschluss)">XHS-0042 Der angestrebte Abschluss darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0043-fachsemester_ToR" abstract="true">
         <sch:assert id="SCH-XHS-0043-fachsemester_ToR"
                     test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:fachsemester) else empty(*:fachsemester)">XHS-0043 Das Fachsemester darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0044-schluesselISCED2011_ToR" abstract="true">
         <sch:assert id="SCH-XHS-0044-schluesselISCED2011_ToR"
                     test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselISCED2011) else empty(*:schluesselISCED2011)">XHS-0044 Der Schlüssel nach ISCED2011 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0045-schluesselEQF_ToR" abstract="true">
         <sch:assert id="SCH-XHS-0045-schluesselEQF_ToR"
                     test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselEQF) else empty(*:schluesselEQF)">XHS-0046 Der Schlüssel nach EQF darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0045-schluesselISCEDF2013_ToR" abstract="true">
         <sch:assert id="SCH-XHS-0045-schluesselISCEDF2013_ToR"
                     test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselISCEDF2013) else empty(*:schluesselISCEDF2013)">XHS-0045 Der Schlüssel nach ISCEDF2013 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <!--Globale Regeln-->
   <sch:pattern>
      <sch:rule context="//*">
         <sch:extends rule="rule-SCH-XHS-0000-KeineLeerenElemente"/>
      </sch:rule>
   </sch:pattern>
   <!--Konkrete Regeln-->
   <sch:pattern>
      <sch:rule context="xhs:rentenbescheinigung//xhs:studienabschnitt">
         <sch:extends rule="rule-SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"/>
         <sch:extends rule="rule-SCH-XHS-0002-MussAusbildungsstaetteRentenbescheinigung"/>
         <sch:extends rule="rule-SCH-XHS-0026-WertNichtInListeLernzeitmodellStudienabschnitt"/>
         <sch:extends rule="rule-SCH-XHS-0029-WertNichtInListeBeurlaubungsstatusStudienabschnitt"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:exmatrikulationsbescheinigung//xhs:studierender">
         <sch:extends rule="rule-SCH-XHS-0005-PflichtfelderStudierenderName"/>
         <sch:extends rule="rule-SCH-XHS-0016-PflichtfelderStudierenderGeburt"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xhs:studierender">
         <sch:extends rule="rule-SCH-XHS-0005-PflichtfelderStudierenderName"/>
         <sch:extends rule="rule-SCH-XHS-0016-PflichtfelderStudierenderGeburt"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:immatrikulationsbescheinigung//xhs:studierender">
         <sch:extends rule="rule-SCH-XHS-0005-PflichtfelderStudierenderName"/>
         <sch:extends rule="rule-SCH-XHS-0016-PflichtfelderStudierenderGeburt"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:rentenbescheinigung//xhs:studierender">
         <sch:extends rule="rule-SCH-XHS-0005-PflichtfelderStudierenderName"/>
         <sch:extends rule="rule-SCH-XHS-0016-PflichtfelderStudierenderGeburt"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:studienverlaufsbescheinigung//xhs:studierender">
         <sch:extends rule="rule-SCH-XHS-0005-PflichtfelderStudierenderName"/>
         <sch:extends rule="rule-SCH-XHS-0016-PflichtfelderStudierenderGeburt"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:transcriptOfRecords//xhs:studierender">
         <sch:extends rule="rule-SCH-XHS-0005-PflichtfelderStudierenderName"/>
         <sch:extends rule="rule-SCH-XHS-0016-PflichtfelderStudierenderGeburt"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:immatrikulationsbescheinigungBAfoeGP9//xhs:studierender">
         <sch:extends rule="rule-SCH-XHS-0010-MussNameNatuerlichePerson"/>
         <sch:extends rule="rule-SCH-XHS-0011-KeinGeschlecht"/>
         <sch:extends rule="rule-SCH-XHS-0012-KeineWohnanschrift"/>
         <sch:extends rule="rule-SCH-XHS-0013-KeineSemester"/>
         <sch:extends rule="rule-SCH-XHS-0014-KeineAnrede"/>
         <sch:extends rule="rule-SCH-XHS-0018-GeburtPflicht"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:immatrikulationsbescheinigungBAfoeGP9">
         <sch:extends rule="rule-SCH-XHS-0015-LernzeitmodellVollOderTeilzeit"/>
         <sch:extends rule="rule-SCH-XHS-0025-WertNichtInListeLernzeitmodellImmaBeschBafoeg"/>
         <sch:extends rule="rule-SCH-XHS-0028-WertNichtInListeBeurlaubungsstatusImmaBeschBafoeg"/>
         <sch:extends rule="rule-SCH-XHS-0031-WertNichtInListeImmatrikulationsstatusImmaBeschBafoeg"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xhs:benotung">
         <sch:extends rule="rule-SCH-XHS-0017-PflichtfelderBenotung"/>
         <sch:extends rule="rule-SCH-XHS-0032-WertNichtInListeLateinischeEhrenbezeichnung"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xhs:leistung">
         <sch:extends rule="rule-SCH-XHS-0020-WertNichtInListeLeistungsart_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0022-WertNichtInListeLeistungsstatus_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0034-KeineNoteWennStatusUnbenotet_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0036-ModulbeschreibungNachKMK_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0040-KeineSWSBeiPruefungen_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0041-UnbedenklichkeitNurBeiStudienfach_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0042-angestrebterAbschluss_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0043-fachsemester_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0044-schluesselISCED2011_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0045-schluesselISCEDF2013_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0046-schluesselEQF_HAZ"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xhs:teilleistung">
         <sch:extends rule="rule-SCH-XHS-0020-WertNichtInListeLeistungsart_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0022-WertNichtInListeLeistungsstatus_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0034-KeineNoteWennStatusUnbenotet_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0036-ModulbeschreibungNachKMK_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0040-KeineSWSBeiPruefungen_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0041-UnbedenklichkeitNurBeiStudienfach_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0042-angestrebterAbschluss_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0043-fachsemester_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0044-schluesselISCED2011_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0045-schluesselISCEDF2013_HAZ"/>
         <sch:extends rule="rule-SCH-XHS-0046-schluesselEQF_HAZ"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:transcriptOfRecords//xhs:leistung">
         <sch:extends rule="rule-SCH-XHS-0020-WertNichtInListeLeistungsart_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0022-WertNichtInListeLeistungsstatus_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0034-KeineNoteWennStatusUnbenotet_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0036-ModulbeschreibungNachKMK_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0040-KeineSWSBeiPruefungen_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0041-UnbedenklichkeitNurBeiStudienfach_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0042-angestrebterAbschluss_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0043-fachsemester_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0044-schluesselISCED2011_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0045-schluesselEQF_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0045-schluesselISCEDF2013_ToR"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:transcriptOfRecords//xhs:teilleistung">
         <sch:extends rule="rule-SCH-XHS-0020-WertNichtInListeLeistungsart_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0022-WertNichtInListeLeistungsstatus_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0034-KeineNoteWennStatusUnbenotet_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0036-ModulbeschreibungNachKMK_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0040-KeineSWSBeiPruefungen_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0041-UnbedenklichkeitNurBeiStudienfach_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0042-angestrebterAbschluss_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0043-fachsemester_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0044-schluesselISCED2011_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0045-schluesselEQF_ToR"/>
         <sch:extends rule="rule-SCH-XHS-0045-schluesselISCEDF2013_ToR"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:immatrikulationsbescheinigung">
         <sch:extends rule="rule-SCH-XHS-0024-WertNichtInListeLernzeitmodellImmaBesch"/>
         <sch:extends rule="rule-SCH-XHS-0027-WertNichtInListeBeurlaubungsstatusImmaBesch"/>
         <sch:extends rule="rule-SCH-XHS-0030-WertNichtInListeImmatrikulationsstatusImmaBesch"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:exmatrikulationsbescheinigung//xhs:aufzaehlung">
         <sch:extends rule="rule-SCH-XHS-0026-WertNichtInListeLernzeitmodellStudienabschnitt"/>
         <sch:extends rule="rule-SCH-XHS-0029-WertNichtInListeBeurlaubungsstatusStudienabschnitt"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:studienverlaufsbescheinigung//xhs:aufzaehlung">
         <sch:extends rule="rule-SCH-XHS-0026-WertNichtInListeLernzeitmodellStudienabschnitt"/>
         <sch:extends rule="rule-SCH-XHS-0029-WertNichtInListeBeurlaubungsstatusStudienabschnitt"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis/xhs:leistung//xbd:note">
         <sch:extends rule="rule-SCH-XHS-0033-Benotungsschema"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:transcriptOfRecords//xbd:note">
         <sch:extends rule="rule-SCH-XHS-0033-Benotungsschema"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xbd:note">
         <sch:extends rule="rule-SCH-XHS-0033-BenotungsschemaGesamtnoteundAbschlussarbeit"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:exmatrikulationsbescheinigung//xhs:zusammenfassung">
         <sch:extends rule="rule-SCH-XHS-0038-WertNichtInListeLernzeitmodellStudienabschnittZusammenfassung"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:studienverlaufsbescheinigung//xhs:zusammenfassung">
         <sch:extends rule="rule-SCH-XHS-0038-WertNichtInListeLernzeitmodellStudienabschnittZusammenfassung"/>
      </sch:rule>
   </sch:pattern>
   <!--Konkrete Regeln mit Kindelementen-->
   <sch:pattern>
      <sch:rule context="xhs:exmatrikulationsbescheinigung//xhs:studierender/*">
         <sch:extends rule="rule-SCH-XHS-0003-ErlaubtStudierender"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xhs:studierender/*">
         <sch:extends rule="rule-SCH-XHS-0003-ErlaubtStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0019-KeineSemesterHAZ"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:immatrikulationsbescheinigung//xhs:studierender/*">
         <sch:extends rule="rule-SCH-XHS-0003-ErlaubtStudierender"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:rentenbescheinigung//xhs:studierender/*">
         <sch:extends rule="rule-SCH-XHS-0003-ErlaubtStudierender"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:studienverlaufsbescheinigung//xhs:studierender/*">
         <sch:extends rule="rule-SCH-XHS-0003-ErlaubtStudierender"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:transcriptOfRecords//xhs:studierender/*">
         <sch:extends rule="rule-SCH-XHS-0003-ErlaubtStudierender"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:exmatrikulationsbescheinigung//xhs:studierender/xbd:nameNatuerlichePerson/*">
         <sch:extends rule="rule-SCH-XHS-0004-ErlaubtNameNatuerlichePerson"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xhs:studierender/xbd:nameNatuerlichePerson/*">
         <sch:extends rule="rule-SCH-XHS-0004-ErlaubtNameNatuerlichePerson"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:immatrikulationsbescheinigung//xhs:studierender/xbd:nameNatuerlichePerson/*">
         <sch:extends rule="rule-SCH-XHS-0004-ErlaubtNameNatuerlichePerson"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:rentenbescheinigung//xhs:studierender/xbd:nameNatuerlichePerson/*">
         <sch:extends rule="rule-SCH-XHS-0004-ErlaubtNameNatuerlichePerson"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:studienverlaufsbescheinigung//xhs:studierender/xbd:nameNatuerlichePerson/*">
         <sch:extends rule="rule-SCH-XHS-0004-ErlaubtNameNatuerlichePerson"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:transcriptOfRecords//xhs:studierender/xbd:nameNatuerlichePerson/*">
         <sch:extends rule="rule-SCH-XHS-0004-ErlaubtNameNatuerlichePerson"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:studienverlaufsbescheinigung/xbd:ausstellung/*">
         <sch:extends rule="rule-SCH-XHS-0006-KeinAusstellungsortSVB"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis/xbd:gueltigkeitszeitraum/*">
         <sch:extends rule="rule-SCH-XHS-0007-KeinAblaufdatumZeugnis"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:exmatrikulationsbescheinigung/xbd:ausstellung/*">
         <sch:extends rule="rule-SCH-XHS-0008-KeinAusstellungsortExmatrikulationsbescheinigung"/>
      </sch:rule>
   </sch:pattern>
</sch:schema>
