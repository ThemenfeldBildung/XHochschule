<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            queryBinding="xslt2">   
   <sch:ns prefix="xbd" uri="http://xbildung.de/def/xbildung/0.93/xsd"/>
   <sch:ns prefix="xhs" uri="http://xhochschule.de/def/xhochschule/0.93/xsd"/>   
   <sch:pattern><!--Abstrakte Regeln--><!-- /Data/XHochschule/Bescheinigungen/exmatrikulationsbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0000-KeineLeerenElemente" abstract="true">
         <sch:assert id="SCH-XHS-0000-KeineLeerenElemente"
                     test="normalize-space(string())!=''">GlobaleRegel:_ Das Element <sch:name/>  in <sch:value-of select="ancestor::*/name()"/> ist leer. Leere Elemente sind nicht erlaubt.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0008-KeinAusstellungsortExmatrikulationsbescheinigung"
                abstract="true">
         <sch:assert id="SCH-XHS-0008-KeinAusstellungsortExmatrikulationsbescheinigung"
                     test="not(ends-with(name(),':ort'))">KindUnterElement:_xbd:ausstellung__ Ein Ausstellungsort darf auf der Exmatrikulationsbescheinigung nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bildungsnachweise/hochschulabschlusszeugnis -->
      <sch:rule id="rule-SCH-XHS-0007-KeinAblaufdatumZeugnis" abstract="true">
         <sch:assert id="SCH-XHS-0007-KeinAblaufdatumZeugnis"
                     test="not(ends-with(name(),':ende'))">KindUnterElement:_xbd:gueltigekeitszeitraum__ Das Element <sch:name/> darf nicht angegeben werden. Die Gültigkeit eines Zeugnisses läuft nicht ab.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/rentenbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"
                abstract="true">
         <sch:assert id="SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"
                     test="if (*:beurlaubungsstatus/code = 'http://xhochschule.de/def/xhochschule/0.93/code/beurlaubungsstatus/beurlaubt') then exists(*:beurlaubungsgrund) else empty(*:beurlaubungsgrund)">Der Beurlaubungsgrund muss und darf nur angegeben werden, wenn der Berulaubungsstatus "beurlaubt" ist. Sonst soll das Feld Beurlaubungsgrund nicht benutzt werden.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0002-MussAusbildungsstaetteRentenbescheinigung"
                abstract="true">
         <sch:assert id="SCH-XHS-0002-MussAusbildungsstaetteRentenbescheinigung"
                     test="exists(*:ausbildungsstaette)">Die Ausbildungsstätte für den Studienabschnitt muss angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/studienverlaufsbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0006-KeinAusstellungsortSVB" abstract="true">
         <sch:assert id="SCH-XHS-0006-KeinAusstellungsortSVB"
                     test="not(ends-with(name(),':ort'))">KindUnterElement:_xbd:ausstellung__ Ein Ausstellungsort darf auf der Studienverlaufsbescheinigung nicht angegeben werden.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Baukasten/Anonymous/studierenderEingeschraenkt -->
      <sch:rule id="rule-SCH-XHS-0003-ErlaubtStudierender" abstract="true">
         <sch:assert id="SCH-XHS-0003-ErlaubtStudierender"
                     test="ends-with(name(),':nameNatuerlichePerson') or ends-with(name(),':geburt') or ends-with(name(),':matrikelnummer') or ends-with(name(),':identifikationsnummer') or ends-with(name(),':hochschulsemester') or ends-with(name(),':ersteinschreibung') or ends-with(name(),':urlaubssemester')">KindElement:_ Das Feld "<sch:name/>" darf in "<sch:value-of select="ancestor::*/name()"/>" nicht agegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer, xbd:identifikationsnummer, xhs:hochschulsemester, xhs:urlaubssemester, xhs:ersteinschreibung</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0004-ErlaubtNameNatuerlichePerson" abstract="true">
         <sch:assert id="SCH-XHS-0004-ErlaubtNameNatuerlichePerson"
                     test="ends-with(name(),':familienname') or ends-with(name(),':vorname') or ends-with(name(),':alternativeRepraesentation')">KindUnterElement:_xbd:nameNatuerlichePerson__ Das Feld "<sch:name/>" darf in "<sch:value-of select="ancestor::*/name()"/>" nicht agegeben werden. Erlaubt sind nur xbd:name, xbd:familienname, xbd:alternativeRepraesentation</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0005-PflichtfelderStudierenderName" abstract="true">
         <sch:assert id="SCH-XHS-0005-PflichtfelderStudierenderName"
                     test="exists(*:nameNatuerlichePerson/*:vorname) and exists(*:nameNatuerlichePerson/*:familienname)">Fehlende Angaben in xhs:Studierender/xbd:nameNatuerlichePerson. Es müssen angegeben werden: xbd:vorname, xbd:nachname </sch:assert>
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
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:diplomaSupplement//xhs:angabenInhaber">
         <sch:extends rule="rule-SCH-XHS-0005-PflichtfelderStudierenderName"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:exmatrikulationsbescheinigung//xhs:studierender">
         <sch:extends rule="rule-SCH-XHS-0005-PflichtfelderStudierenderName"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xhs:studierender">
         <sch:extends rule="rule-SCH-XHS-0005-PflichtfelderStudierenderName"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:rentenbescheinigung//xhs:studierender">
         <sch:extends rule="rule-SCH-XHS-0005-PflichtfelderStudierenderName"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:studienverlaufsbescheinigung//xhs:studierender">
         <sch:extends rule="rule-SCH-XHS-0005-PflichtfelderStudierenderName"/>
      </sch:rule>
   </sch:pattern>
   <!--Konkrete Regeln mit Kindelementen-->
   <sch:pattern>
      <sch:rule context="xhs:diplomaSupplement//xhs:angabenInhaber/*">
         <sch:extends rule="rule-SCH-XHS-0003-ErlaubtStudierender"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:exmatrikulationsbescheinigung//xhs:studierender/*">
         <sch:extends rule="rule-SCH-XHS-0003-ErlaubtStudierender"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xhs:studierender/*">
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
      <sch:rule context="xhs:diplomaSupplement//xhs:angabenInhaber/xbd:nameNatuerlichePerson/*">
         <sch:extends rule="rule-SCH-XHS-0004-ErlaubtNameNatuerlichePerson"/>
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
      <sch:rule context="xhs:studienverlaufsbescheinigung/xbd:ausstellung/*">
         <sch:extends rule="rule-SCH-XHS-0006-KeinAusstellungsortSVB"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis/xbd:gueltigekeitszeitraum/*">
         <sch:extends rule="rule-SCH-XHS-0007-KeinAblaufdatumZeugnis"/>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:exmatrikulationsbescheinigung/xbd:ausstellung/*">
         <sch:extends rule="rule-SCH-XHS-0008-KeinAusstellungsortExmatrikulationsbescheinigung"/>
      </sch:rule>
   </sch:pattern>
</sch:schema>
