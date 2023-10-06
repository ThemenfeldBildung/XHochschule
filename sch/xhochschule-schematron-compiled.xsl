<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:saxon="http://saxon.sf.net/"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                xmlns:oxy="http://www.oxygenxml.com/schematron/validation"
                xmlns:bn-beh="http://xoev.de/schemata/basisnachricht/behoerde/1_0"
                xmlns:bn-g2g="http://xoev.de/schemata/basisnachricht/g2g/1_0"
                xmlns:bn-kom="http://xoev.de/schemata/basisnachricht/kommunikation/1_0"
                xmlns:bn-uq-g2g="http://xoev.de/schemata/basisnachricht/unqualified/g2g/1_0"
                xmlns:din91379="urn:xoev-de:kosit:xoev:datentyp:din-91379_2022-08"
                xmlns:dinspec91379="urn:xoev-de:kosit:xoev:datentyp:din-spec-91379_2019-03"
                xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
                xmlns:gml="http://www.opengis.net/gml/3.2"
                xmlns:xbd="http://xbildung.de/def/xbildung/0.95/xsd"
                xmlns:xhs="http://xhochschule.de/def/xhochschule/0.95/xsd"
                xmlns:xoev-code="http://xoev.de/schemata/code/1_0"
                xmlns:xoev-lc="http://xoev.de/latinchars/1_1/datatypes"
                version="2.0"
                xml:base="file:/C:/Code/ozg-xhsj/Spezifikation/build/sch/xhochschule-schematron.sch_xslt_cascade"><!--Implementers: please note that overriding process-prolog or process-root is 
    the preferred method for meta-stylesheets to use where possible. -->
   <xsl:param name="archiveDirParameter"/>
   <xsl:param name="archiveNameParameter"/>
   <xsl:param name="fileNameParameter"/>
   <xsl:param name="fileDirParameter"/>
   <xsl:variable name="document-uri">
      <xsl:value-of select="document-uri(/)"/>
   </xsl:variable>
   <!--PHASES-->
   <!--PROLOG-->
   <xsl:output xmlns:iso="http://purl.oclc.org/dsdl/schematron" method="xml"/>
   <!--XSD TYPES FOR XSLT2-->
   <!--KEYS AND FUNCTIONS-->
   <!--DEFAULT RULES-->
   <!--MODE: SCHEMATRON-SELECT-FULL-PATH-->
   <!--This mode can be used to generate an ugly though full XPath for locators-->
   <xsl:template match="*" mode="schematron-select-full-path">
      <xsl:apply-templates select="." mode="schematron-get-full-path"/>
   </xsl:template>
   <!--MODE: SCHEMATRON-FULL-PATH-->
   <!--This mode can be used to generate an ugly though full XPath for locators-->
   <xsl:template match="*" mode="schematron-get-full-path">
      <xsl:variable name="sameUri">
         <xsl:value-of select="saxon:system-id() = parent::node()/saxon:system-id()"
                       use-when="function-available('saxon:system-id')"/>
         <xsl:value-of select="oxy:system-id(.) = oxy:system-id(parent::node())"
                       use-when="not(function-available('saxon:system-id')) and function-available('oxy:system-id')"/>
         <xsl:value-of select="true()"
                       use-when="not(function-available('saxon:system-id')) and not(function-available('oxy:system-id'))"/>
      </xsl:variable>
      <xsl:if test="$sameUri = 'true'">
         <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      </xsl:if>
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">
            <xsl:value-of select="name()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>*:</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>[namespace-uri()='</xsl:text>
            <xsl:value-of select="namespace-uri()"/>
            <xsl:text>']</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="$sameUri = 'true'">
         <xsl:variable name="preceding"
                       select="count(preceding-sibling::*[local-name()=local-name(current())       and namespace-uri() = namespace-uri(current())])"/>
         <xsl:text>[</xsl:text>
         <xsl:value-of select="1+ $preceding"/>
         <xsl:text>]</xsl:text>
      </xsl:if>
   </xsl:template>
   <xsl:template match="@*" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">@<xsl:value-of select="name()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>@*[local-name()='</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>' and namespace-uri()='</xsl:text>
            <xsl:value-of select="namespace-uri()"/>
            <xsl:text>']</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="text()" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:text>text()</xsl:text>
      <xsl:variable name="preceding" select="count(preceding-sibling::text())"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+ $preceding"/>
      <xsl:text>]</xsl:text>
   </xsl:template>
   <xsl:template match="comment()" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:text>comment()</xsl:text>
      <xsl:variable name="preceding" select="count(preceding-sibling::comment())"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+ $preceding"/>
      <xsl:text>]</xsl:text>
   </xsl:template>
   <xsl:template match="processing-instruction()" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:text>processing-instruction()</xsl:text>
      <xsl:variable name="preceding"
                    select="count(preceding-sibling::processing-instruction())"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+ $preceding"/>
      <xsl:text>]</xsl:text>
   </xsl:template>
   <!--MODE: SCHEMATRON-FULL-PATH-2-->
   <!--This mode can be used to generate prefixed XPath for humans-->
   <xsl:template match="node() | @*" mode="schematron-get-full-path-2">
      <xsl:for-each select="ancestor-or-self::*">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="name(.)"/>
         <xsl:if test="preceding-sibling::*[name(.)=name(current())]">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <xsl:text>]</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:if test="not(self::*)">
         <xsl:text/>/@<xsl:value-of select="name(.)"/>
      </xsl:if>
   </xsl:template>
   <!--MODE: SCHEMATRON-FULL-PATH-3-->
   <!--This mode can be used to generate prefixed XPath for humans 
	(Top-level element has index)-->
   <xsl:template match="node() | @*" mode="schematron-get-full-path-3">
      <xsl:for-each select="ancestor-or-self::*">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="name(.)"/>
         <xsl:if test="parent::*">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <xsl:text>]</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:if test="not(self::*)">
         <xsl:text/>/@<xsl:value-of select="name(.)"/>
      </xsl:if>
   </xsl:template>
   <!--MODE: GENERATE-ID-FROM-PATH -->
   <xsl:template match="/" mode="generate-id-from-path"/>
   <xsl:template match="text()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')"/>
   </xsl:template>
   <xsl:template match="comment()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')"/>
   </xsl:template>
   <xsl:template match="processing-instruction()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.@', name())"/>
   </xsl:template>
   <xsl:template match="*" mode="generate-id-from-path" priority="-0.5">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:text>.</xsl:text>
      <xsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')"/>
   </xsl:template>
   <!--MODE: GENERATE-ID-2 -->
   <xsl:template match="/" mode="generate-id-2">U</xsl:template>
   <xsl:template match="*" mode="generate-id-2" priority="2">
      <xsl:text>U</xsl:text>
      <xsl:number level="multiple" count="*"/>
   </xsl:template>
   <xsl:template match="node()" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>n</xsl:text>
      <xsl:number count="node()"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="string-length(local-name(.))"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="translate(name(),':','.')"/>
   </xsl:template>
   <!--Strip characters-->
   <xsl:template match="text()" priority="-1"/>
   <!--SCHEMA SETUP-->
   <xsl:template match="/">
      <xsl:apply-templates select="/" mode="M13"/>
      <xsl:apply-templates select="/" mode="M14"/>
      <xsl:apply-templates select="/" mode="M15"/>
      <xsl:apply-templates select="/" mode="M16"/>
      <xsl:apply-templates select="/" mode="M17"/>
      <xsl:apply-templates select="/" mode="M18"/>
      <xsl:apply-templates select="/" mode="M19"/>
      <xsl:apply-templates select="/" mode="M20"/>
      <xsl:apply-templates select="/" mode="M21"/>
      <xsl:apply-templates select="/" mode="M22"/>
      <xsl:apply-templates select="/" mode="M23"/>
      <xsl:apply-templates select="/" mode="M24"/>
      <xsl:apply-templates select="/" mode="M25"/>
      <xsl:apply-templates select="/" mode="M26"/>
      <xsl:apply-templates select="/" mode="M27"/>
      <xsl:apply-templates select="/" mode="M28"/>
      <xsl:apply-templates select="/" mode="M29"/>
      <xsl:apply-templates select="/" mode="M30"/>
      <xsl:apply-templates select="/" mode="M31"/>
      <xsl:apply-templates select="/" mode="M32"/>
      <xsl:apply-templates select="/" mode="M33"/>
      <xsl:apply-templates select="/" mode="M34"/>
      <xsl:apply-templates select="/" mode="M35"/>
      <xsl:apply-templates select="/" mode="M36"/>
      <xsl:apply-templates select="/" mode="M37"/>
      <xsl:apply-templates select="/" mode="M38"/>
      <xsl:apply-templates select="/" mode="M39"/>
      <xsl:apply-templates select="/" mode="M40"/>
      <xsl:apply-templates select="/" mode="M41"/>
      <xsl:apply-templates select="/" mode="M42"/>
      <xsl:apply-templates select="/" mode="M43"/>
      <xsl:apply-templates select="/" mode="M44"/>
      <xsl:apply-templates select="/" mode="M45"/>
      <xsl:apply-templates select="/" mode="M46"/>
      <xsl:apply-templates select="/" mode="M47"/>
      <xsl:apply-templates select="/" mode="M48"/>
      <xsl:apply-templates select="/" mode="M49"/>
      <xsl:apply-templates select="/" mode="M50"/>
      <xsl:apply-templates select="/" mode="M51"/>
   </xsl:template>
   <!--SCHEMATRON PATTERNS-->
   <!--PATTERN -->
   <xsl:template match="text()" priority="-1" mode="M13"/>
   <xsl:template match="@*|node()" priority="-2" mode="M13">
      <xsl:apply-templates select="*" mode="M13"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="//*" priority="1000" mode="M14">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="normalize-space(string())!=''"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0000 GlobaleRegel:_ Das Element </xsl:text>
               <xsl:text/>
               <xsl:value-of select="name(.)"/>
               <xsl:text/>
               <xsl:text> in </xsl:text>
               <xsl:text/>
               <xsl:value-of select="ancestor::*/name()"/>
               <xsl:text/>
               <xsl:text> ist leer. Leere Elemente sind nicht erlaubt.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0000-KeineLeerenElemente</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M14"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M14"/>
   <xsl:template match="@*|node()" priority="-2" mode="M14">
      <xsl:apply-templates select="*" mode="M14"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:rentenbescheinigung//xhs:studienabschnitt"
                 priority="1000"
                 mode="M15">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if (*:beurlaubungsstatus/code = 'http://xhochschule.de/def/xhochschule/0.95/code/beurlaubungsstatus/beurlaubt') then exists(*:beurlaubungsgrund) else empty(*:beurlaubungsgrund)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0001 Der Beurlaubungsgrund muss und darf nur angegeben werden, wenn der Berulaubungsstatus "beurlaubt" ist. Sonst soll das Feld Beurlaubungsgrund nicht benutzt werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:ausbildungsstaette)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0002 Die Ausbildungsstätte für den Studienabschnitt muss angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0002-MussAusbildungsstaetteRentenbescheinigung</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:lernzeitmodellFreitext) and ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')) or (empty(*:lernzeitmodellFreitext) and not(ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0026 Wenn und nur wenn der Wert von lernzeitmodell 'wert_nicht_in_liste' ist, soll das Feld lernzeitmodellFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0026-WertNichtInListeLernzeitmodellStudienabschnitt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:beurlaubungsstatusFreitext) and ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:beurlaubungsstatusFreitext) and not(ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0029 Wenn und nur wenn der Wert von beurblaubungsstatus 'wert_nicht_in_liste' ist, soll das Feld beurlaubungsstatusFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0029-WertNichtInListeBeurlaubungsstatusStudienabschnitt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M15"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M15"/>
   <xsl:template match="@*|node()" priority="-2" mode="M15">
      <xsl:apply-templates select="*" mode="M15"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:exmatrikulationsbescheinigung//xhs:studierender"
                 priority="1000"
                 mode="M16">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:nameNatuerlichePerson/*:vorname) and exists(*:nameNatuerlichePerson/*:familienname)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0005 Fehlende Angaben in xhs:Studierender/xbd:nameNatuerlichePerson. Es müssen angegeben werden: xbd:vorname, xbd:nachname</xsl:text>
               <xsl:text>
ID:SCH-XHS-0005-PflichtfelderStudierenderName</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:geburt/*:datum)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0016 Fehlende Angabe in xhs:studierender/xbd:geburt. Es muss angegeben werden: xbd:datum.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0016-PflichtfelderStudierenderGeburt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M16"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M16"/>
   <xsl:template match="@*|node()" priority="-2" mode="M16">
      <xsl:apply-templates select="*" mode="M16"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:hochschulabschlusszeugnis//xhs:studierender"
                 priority="1000"
                 mode="M17">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:nameNatuerlichePerson/*:vorname) and exists(*:nameNatuerlichePerson/*:familienname)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0005 Fehlende Angaben in xhs:Studierender/xbd:nameNatuerlichePerson. Es müssen angegeben werden: xbd:vorname, xbd:nachname</xsl:text>
               <xsl:text>
ID:SCH-XHS-0005-PflichtfelderStudierenderName</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:geburt/*:datum)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0016 Fehlende Angabe in xhs:studierender/xbd:geburt. Es muss angegeben werden: xbd:datum.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0016-PflichtfelderStudierenderGeburt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M17"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M17"/>
   <xsl:template match="@*|node()" priority="-2" mode="M17">
      <xsl:apply-templates select="*" mode="M17"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:immatrikulationsbescheinigung//xhs:studierender"
                 priority="1000"
                 mode="M18">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:nameNatuerlichePerson/*:vorname) and exists(*:nameNatuerlichePerson/*:familienname)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0005 Fehlende Angaben in xhs:Studierender/xbd:nameNatuerlichePerson. Es müssen angegeben werden: xbd:vorname, xbd:nachname</xsl:text>
               <xsl:text>
ID:SCH-XHS-0005-PflichtfelderStudierenderName</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:geburt/*:datum)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0016 Fehlende Angabe in xhs:studierender/xbd:geburt. Es muss angegeben werden: xbd:datum.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0016-PflichtfelderStudierenderGeburt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M18"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M18"/>
   <xsl:template match="@*|node()" priority="-2" mode="M18">
      <xsl:apply-templates select="*" mode="M18"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:rentenbescheinigung//xhs:studierender"
                 priority="1000"
                 mode="M19">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:nameNatuerlichePerson/*:vorname) and exists(*:nameNatuerlichePerson/*:familienname)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0005 Fehlende Angaben in xhs:Studierender/xbd:nameNatuerlichePerson. Es müssen angegeben werden: xbd:vorname, xbd:nachname</xsl:text>
               <xsl:text>
ID:SCH-XHS-0005-PflichtfelderStudierenderName</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:geburt/*:datum)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0016 Fehlende Angabe in xhs:studierender/xbd:geburt. Es muss angegeben werden: xbd:datum.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0016-PflichtfelderStudierenderGeburt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M19"/>
   <xsl:template match="@*|node()" priority="-2" mode="M19">
      <xsl:apply-templates select="*" mode="M19"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:studienverlaufsbescheinigung//xhs:studierender"
                 priority="1000"
                 mode="M20">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:nameNatuerlichePerson/*:vorname) and exists(*:nameNatuerlichePerson/*:familienname)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0005 Fehlende Angaben in xhs:Studierender/xbd:nameNatuerlichePerson. Es müssen angegeben werden: xbd:vorname, xbd:nachname</xsl:text>
               <xsl:text>
ID:SCH-XHS-0005-PflichtfelderStudierenderName</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:geburt/*:datum)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0016 Fehlende Angabe in xhs:studierender/xbd:geburt. Es muss angegeben werden: xbd:datum.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0016-PflichtfelderStudierenderGeburt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M20"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M20"/>
   <xsl:template match="@*|node()" priority="-2" mode="M20">
      <xsl:apply-templates select="*" mode="M20"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:transcriptOfRecords//xhs:studierender"
                 priority="1000"
                 mode="M21">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:nameNatuerlichePerson/*:vorname) and exists(*:nameNatuerlichePerson/*:familienname)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0005 Fehlende Angaben in xhs:Studierender/xbd:nameNatuerlichePerson. Es müssen angegeben werden: xbd:vorname, xbd:nachname</xsl:text>
               <xsl:text>
ID:SCH-XHS-0005-PflichtfelderStudierenderName</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:geburt/*:datum)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0016 Fehlende Angabe in xhs:studierender/xbd:geburt. Es muss angegeben werden: xbd:datum.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0016-PflichtfelderStudierenderGeburt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M21"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M21"/>
   <xsl:template match="@*|node()" priority="-2" mode="M21">
      <xsl:apply-templates select="*" mode="M21"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:immatrikulationsbescheinigungBAfoeGP9//xhs:studierender"
                 priority="1000"
                 mode="M22">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(xbd:nameNatuerlichePerson/xbd:familienname)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0010 Für den Studierenden muss zur Identifikation auf der Immatrikulationsbescheinigung nach BAföG §9 ein Familienname angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0010-MussNameNatuerlichePerson</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="empty(xbd:geschlecht)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0011 Für den Studierenden darf auf der Immatrikulationsbescheinigung nach BaföG §9 kein Geschlecht angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0011-KeinGeschlecht</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="empty(xbd:anschrift)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0012 Für den Studierenden wird auf der Immatrikulationsbescheinigung nach BAföG §9 keine Wohnanschrift benötigt.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0012-KeineWohnanschrift</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="empty(xhs:hochschulsemester) and empty(xhs:urlaubssemester)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0013 Die Zahl der Hochschulsemester und Urlaubssemester des Studierenden werden auf der Immatrikulationsbescheinigung nach BaföG § 9 nicht benötigt.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0013-KeineSemester</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="empty(xbd:anrede)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0014 Die Anrede des Studierenden wird auf der Immatrikulationsbescheinigung nach BaföG § 9 nicht benötigt.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0014-KeineAnrede</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:geburt/*:datum) and exists(*:geburt/*:geburtsort/*:ort)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0018 Geburtsort und Geburtsdatum des Studierenden müssen auf der Immatrikulationsbescheinigung nach BaföG § 9 angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0018-GeburtPflicht</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M22"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M22"/>
   <xsl:template match="@*|node()" priority="-2" mode="M22">
      <xsl:apply-templates select="*" mode="M22"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:immatrikulationsbescheinigungBAfoeGP9"
                 priority="1000"
                 mode="M23">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(xhs:lernzeitmodell/code/text(),'/vollzeit') or ends-with(xhs:lernzeitmodell/code/text(),'/teilzeit')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0015 Das Lernzeitmodell muss auf der Immatrikulationsbescheinigung nach BaföG § 9 die Ausprägung "Teilzeit" oder "Vollzeit" haben.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0015-LernzeitmodellVollOderTeilzeit</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:lernzeitmodellFreitext) and ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')) or (empty(*:lernzeitmodellFreitext) and not(ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0025 Wenn und nur wenn der Wert von lernzeitmodell 'wert_nicht_in_liste' ist, soll das Feld lernzeitmodellFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0025-WertNichtInListeLernzeitmodellImmaBeschBafoeg</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:beurlaubungsstatusFreitext) and ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:beurlaubungsstatusFreitext) and not(ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0028 Wenn und nur wenn der Wert von beurblaubungsstatus 'wert_nicht_in_liste' ist, soll das Feld beurlaubungsstatusFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0028-WertNichtInListeBeurlaubungsstatusImmaBeschBafoeg</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:immatrikulationsstatusFreitext) and ends-with(*:immatrikulationsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:immatrikulationsstatusFreitext) and not(ends-with(*:immatrikulationsstatus/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0031 Wenn und nur wenn der Wert von immatrikulationsstatus 'wert_nicht_in_liste' ist, soll das Feld immatrikulationsstatusFreitext angegeben werden. </xsl:text>
               <xsl:text>
ID:SCH-XHS-0031-WertNichtInListeImmatrikulationsstatusImmaBeschBafoeg</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M23"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M23"/>
   <xsl:template match="@*|node()" priority="-2" mode="M23">
      <xsl:apply-templates select="*" mode="M23"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:hochschulabschlusszeugnis//xhs:benotung"
                 priority="1000"
                 mode="M24">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:gesamtnote/*:note)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0017 Fehlende Angabe in xhs:benotung. Es muss angegeben werden: xhs:gesamtnote/xbd:note.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0017-PflichtfelderBenotung</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:lateinischeEhrenbezeichnungFreitext) and ends-with(*:lateinischeEhrenbezeichnung/code/text(), 'wert_nicht_in_liste')) or (empty(*:lateinischeEhrenbezeichnungFreitext) and not(ends-with(*:lateinischeEhrenbezeichnung/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0032 Wenn und nur wenn der Wert von lateinischeEhrenbezeichnung 'wert_nicht_in_liste' ist, soll das Feld lateinischeEhrenbezeichnungFreitext angegeben werden. </xsl:text>
               <xsl:text>
ID:SCH-XHS-0032-WertNichtInListeLateinischeEhrenbezeichnung</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M24"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M24"/>
   <xsl:template match="@*|node()" priority="-2" mode="M24">
      <xsl:apply-templates select="*" mode="M24"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:hochschulabschlusszeugnis//xhs:leistung"
                 priority="1000"
                 mode="M25">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:leistungsartFreitext) and ends-with(*:leistungsart/code/text(), 'wert_nicht_in_liste')) or (empty(*:leistungsartFreitext) and not(ends-with(*:leistungsart/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0020 Wenn und nur wenn der Wert von leistungsart 'wert_nicht_in_liste' ist, soll das Feld leistungsartFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0020-WertNichtInListeLeistungsart_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:leistungsstatusFreitext) and ends-with(*:leistungsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:leistungsstatusFreitext) and not(ends-with(*:leistungsstatus/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0022 Wenn und nur wenn der Wert von leistungsstatus 'wert_nicht_in_liste' ist, soll das Feld leistungsstatusFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0022-WertNichtInListeLeistungsstatus_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsbenotungsstatus/code/text(), 'unbenotet')) then not(exists(*:note)) else (exists(*:note) or empty(*:note))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0034 Wenn die Benotung der Leistung den Status "unbenotet" hat, darf keine Note für diese Leistung angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0034-KeineNoteWennStatusUnbenotet_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'modul_nach_kmk')) then exists(*:beschreibung/*:modulbeschreibungNachKMK) else not(exists(*:beschreibung/*:modulbeschreibungNachKMK))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0036 Wenn und nur wenn die Leistung ein Modul nach KMK ist, soll die Beschreibung nach den Vorgaben der KMK ausgefüllt werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0036-ModulbeschreibungNachKMK_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'klausur') or ends-with(*:leistungsart/code/text(), 'pruefung')) then empty(*:beschreibung/*:umfangInSWS) else (empty(*:beschreibung/*:umfangInSWS) or exists(*:beschreibung/*:umfangInSWS))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0040 Der Wert UmfangInSWS darf nicht angegeben werden, wenn der Inhalt des Codewertes von leistungsart mit klausur oder pruefung endet. Bei Prüfungen handelt es sich um punktuelle Ereignisse, die nicht über das Semester verteilt sind.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0040-KeineSWSBeiPruefungen_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:unbedenklichkeitsvermerk) else empty(*:unbedenklichkeitsvermerk)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0041 Der Unbedenklichkeitsvermerk darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf "studienfach" oder "studiengang" gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0041-UnbedenklichkeitNurBeiStudienfach_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:angestrebterAbschluss) else empty(*:angestrebterAbschluss)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0042 Der angestrebte Abschluss darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0042-angestrebterAbschluss_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:fachsemester) else empty(*:fachsemester)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0043 Das Fachsemester darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0043-fachsemester_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselISCED2011) else empty(*:schluesselISCED2011)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0044 Der Schlüssel nach ISCED2011 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0044-schluesselISCED2011_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselISCEDF2013) else empty(*:schluesselISCEDF2013)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0045 Der Schlüssel nach ISCEDF2013 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0045-schluesselISCEDF2013_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselEQF) else empty(*:schluesselEQF)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0046 Der Schlüssel nach EQF darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0046-schluesselEQF_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M25"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M25"/>
   <xsl:template match="@*|node()" priority="-2" mode="M25">
      <xsl:apply-templates select="*" mode="M25"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:hochschulabschlusszeugnis//xhs:teilleistung"
                 priority="1000"
                 mode="M26">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:leistungsartFreitext) and ends-with(*:leistungsart/code/text(), 'wert_nicht_in_liste')) or (empty(*:leistungsartFreitext) and not(ends-with(*:leistungsart/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0020 Wenn und nur wenn der Wert von leistungsart 'wert_nicht_in_liste' ist, soll das Feld leistungsartFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0020-WertNichtInListeLeistungsart_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:leistungsstatusFreitext) and ends-with(*:leistungsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:leistungsstatusFreitext) and not(ends-with(*:leistungsstatus/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0022 Wenn und nur wenn der Wert von leistungsstatus 'wert_nicht_in_liste' ist, soll das Feld leistungsstatusFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0022-WertNichtInListeLeistungsstatus_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsbenotungsstatus/code/text(), 'unbenotet')) then not(exists(*:note)) else (exists(*:note) or empty(*:note))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0034 Wenn die Benotung der Leistung den Status "unbenotet" hat, darf keine Note für diese Leistung angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0034-KeineNoteWennStatusUnbenotet_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'modul_nach_kmk')) then exists(*:beschreibung/*:modulbeschreibungNachKMK) else not(exists(*:beschreibung/*:modulbeschreibungNachKMK))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0036 Wenn und nur wenn die Leistung ein Modul nach KMK ist, soll die Beschreibung nach den Vorgaben der KMK ausgefüllt werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0036-ModulbeschreibungNachKMK_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'klausur') or ends-with(*:leistungsart/code/text(), 'pruefung')) then empty(*:beschreibung/*:umfangInSWS) else (empty(*:beschreibung/*:umfangInSWS) or exists(*:beschreibung/*:umfangInSWS))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0040 Der Wert UmfangInSWS darf nicht angegeben werden, wenn der Inhalt des Codewertes von leistungsart mit klausur oder pruefung endet. Bei Prüfungen handelt es sich um punktuelle Ereignisse, die nicht über das Semester verteilt sind.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0040-KeineSWSBeiPruefungen_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:unbedenklichkeitsvermerk) else empty(*:unbedenklichkeitsvermerk)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0041 Der Unbedenklichkeitsvermerk darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf "studienfach" oder "studiengang" gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0041-UnbedenklichkeitNurBeiStudienfach_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:angestrebterAbschluss) else empty(*:angestrebterAbschluss)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0042 Der angestrebte Abschluss darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0042-angestrebterAbschluss_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:fachsemester) else empty(*:fachsemester)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0043 Das Fachsemester darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0043-fachsemester_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselISCED2011) else empty(*:schluesselISCED2011)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0044 Der Schlüssel nach ISCED2011 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0044-schluesselISCED2011_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselISCEDF2013) else empty(*:schluesselISCEDF2013)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0045 Der Schlüssel nach ISCEDF2013 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0045-schluesselISCEDF2013_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselEQF) else empty(*:schluesselEQF)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0046 Der Schlüssel nach EQF darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0046-schluesselEQF_HAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M26"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M26"/>
   <xsl:template match="@*|node()" priority="-2" mode="M26">
      <xsl:apply-templates select="*" mode="M26"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:transcriptOfRecords//xhs:leistung"
                 priority="1000"
                 mode="M27">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:leistungsartFreitext) and ends-with(*:leistungsart/code/text(), 'wert_nicht_in_liste')) or (empty(*:leistungsartFreitext) and not(ends-with(*:leistungsart/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0020 Wenn und nur wenn der Wert von leistungsart 'wert_nicht_in_liste' ist, soll das Feld leistungsartFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0020-WertNichtInListeLeistungsart_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:leistungsstatusFreitext) and ends-with(*:leistungsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:leistungsstatusFreitext) and not(ends-with(*:leistungsstatus/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0022 das Feld leistungsstatusFreitext muss angegeben werden, wenn der Wert von leistungsstatus 'wert_nicht_in_liste' ist. Wenn der Wert von leistungsstatus ein anderer ist, darf leistungsstatusFreitext nicht angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0022-WertNichtInListeLeistungsstatus_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsbenotungsstatus/code/text(), 'unbenotet')) then not(exists(*:note)) else (exists(*:note) or empty(*:note))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0034 Wenn die Benotung der Leistung den Status unbenotet hat, darf keine Note für diese Leistung angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0034-KeineNoteWennStatusUnbenotet_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'modul_nach_kmk')) then exists(*:beschreibung/*:modulbeschreibungNachKMK) else not(exists(*:beschreibung/*:modulbeschreibungNachKMK))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0036 Wenn und nur wenn die Leistung ein Modul nach KMK ist, soll die Beschreibung nach den Vorgaben der KMK ausgefüllt werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0036-ModulbeschreibungNachKMK_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'klausur') or  ends-with(*:leistungsart/code/text(), 'pruefung')) then empty(*:beschreibung/*:umfangInSWS) else (empty(*:beschreibung/*:umfangInSWS) or exists(*:beschreibung/*:umfangInSWS))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0040 Der Wert "UmfangInSWS" darf nicht angegeben werden, wenn der Inhalt des Codewertes von "leistungsart" mit "klausur" oder "pruefung" endet. Bei Prüfungen handelt es sich um punktuelle Ereignisse, die nicht über das Semester verteilt sind.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0040-KeineSWSBeiPruefungen_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:unbedenklichkeitsvermerk) else empty(*:unbedenklichkeitsvermerk)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0041 Der Unbedenklichkeitsvermerk darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf "studienfach" oder "studiengang" gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0041-UnbedenklichkeitNurBeiStudienfach_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:angestrebterAbschluss) else empty(*:angestrebterAbschluss)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0042 Der angestrebte Abschluss darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0042-angestrebterAbschluss_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:fachsemester) else empty(*:fachsemester)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0043 Das Fachsemester darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0043-fachsemester_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselISCED2011) else empty(*:schluesselISCED2011)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0044 Der Schlüssel nach ISCED2011 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0044-schluesselISCED2011_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselEQF) else empty(*:schluesselEQF)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0046 Der Schlüssel nach EQF darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0045-schluesselEQF_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselISCEDF2013) else empty(*:schluesselISCEDF2013)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0045 Der Schlüssel nach ISCEDF2013 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0045-schluesselISCEDF2013_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M27"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M27"/>
   <xsl:template match="@*|node()" priority="-2" mode="M27">
      <xsl:apply-templates select="*" mode="M27"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:transcriptOfRecords//xhs:teilleistung"
                 priority="1000"
                 mode="M28">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:leistungsartFreitext) and ends-with(*:leistungsart/code/text(), 'wert_nicht_in_liste')) or (empty(*:leistungsartFreitext) and not(ends-with(*:leistungsart/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0020 Wenn und nur wenn der Wert von leistungsart 'wert_nicht_in_liste' ist, soll das Feld leistungsartFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0020-WertNichtInListeLeistungsart_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:leistungsstatusFreitext) and ends-with(*:leistungsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:leistungsstatusFreitext) and not(ends-with(*:leistungsstatus/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0022 das Feld leistungsstatusFreitext muss angegeben werden, wenn der Wert von leistungsstatus 'wert_nicht_in_liste' ist. Wenn der Wert von leistungsstatus ein anderer ist, darf leistungsstatusFreitext nicht angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0022-WertNichtInListeLeistungsstatus_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsbenotungsstatus/code/text(), 'unbenotet')) then not(exists(*:note)) else (exists(*:note) or empty(*:note))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0034 Wenn die Benotung der Leistung den Status unbenotet hat, darf keine Note für diese Leistung angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0034-KeineNoteWennStatusUnbenotet_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'modul_nach_kmk')) then exists(*:beschreibung/*:modulbeschreibungNachKMK) else not(exists(*:beschreibung/*:modulbeschreibungNachKMK))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0036 Wenn und nur wenn die Leistung ein Modul nach KMK ist, soll die Beschreibung nach den Vorgaben der KMK ausgefüllt werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0036-ModulbeschreibungNachKMK_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'klausur') or  ends-with(*:leistungsart/code/text(), 'pruefung')) then empty(*:beschreibung/*:umfangInSWS) else (empty(*:beschreibung/*:umfangInSWS) or exists(*:beschreibung/*:umfangInSWS))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0040 Der Wert "UmfangInSWS" darf nicht angegeben werden, wenn der Inhalt des Codewertes von "leistungsart" mit "klausur" oder "pruefung" endet. Bei Prüfungen handelt es sich um punktuelle Ereignisse, die nicht über das Semester verteilt sind.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0040-KeineSWSBeiPruefungen_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:unbedenklichkeitsvermerk) else empty(*:unbedenklichkeitsvermerk)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0041 Der Unbedenklichkeitsvermerk darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf "studienfach" oder "studiengang" gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0041-UnbedenklichkeitNurBeiStudienfach_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:angestrebterAbschluss) else empty(*:angestrebterAbschluss)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0042 Der angestrebte Abschluss darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0042-angestrebterAbschluss_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:fachsemester) else empty(*:fachsemester)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0043 Das Fachsemester darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0043-fachsemester_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselISCED2011) else empty(*:schluesselISCED2011)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0044 Der Schlüssel nach ISCED2011 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0044-schluesselISCED2011_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselEQF) else empty(*:schluesselEQF)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0046 Der Schlüssel nach EQF darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0045-schluesselEQF_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/text(), 'studienfach') or ends-with(*:leistungsart/code/text(), 'studiengang')) then exists(*:schluesselISCEDF2013) else empty(*:schluesselISCEDF2013)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0045 Der Schlüssel nach ISCEDF2013 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf studienfach oder studiengang gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0045-schluesselISCEDF2013_ToR</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M28"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M28"/>
   <xsl:template match="@*|node()" priority="-2" mode="M28">
      <xsl:apply-templates select="*" mode="M28"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:immatrikulationsbescheinigung"
                 priority="1000"
                 mode="M29">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:lernzeitmodellFreitext) and ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')) or (empty(*:lernzeitmodellFreitext) and not(ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0024 Wenn und nur wenn der Wert von lernzeitmodell 'wert_nicht_in_liste' ist, soll das Feld lernzeitmodellFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0024-WertNichtInListeLernzeitmodellImmaBesch</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:beurlaubungsstatusFreitext) and ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:beurlaubungsstatusFreitext) and not(ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0027 Wenn und nur wenn der Wert von beurblaubungsstatus 'wert_nicht_in_liste' ist, soll das Feld beurlaubungsstatusFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0027-WertNichtInListeBeurlaubungsstatusImmaBesch</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:immatrikulationsstatusFreitext) and ends-with(*:immatrikulationsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:immatrikulationsstatusFreitext) and not(ends-with(*:immatrikulationsstatus/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0030 Wenn und nur wenn der Wert von immatrikulationsstatus 'wert_nicht_in_liste' ist, soll das Feld immatrikulationsstatusFreitext angegeben werden. </xsl:text>
               <xsl:text>
ID:SCH-XHS-0030-WertNichtInListeImmatrikulationsstatusImmaBesch</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M29"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M29"/>
   <xsl:template match="@*|node()" priority="-2" mode="M29">
      <xsl:apply-templates select="*" mode="M29"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:exmatrikulationsbescheinigung//xhs:aufzaehlung"
                 priority="1000"
                 mode="M30">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:lernzeitmodellFreitext) and ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')) or (empty(*:lernzeitmodellFreitext) and not(ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0026 Wenn und nur wenn der Wert von lernzeitmodell 'wert_nicht_in_liste' ist, soll das Feld lernzeitmodellFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0026-WertNichtInListeLernzeitmodellStudienabschnitt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:beurlaubungsstatusFreitext) and ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:beurlaubungsstatusFreitext) and not(ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0029 Wenn und nur wenn der Wert von beurblaubungsstatus 'wert_nicht_in_liste' ist, soll das Feld beurlaubungsstatusFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0029-WertNichtInListeBeurlaubungsstatusStudienabschnitt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M30"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M30"/>
   <xsl:template match="@*|node()" priority="-2" mode="M30">
      <xsl:apply-templates select="*" mode="M30"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:studienverlaufsbescheinigung//xhs:aufzaehlung"
                 priority="1000"
                 mode="M31">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:lernzeitmodellFreitext) and ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')) or (empty(*:lernzeitmodellFreitext) and not(ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0026 Wenn und nur wenn der Wert von lernzeitmodell 'wert_nicht_in_liste' ist, soll das Feld lernzeitmodellFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0026-WertNichtInListeLernzeitmodellStudienabschnitt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:beurlaubungsstatusFreitext) and ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')) or (empty(*:beurlaubungsstatusFreitext) and not(ends-with(*:beurlaubungsstatus/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0029 Wenn und nur wenn der Wert von beurblaubungsstatus 'wert_nicht_in_liste' ist, soll das Feld beurlaubungsstatusFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0029-WertNichtInListeBeurlaubungsstatusStudienabschnitt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M31"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M31"/>
   <xsl:template match="@*|node()" priority="-2" mode="M31">
      <xsl:apply-templates select="*" mode="M31"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:hochschulabschlusszeugnis/xhs:leistung//xbd:note"
                 priority="1000"
                 mode="M32">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(matches(., '^\d+,\d+$'))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0033 das Feld Benotung muss in dem Format "Zahl,Komma,Zahl" angegeben werden. Ein Beispiel hierfür wäre "2,5".</xsl:text>
               <xsl:text>
ID:SCH-XHS-0033-Benotungsschema</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M32"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M32"/>
   <xsl:template match="@*|node()" priority="-2" mode="M32">
      <xsl:apply-templates select="*" mode="M32"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:transcriptOfRecords//xbd:note"
                 priority="1000"
                 mode="M33">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(matches(., '^\d+,\d+$'))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0033 das Feld Benotung muss in dem Format "Zahl,Komma,Zahl" angegeben werden. Ein Beispiel hierfür wäre "2,5".</xsl:text>
               <xsl:text>
ID:SCH-XHS-0033-Benotungsschema</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M33"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M33"/>
   <xsl:template match="@*|node()" priority="-2" mode="M33">
      <xsl:apply-templates select="*" mode="M33"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:hochschulabschlusszeugnis//xbd:note"
                 priority="1000"
                 mode="M34">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(matches(., '^\d+,\d+$'))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0033 das Feld Benotung muss in dem Format "Zahl,Komma,Zahl" angegeben werden. Ein Beispiel hierfür wäre "2,5".</xsl:text>
               <xsl:text>
ID:SCH-XHS-0033-BenotungsschemaGesamtnoteundAbschlussarbeit</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M34"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M34"/>
   <xsl:template match="@*|node()" priority="-2" mode="M34">
      <xsl:apply-templates select="*" mode="M34"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:exmatrikulationsbescheinigung//xhs:zusammenfassung"
                 priority="1000"
                 mode="M35">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:lernzeitmodellFreitext) and ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')) or (empty(*:lernzeitmodellFreitext) and not(ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0026 Wenn und nur wenn der Wert von lernzeitmodell 'wert_nicht_in_liste' ist, soll das Feld lernzeitmodellFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0038-WertNichtInListeLernzeitmodellStudienabschnittZusammenfassung</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M35"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M35"/>
   <xsl:template match="@*|node()" priority="-2" mode="M35">
      <xsl:apply-templates select="*" mode="M35"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:studienverlaufsbescheinigung//xhs:zusammenfassung"
                 priority="1000"
                 mode="M36">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:lernzeitmodellFreitext) and ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')) or (empty(*:lernzeitmodellFreitext) and not(ends-with(*:lernzeitmodell/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0026 Wenn und nur wenn der Wert von lernzeitmodell 'wert_nicht_in_liste' ist, soll das Feld lernzeitmodellFreitext angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0038-WertNichtInListeLernzeitmodellStudienabschnittZusammenfassung</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M36"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M36"/>
   <xsl:template match="@*|node()" priority="-2" mode="M36">
      <xsl:apply-templates select="*" mode="M36"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:exmatrikulationsbescheinigung//xhs:studierender/*"
                 priority="1000"
                 mode="M37">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':nameNatuerlichePerson') or ends-with(name(),':geburt') or ends-with(name(),':matrikelnummer') or ends-with(name(),':identifikationsnummer') or ends-with(name(),':hochschulsemester') or ends-with(name(),':ersteinschreibung') or ends-with(name(),':urlaubssemester')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0003 KindElement:_ Das Feld "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="name(.)"/>
               <xsl:text/>
               <xsl:text>" darf in "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="ancestor::*/name()"/>
               <xsl:text/>
               <xsl:text>" nicht angegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer, xbd:identifikationsnummer, xhs:hochschulsemester, xhs:urlaubssemester, xhs:ersteinschreibung</xsl:text>
               <xsl:text>
ID:SCH-XHS-0003-ErlaubtStudierender</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M37"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M37"/>
   <xsl:template match="@*|node()" priority="-2" mode="M37">
      <xsl:apply-templates select="*" mode="M37"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:hochschulabschlusszeugnis//xhs:studierender/*"
                 priority="1000"
                 mode="M38">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':nameNatuerlichePerson') or ends-with(name(),':geburt') or ends-with(name(),':matrikelnummer') or ends-with(name(),':identifikationsnummer') or ends-with(name(),':hochschulsemester') or ends-with(name(),':ersteinschreibung') or ends-with(name(),':urlaubssemester')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0003 KindElement:_ Das Feld "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="name(.)"/>
               <xsl:text/>
               <xsl:text>" darf in "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="ancestor::*/name()"/>
               <xsl:text/>
               <xsl:text>" nicht angegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer, xbd:identifikationsnummer, xhs:hochschulsemester, xhs:urlaubssemester, xhs:ersteinschreibung</xsl:text>
               <xsl:text>
ID:SCH-XHS-0003-ErlaubtStudierender</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':nameNatuerlichePerson') or ends-with(name(),':geburt') or ends-with(name(),':matrikelnummer') or ends-with(name(),':identifikationsnummer')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0019 KindElement:_ Das Feld "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="name(.)"/>
               <xsl:text/>
               <xsl:text>" darf in "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="ancestor::*/name()"/>
               <xsl:text/>
               <xsl:text>" nicht angegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0019-KeineSemesterHAZ</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M38"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M38"/>
   <xsl:template match="@*|node()" priority="-2" mode="M38">
      <xsl:apply-templates select="*" mode="M38"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:immatrikulationsbescheinigung//xhs:studierender/*"
                 priority="1000"
                 mode="M39">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':nameNatuerlichePerson') or ends-with(name(),':geburt') or ends-with(name(),':matrikelnummer') or ends-with(name(),':identifikationsnummer') or ends-with(name(),':hochschulsemester') or ends-with(name(),':ersteinschreibung') or ends-with(name(),':urlaubssemester')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0003 KindElement:_ Das Feld "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="name(.)"/>
               <xsl:text/>
               <xsl:text>" darf in "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="ancestor::*/name()"/>
               <xsl:text/>
               <xsl:text>" nicht angegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer, xbd:identifikationsnummer, xhs:hochschulsemester, xhs:urlaubssemester, xhs:ersteinschreibung</xsl:text>
               <xsl:text>
ID:SCH-XHS-0003-ErlaubtStudierender</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M39"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M39"/>
   <xsl:template match="@*|node()" priority="-2" mode="M39">
      <xsl:apply-templates select="*" mode="M39"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:rentenbescheinigung//xhs:studierender/*"
                 priority="1000"
                 mode="M40">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':nameNatuerlichePerson') or ends-with(name(),':geburt') or ends-with(name(),':matrikelnummer') or ends-with(name(),':identifikationsnummer') or ends-with(name(),':hochschulsemester') or ends-with(name(),':ersteinschreibung') or ends-with(name(),':urlaubssemester')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0003 KindElement:_ Das Feld "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="name(.)"/>
               <xsl:text/>
               <xsl:text>" darf in "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="ancestor::*/name()"/>
               <xsl:text/>
               <xsl:text>" nicht angegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer, xbd:identifikationsnummer, xhs:hochschulsemester, xhs:urlaubssemester, xhs:ersteinschreibung</xsl:text>
               <xsl:text>
ID:SCH-XHS-0003-ErlaubtStudierender</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M40"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M40"/>
   <xsl:template match="@*|node()" priority="-2" mode="M40">
      <xsl:apply-templates select="*" mode="M40"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:studienverlaufsbescheinigung//xhs:studierender/*"
                 priority="1000"
                 mode="M41">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':nameNatuerlichePerson') or ends-with(name(),':geburt') or ends-with(name(),':matrikelnummer') or ends-with(name(),':identifikationsnummer') or ends-with(name(),':hochschulsemester') or ends-with(name(),':ersteinschreibung') or ends-with(name(),':urlaubssemester')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0003 KindElement:_ Das Feld "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="name(.)"/>
               <xsl:text/>
               <xsl:text>" darf in "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="ancestor::*/name()"/>
               <xsl:text/>
               <xsl:text>" nicht angegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer, xbd:identifikationsnummer, xhs:hochschulsemester, xhs:urlaubssemester, xhs:ersteinschreibung</xsl:text>
               <xsl:text>
ID:SCH-XHS-0003-ErlaubtStudierender</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M41"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M41"/>
   <xsl:template match="@*|node()" priority="-2" mode="M41">
      <xsl:apply-templates select="*" mode="M41"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:transcriptOfRecords//xhs:studierender/*"
                 priority="1000"
                 mode="M42">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':nameNatuerlichePerson') or ends-with(name(),':geburt') or ends-with(name(),':matrikelnummer') or ends-with(name(),':identifikationsnummer') or ends-with(name(),':hochschulsemester') or ends-with(name(),':ersteinschreibung') or ends-with(name(),':urlaubssemester')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0003 KindElement:_ Das Feld "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="name(.)"/>
               <xsl:text/>
               <xsl:text>" darf in "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="ancestor::*/name()"/>
               <xsl:text/>
               <xsl:text>" nicht angegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer, xbd:identifikationsnummer, xhs:hochschulsemester, xhs:urlaubssemester, xhs:ersteinschreibung</xsl:text>
               <xsl:text>
ID:SCH-XHS-0003-ErlaubtStudierender</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M42"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M42"/>
   <xsl:template match="@*|node()" priority="-2" mode="M42">
      <xsl:apply-templates select="*" mode="M42"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:exmatrikulationsbescheinigung//xhs:studierender/xbd:nameNatuerlichePerson/*"
                 priority="1000"
                 mode="M43">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':familienname') or ends-with(name(),':vorname') or ends-with(name(),':fruehererFamilienname')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0004 KindUnterElement:_xbd:nameNatuerlichePerson__ Das Feld "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="name(.)"/>
               <xsl:text/>
               <xsl:text>" darf in "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="ancestor::*/name()"/>
               <xsl:text/>
               <xsl:text>" nicht angegeben werden. Erlaubt sind nur xbd:name, xbd:familienname, xbd:fruehererFamilienname.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0004-ErlaubtNameNatuerlichePerson</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M43"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M43"/>
   <xsl:template match="@*|node()" priority="-2" mode="M43">
      <xsl:apply-templates select="*" mode="M43"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:hochschulabschlusszeugnis//xhs:studierender/xbd:nameNatuerlichePerson/*"
                 priority="1000"
                 mode="M44">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':familienname') or ends-with(name(),':vorname') or ends-with(name(),':fruehererFamilienname')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0004 KindUnterElement:_xbd:nameNatuerlichePerson__ Das Feld "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="name(.)"/>
               <xsl:text/>
               <xsl:text>" darf in "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="ancestor::*/name()"/>
               <xsl:text/>
               <xsl:text>" nicht angegeben werden. Erlaubt sind nur xbd:name, xbd:familienname, xbd:fruehererFamilienname.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0004-ErlaubtNameNatuerlichePerson</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M44"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M44"/>
   <xsl:template match="@*|node()" priority="-2" mode="M44">
      <xsl:apply-templates select="*" mode="M44"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:immatrikulationsbescheinigung//xhs:studierender/xbd:nameNatuerlichePerson/*"
                 priority="1000"
                 mode="M45">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':familienname') or ends-with(name(),':vorname') or ends-with(name(),':fruehererFamilienname')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0004 KindUnterElement:_xbd:nameNatuerlichePerson__ Das Feld "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="name(.)"/>
               <xsl:text/>
               <xsl:text>" darf in "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="ancestor::*/name()"/>
               <xsl:text/>
               <xsl:text>" nicht angegeben werden. Erlaubt sind nur xbd:name, xbd:familienname, xbd:fruehererFamilienname.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0004-ErlaubtNameNatuerlichePerson</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M45"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M45"/>
   <xsl:template match="@*|node()" priority="-2" mode="M45">
      <xsl:apply-templates select="*" mode="M45"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:rentenbescheinigung//xhs:studierender/xbd:nameNatuerlichePerson/*"
                 priority="1000"
                 mode="M46">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':familienname') or ends-with(name(),':vorname') or ends-with(name(),':fruehererFamilienname')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0004 KindUnterElement:_xbd:nameNatuerlichePerson__ Das Feld "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="name(.)"/>
               <xsl:text/>
               <xsl:text>" darf in "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="ancestor::*/name()"/>
               <xsl:text/>
               <xsl:text>" nicht angegeben werden. Erlaubt sind nur xbd:name, xbd:familienname, xbd:fruehererFamilienname.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0004-ErlaubtNameNatuerlichePerson</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M46"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M46"/>
   <xsl:template match="@*|node()" priority="-2" mode="M46">
      <xsl:apply-templates select="*" mode="M46"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:studienverlaufsbescheinigung//xhs:studierender/xbd:nameNatuerlichePerson/*"
                 priority="1000"
                 mode="M47">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':familienname') or ends-with(name(),':vorname') or ends-with(name(),':fruehererFamilienname')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0004 KindUnterElement:_xbd:nameNatuerlichePerson__ Das Feld "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="name(.)"/>
               <xsl:text/>
               <xsl:text>" darf in "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="ancestor::*/name()"/>
               <xsl:text/>
               <xsl:text>" nicht angegeben werden. Erlaubt sind nur xbd:name, xbd:familienname, xbd:fruehererFamilienname.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0004-ErlaubtNameNatuerlichePerson</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M47"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M47"/>
   <xsl:template match="@*|node()" priority="-2" mode="M47">
      <xsl:apply-templates select="*" mode="M47"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:transcriptOfRecords//xhs:studierender/xbd:nameNatuerlichePerson/*"
                 priority="1000"
                 mode="M48">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':familienname') or ends-with(name(),':vorname') or ends-with(name(),':fruehererFamilienname')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0004 KindUnterElement:_xbd:nameNatuerlichePerson__ Das Feld "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="name(.)"/>
               <xsl:text/>
               <xsl:text>" darf in "</xsl:text>
               <xsl:text/>
               <xsl:value-of select="ancestor::*/name()"/>
               <xsl:text/>
               <xsl:text>" nicht angegeben werden. Erlaubt sind nur xbd:name, xbd:familienname, xbd:fruehererFamilienname.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0004-ErlaubtNameNatuerlichePerson</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M48"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M48"/>
   <xsl:template match="@*|node()" priority="-2" mode="M48">
      <xsl:apply-templates select="*" mode="M48"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:studienverlaufsbescheinigung/xbd:ausstellung/*"
                 priority="1000"
                 mode="M49">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(ends-with(name(),':ort'))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0006 KindUnterElement:_xbd:ausstellung__ Ein Ausstellungsort darf auf der Studienverlaufsbescheinigung nicht angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0006-KeinAusstellungsortSVB</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M49"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M49"/>
   <xsl:template match="@*|node()" priority="-2" mode="M49">
      <xsl:apply-templates select="*" mode="M49"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:hochschulabschlusszeugnis/xbd:gueltigkeitszeitraum/*"
                 priority="1000"
                 mode="M50">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(ends-with(name(),':ende'))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0007 KindUnterElement:_xbd:gueltigkeitszeitraum__ Das Element </xsl:text>
               <xsl:text/>
               <xsl:value-of select="name(.)"/>
               <xsl:text/>
               <xsl:text> darf nicht angegeben werden. Die Gültigkeit eines Zeugnisses läuft nicht ab.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0007-KeinAblaufdatumZeugnis</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M50"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M50"/>
   <xsl:template match="@*|node()" priority="-2" mode="M50">
      <xsl:apply-templates select="*" mode="M50"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:exmatrikulationsbescheinigung/xbd:ausstellung/*"
                 priority="1000"
                 mode="M51">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(ends-with(name(),':ort'))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0008 KindUnterElement:_xbd:ausstellung__ Ein Ausstellungsort darf auf der Exmatrikulationsbescheinigung nicht angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0008-KeinAusstellungsortExmatrikulationsbescheinigung</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M51"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M51"/>
   <xsl:template match="@*|node()" priority="-2" mode="M51">
      <xsl:apply-templates select="*" mode="M51"/>
   </xsl:template>
</xsl:stylesheet>
