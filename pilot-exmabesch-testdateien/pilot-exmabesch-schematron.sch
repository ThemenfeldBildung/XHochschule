<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Diese Schematron-Datei enthält Regeln für die Generierung der Exmatrikulationsbescheinigung nach XHochschule 0.9.
    Version: Pilot-Exmatrikulationsbescheinigung nach XHochschule 0.9
    Letzte Aktualisierung: 23.02.2022 
    Lizenz: Creative Commons 4.0 Namensnennung International, "]init[ AG im Auftrag des BMBF und Land Sachsen-Anhalt"
-->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            queryBinding="xslt2">  
   <sch:ns prefix="xbd" uri="http://xbildung.de/def/xbildung/0.9/xsd"/>
   <sch:ns prefix="xhs" uri="http://xhochschule.de/def/xhochschule/0.9/xsd"/>  

   <!-- Geschäftsregeln für die Exmatrikulationsbescheinigung -->
   <sch:pattern>
      <sch:rule id="SCH-XHS-pilot-exmabesch-0001" context="xhs:exmatrikulationsbescheinigung/*">
         <sch:assert test="name() != 'xbd:einsatzzweck' and name() != 'xbd:identifikation'">
            Das Feld <sch:name/> ist an dieser Stelle nicht anzugeben</sch:assert>
      </sch:rule>
   </sch:pattern>
      
   <sch:pattern>
      <sch:rule id="SCH-XHS-pilot-exmabesch-0002" context="xhs:exmatrikulationsbescheinigung//xhs:studierender/*">
         <sch:assert
            test="name() = 'xbd:nameNatuerlichePerson' or name() = 'xbd:geburt' or name() = 'xhs:matrikelnummer' or name() = 'xbd:identifikationsnummer' or 
            name() = 'xhs:hochschulsemester' or name() = 'xhs:ersteinschreibung' or name() = 'xhs:urlaubssemester'">
            Das Feld <sch:name/> ist an dieser Stelle nicht anzugeben. 
         </sch:assert>
      </sch:rule>
   </sch:pattern>
         
   <sch:pattern>
      <sch:rule id="SCH-XHS-pilot-exmabesch-0003" context="xhs:exmatrikulationsbescheinigung//xhs:studierender//*">
         <sch:assert 
            test="name() != 'xbd:namensart'">
            Eine Namensart ist allgemein nicht anzugeben
         </sch:assert>
      </sch:rule>
   </sch:pattern>
   
   <sch:pattern>
      <sch:rule id="SCH-XHS-pilot-exmabesch-0004" context="xhs:exmatrikulationsbescheinigung//xhs:studierender/xbd:nameNatuerlichePerson/*">
         <sch:assert
            test="name() = 'xbd:familienname' or name() = 'xbd:vorname' or name() = 'xbd:alternativeRepraesentation'">
            Das Feld <sch:name/> ist an dieser Stelle nicht anzugeben. 
         </sch:assert>
      </sch:rule>
   </sch:pattern>
   
   <sch:pattern>
      <sch:rule id="SCH-XHS-pilot-exmabesch-0005" context="/xhs:exmatrikulationsbescheinigung/xhs:studierender/xbd:geburt/xbd:geburtsort/*">
         <sch:assert
            test="name() = 'xbd:ort'">
            Das Feld <sch:name/> ist an dieser Stelle nicht anzugeben. 
         </sch:assert>
      </sch:rule>
   </sch:pattern>
   
   <sch:pattern>
      <sch:rule id="SCH-XHS-pilot-exmabesch-0006" context="xhs:exmatrikulationsbescheinigung/xhs:ausstellendeHochschule/*">
         <sch:assert
            test="name() = 'xbd:name' or name() = 'xhs:hochschulsignatur'">
            Das Feld <sch:name/> ist an dieser Stelle nicht anzugeben. 
         </sch:assert>
      </sch:rule>
   </sch:pattern>
   
   <sch:pattern>
      <sch:rule id="SCH-XHS-pilot-exmabesch-0007" context="xhs:exmatrikulationsbescheinigung/xhs:ausstellendeHochschule/xbd:name/*">
         <sch:assert
            test="name() = 'xbd:name'">
            Das Feld <sch:name/> ist an dieser Stelle nicht anzugeben. 
         </sch:assert>
      </sch:rule>
   </sch:pattern>
   
   <sch:pattern>
      <sch:rule id="SCH-XHS-pilot-exmabesch-0008" context="xhs:exmatrikulationsbescheinigung/xhs:studienfach/*">
         <sch:assert
            test="name() != 'xbd:identifikation'">
            Das Feld <sch:name/> ist an dieser Stelle nicht anzugeben. 
         </sch:assert>
      </sch:rule>
   </sch:pattern>
   
   <sch:pattern>
      <sch:rule id="SCH-XHS-pilot-exmabesch-0009" context="//*">
         <sch:assert test="string()!=''">Das Element "<sch:name/>" in "<sch:value-of select="ancestor::*/name()"/>" ist leer. Bitte geben Sie einen Wert an, oder entfernen Sie das Element. Führen Sie nach dem entfernen eines Elements eine XML-Schema Validierung durch.</sch:assert>
      </sch:rule>
   </sch:pattern>
   
</sch:schema>
