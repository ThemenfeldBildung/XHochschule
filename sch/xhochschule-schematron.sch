<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            queryBinding="xslt2">   
   <sch:ns prefix="xbd" uri="http://xbildung.de/def/xbildung/0.9/xsd"/>
   <sch:ns prefix="xhs" uri="http://xhochschule.de/def/xhochschule/0.9/xsd"/>
   <sch:pattern>
      <!--Abstrakte Regeln-->
      <!-- /Data/XHochschule/Bildungsnachweise/diplomaSupplement -->
      <sch:rule id="rule-SCH-XHS-0018-KeinEinsatzzweckDiplomaSupplement"
                abstract="true">
         <sch:assert id="SCH-XHS-0018-KeinEinsatzzweckDiplomaSupplement"
                     test="empty(xbd:einsatzzweck)">Ein Einsatzzweck ist an dieser Stelle nicht anzugeben.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/exmatrikulationsbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0006-KeinEinsatzzweckExmatrikulationsbescheinigung"
                abstract="true">
         <sch:assert id="SCH-XHS-0006-KeinEinsatzzweckExmatrikulationsbescheinigung"
                     test="empty(xbd:einsatzzweck)">Ein Einsatzzweck ist an dieser Stelle nicht anzugeben.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bildungsnachweise/hochschulabschlusszeugnis -->
      <sch:rule id="rule-SCH-XHS-0019-KeinEinsatzzweckHochschulabschlusszeugnis"
                abstract="true">
         <sch:assert id="SCH-XHS-0019-KeinEinsatzzweckHochschulabschlusszeugnis"
                     test="empty(xbd:einsatzzweck)">Ein Einsatzzweck ist an dieser Stelle nicht anzugeben.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/hochschuleOhneAnschrift -->
      <sch:rule id="rule-SCH-XHS-0004-KeineAnschriftHochschule" abstract="true">
         <sch:assert id="SCH-XHS-0004-KeineAnschriftHochschule" test="empty(xbd:anschrift)">Das Feld xbd:anschrift ist an dieser Stelle nicht anzugeben.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/rentenbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"
                abstract="true">
         <sch:assert id="SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"
                     test="if (xhs:beurlaubungsstatus/code = 'http://xhochschule.de/def/xhochschule/0.9/code/beurlaubungsstatus/beurlaubt') then exists(xhs:beurlaubungsgrund) else empty(xhs:beurlaubungsgrund)">Für eine Bescheinigung zur Vorlage bei der Deutschen Rentenversicherung muss der Grund der Beurlaubung angegeben werden, wenn der Studierende beurlaubt ist.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0002-MussAusbildungsstaetteRentenbescheinigung"
                abstract="true">
         <sch:assert id="SCH-XHS-0002-MussAusbildungsstaetteRentenbescheinigung"
                     test="exists(xhs:ausbildungsstaette)">Die Ausbildungsstätte für den Studienabschnitt ist anzugeben.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0017-KeinEinsatzzweckRentenbescheinigung"
                abstract="true">
         <sch:assert id="SCH-XHS-0017-KeinEinsatzzweckRentenbescheinigung"
                     test="empty(xbd:einsatzzweck)">Ein Einsatzzweck ist an dieser Stelle nicht anzugeben.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/studierenderNameVornameOhneAnschrift -->
      <sch:rule id="rule-SCH-XHS-0003-KeineAnschriftStudierender" abstract="true">
         <sch:assert id="SCH-XHS-0003-KeineAnschriftStudierender"
                     test="empty(xbd:anschrift)">Das Feld xbd:anschrift ist an dieser Stelle nicht anzugeben.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0008-KeinFruehererVornameStudierender" abstract="true">
         <sch:assert id="SCH-XHS-0008-KeinFruehererVornameStudierender"
                     test="empty(xbd:nameNatuerlichePerson//xbd:fruehererVorname)">Das Feld xbd:fruehererVorname ist an dieser Stelle nicht anzugeben.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0009-KeinFruehererFamiliennameStudierender"
                abstract="true">
         <sch:assert id="SCH-XHS-0009-KeinFruehererFamiliennameStudierender"
                     test="empty(xbd:nameNatuerlichePerson//xbd:fruehererFamilienname)">Das Feld xbd:fruehererFamilienname ist an dieser Stelle nicht anzugeben.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0010-KeinGeburtsnameStudierender" abstract="true">
         <sch:assert id="SCH-XHS-0010-KeinGeburtsnameStudierender"
                     test="empty(xbd:nameNatuerlichePerson//xbd:geburtsname)">Das Feld xbd:geburtsname ist an dieser Stelle nicht anzugeben.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0011-KeinRufnameStudierender" abstract="true">
         <sch:assert id="SCH-XHS-0011-KeinRufnameStudierender"
                     test="empty(xbd:nameNatuerlichePerson//xbd:rufname)">Das Feld xbd:rufname ist an dieser Stelle nicht anzugeben.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0012-KeinTitelStudierender" abstract="true">
         <sch:assert id="SCH-XHS-0012-KeinTitelStudierender"
                     test="empty(xbd:nameNatuerlichePerson//xbd:titel)">Das Feld xbd:titel ist an dieser Stelle nicht anzugeben.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0013-KeineAnredeStudierender" abstract="true">
         <sch:assert id="SCH-XHS-0013-KeineAnredeStudierender"
                     test="empty(xbd:nameNatuerlichePerson//xbd:anrede)">Das Feld xbd:anrede ist an dieser Stelle nicht anzugeben.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0014-KeinNamessuffixStudierender" abstract="true">
         <sch:assert id="SCH-XHS-0014-KeinNamessuffixStudierender"
                     test="empty(xbd:nameNatuerlichePerson//xbd:namenssuffix)">Das Feld xbd:namenssuffix ist an dieser Stelle nicht anzugeben.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0015-KeineAlternativeRepraesentationStudierender"
                abstract="true">
         <sch:assert id="SCH-XHS-0015-KeineAlternativeRepraesentationStudierender"
                     test="empty(xbd:nameNatuerlichePerson//xbd:alternativeRepraesentation)">Das Feld xbd:alternativeRepraesentation ist an dieser Stelle nicht anzugeben.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0016-KeinGeschlechtStudierender" abstract="true">
         <sch:assert id="SCH-XHS-0016-KeinGeschlechtStudierender"
                     test="empty(xbd:geschlecht)">Das Feld xbd:geschlecht ist an dieser Stelle nicht anzugeben.</sch:assert>
      </sch:rule>
      <!--Konkrete Regeln-->
      <sch:rule context="xhs:rentenbescheinigung//xhs:studienabschnitte">
         <sch:extends rule="rule-SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"/>
         <sch:extends rule="rule-SCH-XHS-0002-MussAusbildungsstaetteRentenbescheinigung"/>
      </sch:rule>
      <sch:rule context="xhs:exmatrikulationsbescheinigung//xhs:studierender">
         <sch:extends rule="rule-SCH-XHS-0003-KeineAnschriftStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0008-KeinFruehererVornameStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0009-KeinFruehererFamiliennameStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0010-KeinGeburtsnameStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0011-KeinRufnameStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0012-KeinTitelStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0013-KeineAnredeStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0014-KeinNamessuffixStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0015-KeineAlternativeRepraesentationStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0016-KeinGeschlechtStudierender"/>
      </sch:rule>
      <sch:rule context="xhs:rentenbescheinigung//xhs:studierender">
         <sch:extends rule="rule-SCH-XHS-0003-KeineAnschriftStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0008-KeinFruehererVornameStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0009-KeinFruehererFamiliennameStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0010-KeinGeburtsnameStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0011-KeinRufnameStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0012-KeinTitelStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0013-KeineAnredeStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0014-KeinNamessuffixStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0015-KeineAlternativeRepraesentationStudierender"/>
         <sch:extends rule="rule-SCH-XHS-0016-KeinGeschlechtStudierender"/>
      </sch:rule>
      <sch:rule context="xhs:exmatrikulationsbescheinigung//xhs:ausstellendeHochschule">
         <sch:extends rule="rule-SCH-XHS-0004-KeineAnschriftHochschule"/>
      </sch:rule>
      <sch:rule context="xhs:exmatrikulationsbescheinigung">
         <sch:extends rule="rule-SCH-XHS-0006-KeinEinsatzzweckExmatrikulationsbescheinigung"/>
      </sch:rule>
      <sch:rule context="xhs:rentenbescheinigung">
         <sch:extends rule="rule-SCH-XHS-0017-KeinEinsatzzweckRentenbescheinigung"/>
      </sch:rule>
      <sch:rule context="xhs:diplomaSupplement">
         <sch:extends rule="rule-SCH-XHS-0018-KeinEinsatzzweckDiplomaSupplement"/>
      </sch:rule>
      <sch:rule context="xhs:hochschulabschlusszeugnis">
         <sch:extends rule="rule-SCH-XHS-0019-KeinEinsatzzweckHochschulabschlusszeugnis"/>
      </sch:rule>
   </sch:pattern>
</sch:schema>
