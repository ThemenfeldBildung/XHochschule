<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            queryBinding="xslt2">
   <sch:ns prefix="xbd" uri="http://xbildung.de/def/xbildung/0.93/xsd"/>
   <sch:ns prefix="xhs" uri="http://xhochschule.de/def/xhochschule/0.94/xsd"/>
   <sch:pattern><!--Abstrakte Regeln--><!-- /Data/XHochschule/Baukasten/Anonymous/angabenStudierenderBAfoeGP9 -->
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
                     test="empty(xhs:hochschulsemester) and empty(xhs:urlaubssemester)">XHS-0013 Die Zahl der Hochschulsemester und Urlaubssemester des Studierenden werden auf der Immatrikulationsbescheinigung nach BaföG §9 nicht benötigt.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0014-KeineAnrede" abstract="true">
         <sch:assert id="SCH-XHS-0014-KeineAnrede" test="empty(xbd:anrede)">XHS-0014 Die Anrede des Studierenden wird auf der Immatrikulationsbescheinigung nach BaföG §9 nicht benötigt.</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0018-GeburtPflicht" abstract="true">
         <sch:assert id="SCH-XHS-0018-GeburtPflicht"
                     test="exists(*:geburt/*:datum) and exists(*:geburt/*:geburtsort/*:ort)">XHS-0018 Geburtsort und Geburtsdatum des Studierenden müssen auf der Immatrikulationsbescheinigung nach BaföG §9 angegeben werden.</sch:assert>
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
                     test="exists(*:gesamtnote/*:note)">XHS-0017 Fehlende Angabe in xhs:benotung. Es muss angegeben werden: xhs:gesamtnote/xbd:note</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/immatrikulationsbescheinigungBAfoeGP9 -->
      <sch:rule id="rule-SCH-XHS-0015-LernzeitmodellVollOderTeilzeit" abstract="true">
         <sch:assert id="SCH-XHS-0015-LernzeitmodellVollOderTeilzeit"
                     test="ends-with(xhs:lernzeitmodell/code/text(),'/vollzeit') or ends-with(xhs:lernzeitmodell/code/text(),'/teilzeit')">XHS-0015 Das Lernzeitmodell muss auf der Immatrikulationsbescheinigung nach BaföG §9 die Ausprägung "Teilzeit" oder "Vollzeit" haben.</sch:assert>
      </sch:rule>
      <!-- /Data/XHochschule/Bescheinigungen/rentenbescheinigung -->
      <sch:rule id="rule-SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"
                abstract="true">
         <sch:assert id="SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund"
                     test="if (*:beurlaubungsstatus/code = 'http://xhochschule.de/def/xhochschule/0.94/code/beurlaubungsstatus/beurlaubt') then exists(*:beurlaubungsgrund) else empty(*:beurlaubungsgrund)">XHS-0001 Der Beurlaubungsgrund muss und darf nur angegeben werden, wenn der Berulaubungsstatus "beurlaubt" ist. Sonst soll das Feld Beurlaubungsgrund nicht benutzt werden.</sch:assert>
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
                     test="ends-with(name(),':nameNatuerlichePerson') or ends-with(name(),':geburt') or ends-with(name(),':matrikelnummer') or ends-with(name(),':identifikationsnummer') or ends-with(name(),':hochschulsemester') or ends-with(name(),':ersteinschreibung') or ends-with(name(),':urlaubssemester')">XHS-0003 KindElement:_ Das Feld "<sch:name/>" darf in "<sch:value-of select="ancestor::*/name()"/>" nicht agegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer, xbd:identifikationsnummer, xhs:hochschulsemester, xhs:urlaubssemester, xhs:ersteinschreibung</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0004-ErlaubtNameNatuerlichePerson" abstract="true">
         <sch:assert id="SCH-XHS-0004-ErlaubtNameNatuerlichePerson"
                     test="ends-with(name(),':familienname') or ends-with(name(),':vorname') or&#xA;ends-with(name(),':fruehererFamilienname')">XHS-0004 KindUnterElement:_xbd:nameNatuerlichePerson__ Das Feld "<sch:name/>" darf in "<sch:value-of select="ancestor::*/name()"/>" nicht agegeben werden. Erlaubt sind nur xbd:name, xbd:familienname, xbd:fruehererFamilienname</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0005-PflichtfelderStudierenderName" abstract="true">
         <sch:assert id="SCH-XHS-0005-PflichtfelderStudierenderName"
                     test="exists(*:nameNatuerlichePerson/*:vorname) and exists(*:nameNatuerlichePerson/*:familienname)">XHS-0005 Fehlende Angaben in xhs:Studierender/xbd:nameNatuerlichePerson. Es müssen angegeben werden: xbd:vorname, xbd:nachname</sch:assert>
      </sch:rule>
      <sch:rule id="rule-SCH-XHS-0016-PflichtfelderStudierenderGeburt" abstract="true">
         <sch:assert id="SCH-XHS-0016-PflichtfelderStudierenderGeburt"
                     test="exists(*:geburt/*:datum)">XHS-0016 Fehlende Angabe in xhs:studierender/xbd:geburt. Es muss angegeben werden: xbd:datum</sch:assert>
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
         <sch:extends rule="rule-SCH-XHS-0016-PflichtfelderStudierenderGeburt"/>
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
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="xhs:hochschulabschlusszeugnis//xhs:benotung">
         <sch:extends rule="rule-SCH-XHS-0017-PflichtfelderBenotung"/>
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
