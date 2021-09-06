<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            queryBinding="xslt2">
   <sch:ns prefix="dinspec91379"
           uri="urn:xoev-de:kosit:xoev:datentyp:din-spec-91379_2019-03"/>
   <sch:ns prefix="elmo" uri="https://github.com/emrex-eu/elmo-schemas/tree/v1"/>
   <sch:ns prefix="eup" uri="http://data.europa.eu/snb"/>
   <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>
   <sch:ns prefix="loc" uri="http://www.w3.org/ns/corevocabulary/location"/>
   <sch:ns prefix="per" uri="http://www.w3.org/ns/corevocabulary/person"/>
   <sch:ns prefix="xbd" uri="http://xbildung.de/def/xbildung/0.7/xsd"/>
   <sch:ns prefix="xhs" uri="http://xhochschule.de/def/xhochschule/0.7/xsd"/>
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
      <!-- /Data/XHochschule/Baukasten/Anonymous/angabenStudienabschnittExmatrikulationsbescheinigung -->
      <sch:rule id="rule-SCH-KeinBeurlaubungsgrund-0001" abstract="true">
         <sch:assert id="SCH-KeinBeurlaubungsgrund-0001" test="empty(xhs:beurlaubungsgrund)"/>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/angabenStudienabschnittRentenbescheinigung -->
      <sch:rule id="rule-SCH-Ausbildungsstaette-0002" abstract="true">
         <sch:assert id="SCH-Ausbildungsstaette-0002" test="exists(xhs:ausbildungsstätte)">Für eine Bescheinigung zur Vorlage bei der Deutschen Rentenversicherung, muss der Name der Ausbildungsstätte für den Studienabschnitt angegeben werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-Beurlaubungsgrund-0001" abstract="true">
         <sch:assert id="SCH-Beurlaubungsgrund-0001"
                     test="(exists(xhs:beurlaubungsgrund) and not(contains(xhs:beurlaubungsstatus//code,'http://xhochschule.de/def/xhochschule/0.7/code/beurlaubungsstatus/beurlaubt' ))) or (empty(xhs:beurlaubungsgrund) and contains(xhs:beurlaubungsstatus//code,'http://xhochschule.de/def/xhochschule/0.7/code/beurlaubungsstatus/nicht_beurlaubt' ))">Für eine Bescheinigung zur Vorlage bei der Deutschen Rentenversicherung muss der Grund der Beurlaubung angegeben werden, wenn der Studierende beurlaubt ist.</sch:assert>
      </sch:rule>
      <!--Konkrete Regeln-->
      <sch:rule context="xhs:rentenbescheinigung//xhs:studienabschnitte">
         <sch:extends rule="rule-SCH-Ausbildungsstaette-0002"/>
         <sch:extends rule="rule-SCH-Beurlaubungsgrund-0001"/>
      </sch:rule>
      <sch:rule context="xhs:exmatrikulationsbescheinigung//xhs:studienabschnitt">
         <sch:extends rule="rule-SCH-KeinBeurlaubungsgrund-0001"/>
      </sch:rule>
   </sch:pattern>
</sch:schema>
