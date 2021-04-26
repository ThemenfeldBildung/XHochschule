<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            queryBinding="xslt2">
   <sch:ns prefix="dinspec91379"
           uri="urn:xoev-de:kosit:xoev:datentyp:din-spec-91379_2019-03"/>
   <sch:ns prefix="eup" uri="http://data.europa.eu/snb"/>
   <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>
   <sch:ns prefix="loc" uri="http://www.w3.org/ns/corevocabulary/location"/>
   <sch:ns prefix="per" uri="http://www.w3.org/ns/corevocabulary/person"/>
   <sch:ns prefix="xbd" uri="http://xbildung.de/def/xbildung/0.4/xsd"/>
   <sch:ns prefix="xhs" uri="http://xhochschule.de/def/xhochschule/0.4/xsd"/>
   <sch:ns prefix="xiaa" uri="http://www.osci.de/xinneres/auslandsanschrift/3"/>
   <sch:ns prefix="xian" uri="http://www.osci.de/xinneres/allgemeinername/2"/>
   <sch:ns prefix="xiaz" uri="http://www.osci.de/xinneres/azrnummer/1"/>
   <sch:ns prefix="xibehoerde" uri="http://www.osci.de/xinneres/behoerde/4"/>
   <sch:ns prefix="xicgvz"
           uri="http://www.osci.de/xinneres/codes/gemeindeverzeichnis/2"/>
   <sch:ns prefix="xida" uri="http://www.osci.de/xinneres/datum/2"/>
   <sch:ns prefix="xikomm" uri="http://www.osci.de/xinneres/kommunikation/3"/>
   <sch:ns prefix="xilb" uri="http://www.osci.de/xinneres/lichtbild/1"/>
   <sch:ns prefix="xima" uri="http://www.osci.de/xinneres/meldeanschrift/3"/>
   <sch:ns prefix="xink" uri="http://www.osci.de/xinneres/basisnachricht/4"/>
   <sch:ns prefix="xint" uri="http://www.osci.de/xinneres/nachrichtentypen/4"/>
   <sch:ns prefix="xipa" uri="http://www.osci.de/xinneres/postanschrift/3"/>
   <sch:ns prefix="xiqu" uri="http://www.osci.de/xinneres/quittung/2"/>
   <sch:ns prefix="xirts" uri="http://www.osci.de/xinneres/rueckweisung/3"/>
   <sch:ns prefix="xiwl" uri="http://www.osci.de/xinneres/weiterleitung/4"/>
   <sch:ns prefix="xml" uri="http://www.w3.org/XML/1998/namespace"/>
   <sch:ns prefix="xoev-code" uri="http://xoev.de/schemata/code/1_0"/>
   <sch:ns prefix="xoev-lc" uri="http://xoev.de/latinchars/1_1/datatypes"/>
   <sch:pattern>
      <!--Abstrakte Regeln-->
      <!-- /Data/XHochschule/Nachrichten/Nachweis/Anonymous/angabenStudierenderBAfoeGP9 -->
      <sch:rule id="rule-SCH-Einschreibung-0004" abstract="true">
         <sch:assert id="SCH-Einschreibung-0004" test="exists(xhs:einschreibung)">Für den Studierenden muss ein Immatrikulationsstatus auf der Immatrikulationsbescheinigung nach BAföG §9 angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-KeinGeschlecht-0001" abstract="true">
         <sch:assert id="SCH-KeinGeschlecht-0001" test="empty(xbd:geschlecht)">Für den Studierenden darf auf der Immatrikulationsbescheinigung nach BaföG §9 kein Geschlecht angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-NameNatuerlichePerson-0003" abstract="true">
         <sch:assert id="SCH-NameNatuerlichePerson-0003"
                     test="exists(xbd:nameNatuerlichePerson/xbd:familienname)">Für den Studierenden muss zur Identifikation auf der Immatrikulationsbescheinigung nach BAföG §9 ein Familienname angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-WohnanschriftEinfach-0002" abstract="true">
         <sch:assert id="SCH-WohnanschriftEinfach-0002"
                     test="exists(xbd:anschrift/xbd:strasse) and exists(xbd:anschrift/xbd:postleitzahl) and exists(xbd:anschrift/xbd:ort)">Für den Studierenden muss zur Identifikation auf der Immatrikulationsbescheinigung nach BAföG §9 eine Wohnanschrift angegeben werden.</sch:assert>
      </sch:rule>
      <!--Konkrete Regeln-->
      <sch:rule context="xhs:immatrikulationsbescheinigungBAfoeGP9.0002//xhs:studierender">
         <sch:extends rule="rule-SCH-Einschreibung-0004"/>
         <sch:extends rule="rule-SCH-KeinGeschlecht-0001"/>
         <sch:extends rule="rule-SCH-NameNatuerlichePerson-0003"/>
         <sch:extends rule="rule-SCH-WohnanschriftEinfach-0002"/>
      </sch:rule>
   </sch:pattern>
</sch:schema>
