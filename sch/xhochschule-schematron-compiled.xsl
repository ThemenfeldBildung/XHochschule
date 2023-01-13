<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:saxon="http://saxon.sf.net/"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                xmlns:oxy="http://www.oxygenxml.com/schematron/validation"
                xmlns:xbd="http://xbildung.de/def/xbildung/0.93/xsd"
                xmlns:xhs="http://xhochschule.de/def/xhochschule/0.94/xsd"
                version="2.0"
                xml:base="file:/C:/xoev/XHS/Spezifikation/build/sch/xhochschule-schematron.sch_xslt_cascade">
   <!--Implementers: please note that overriding process-prolog or process-root is 
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
      <xsl:apply-templates select="/" mode="M2"/>
      <xsl:apply-templates select="/" mode="M3"/>
      <xsl:apply-templates select="/" mode="M4"/>
      <xsl:apply-templates select="/" mode="M5"/>
      <xsl:apply-templates select="/" mode="M6"/>
      <xsl:apply-templates select="/" mode="M7"/>
      <xsl:apply-templates select="/" mode="M8"/>
      <xsl:apply-templates select="/" mode="M9"/>
      <xsl:apply-templates select="/" mode="M10"/>
      <xsl:apply-templates select="/" mode="M11"/>
      <xsl:apply-templates select="/" mode="M12"/>
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
   </xsl:template>
   <!--SCHEMATRON PATTERNS-->
   <!--PATTERN -->
   <xsl:template match="text()" priority="-1" mode="M2"/>
   <xsl:template match="@*|node()" priority="-2" mode="M2">
      <xsl:apply-templates select="*" mode="M2"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="//*" priority="1000" mode="M3">

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
      <xsl:apply-templates select="*" mode="M3"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M3"/>
   <xsl:template match="@*|node()" priority="-2" mode="M3">
      <xsl:apply-templates select="*" mode="M3"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:rentenbescheinigung//xhs:studienabschnitt"
                 priority="1000"
                 mode="M4">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if (*:beurlaubungsstatus/code = 'http://xhochschule.de/def/xhochschule/0.94/code/beurlaubungsstatus/beurlaubt') then exists(*:beurlaubungsgrund) else empty(*:beurlaubungsgrund)"/>
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
      <xsl:apply-templates select="*" mode="M4"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M4"/>
   <xsl:template match="@*|node()" priority="-2" mode="M4">
      <xsl:apply-templates select="*" mode="M4"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:diplomaSupplement//xhs:angabenInhaber"
                 priority="1000"
                 mode="M5">

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
               <xsl:text>XHS-0016 Fehlende Angabe in xhs:studierender/xbd:geburt. Es muss angegeben werden: xbd:datum</xsl:text>
               <xsl:text>
ID:SCH-XHS-0016-PflichtfelderStudierenderGeburt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M5"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M5"/>
   <xsl:template match="@*|node()" priority="-2" mode="M5">
      <xsl:apply-templates select="*" mode="M5"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:exmatrikulationsbescheinigung//xhs:studierender"
                 priority="1000"
                 mode="M6">

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
               <xsl:text>XHS-0016 Fehlende Angabe in xhs:studierender/xbd:geburt. Es muss angegeben werden: xbd:datum</xsl:text>
               <xsl:text>
ID:SCH-XHS-0016-PflichtfelderStudierenderGeburt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M6"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M6"/>
   <xsl:template match="@*|node()" priority="-2" mode="M6">
      <xsl:apply-templates select="*" mode="M6"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:hochschulabschlusszeugnis//xhs:studierender"
                 priority="1000"
                 mode="M7">

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
               <xsl:text>XHS-0016 Fehlende Angabe in xhs:studierender/xbd:geburt. Es muss angegeben werden: xbd:datum</xsl:text>
               <xsl:text>
ID:SCH-XHS-0016-PflichtfelderStudierenderGeburt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M7"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M7"/>
   <xsl:template match="@*|node()" priority="-2" mode="M7">
      <xsl:apply-templates select="*" mode="M7"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:immatrikulationsbescheinigung//xhs:studierender"
                 priority="1000"
                 mode="M8">

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
               <xsl:text>XHS-0016 Fehlende Angabe in xhs:studierender/xbd:geburt. Es muss angegeben werden: xbd:datum</xsl:text>
               <xsl:text>
ID:SCH-XHS-0016-PflichtfelderStudierenderGeburt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M8"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M8"/>
   <xsl:template match="@*|node()" priority="-2" mode="M8">
      <xsl:apply-templates select="*" mode="M8"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:rentenbescheinigung//xhs:studierender"
                 priority="1000"
                 mode="M9">

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
               <xsl:text>XHS-0016 Fehlende Angabe in xhs:studierender/xbd:geburt. Es muss angegeben werden: xbd:datum</xsl:text>
               <xsl:text>
ID:SCH-XHS-0016-PflichtfelderStudierenderGeburt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M9"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M9"/>
   <xsl:template match="@*|node()" priority="-2" mode="M9">
      <xsl:apply-templates select="*" mode="M9"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:studienverlaufsbescheinigung//xhs:studierender"
                 priority="1000"
                 mode="M10">

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
               <xsl:text>XHS-0016 Fehlende Angabe in xhs:studierender/xbd:geburt. Es muss angegeben werden: xbd:datum</xsl:text>
               <xsl:text>
ID:SCH-XHS-0016-PflichtfelderStudierenderGeburt</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M10"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M10"/>
   <xsl:template match="@*|node()" priority="-2" mode="M10">
      <xsl:apply-templates select="*" mode="M10"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:immatrikulationsbescheinigungBAfoeGP9//xhs:studierender"
                 priority="1000"
                 mode="M11">

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
               <xsl:text>XHS-0013 Die Zahl der Hochschulsemester und Urlaubssemester des Studierenden werden auf der Immatrikulationsbescheinigung nach BaföG §9 nicht benötigt.</xsl:text>
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
               <xsl:text>XHS-0014 Die Anrede des Studierenden wird auf der Immatrikulationsbescheinigung nach BaföG §9 nicht benötigt.</xsl:text>
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
               <xsl:text>XHS-0018 Geburtsort und Geburtsdatum des Studierenden müssen auf der Immatrikulationsbescheinigung nach BaföG §9 angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0018-GeburtPflicht</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M11"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M11"/>
   <xsl:template match="@*|node()" priority="-2" mode="M11">
      <xsl:apply-templates select="*" mode="M11"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:immatrikulationsbescheinigungBAfoeGP9"
                 priority="1000"
                 mode="M12">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(xhs:lernzeitmodell/code/text(),'/vollzeit') or ends-with(xhs:lernzeitmodell/code/text(),'/teilzeit')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0015 Das Lernzeitmodell muss auf der Immatrikulationsbescheinigung nach BaföG §9 die Ausprägung "Teilzeit" oder "Vollzeit" haben.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0015-LernzeitmodellVollOderTeilzeit</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M12"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M12"/>
   <xsl:template match="@*|node()" priority="-2" mode="M12">
      <xsl:apply-templates select="*" mode="M12"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:hochschulabschlusszeugnis//xhs:benotung"
                 priority="1000"
                 mode="M13">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:gesamtnote/*:note)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0017 Fehlende Angabe in xhs:benotung. Es muss angegeben werden: xhs:gesamtnote/xbd:note</xsl:text>
               <xsl:text>
ID:SCH-XHS-0017-PflichtfelderBenotung</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M13"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M13"/>
   <xsl:template match="@*|node()" priority="-2" mode="M13">
      <xsl:apply-templates select="*" mode="M13"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:diplomaSupplement//xhs:angabenInhaber/*"
                 priority="1000"
                 mode="M14">

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
               <xsl:text>" nicht agegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer, xbd:identifikationsnummer, xhs:hochschulsemester, xhs:urlaubssemester, xhs:ersteinschreibung</xsl:text>
               <xsl:text>
ID:SCH-XHS-0003-ErlaubtStudierender</xsl:text>
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
   <xsl:template match="xhs:exmatrikulationsbescheinigung//xhs:studierender/*"
                 priority="1000"
                 mode="M15">

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
               <xsl:text>" nicht agegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer, xbd:identifikationsnummer, xhs:hochschulsemester, xhs:urlaubssemester, xhs:ersteinschreibung</xsl:text>
               <xsl:text>
ID:SCH-XHS-0003-ErlaubtStudierender</xsl:text>
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
   <xsl:template match="xhs:hochschulabschlusszeugnis//xhs:studierender/*"
                 priority="1000"
                 mode="M16">

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
               <xsl:text>" nicht agegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer, xbd:identifikationsnummer, xhs:hochschulsemester, xhs:urlaubssemester, xhs:ersteinschreibung</xsl:text>
               <xsl:text>
ID:SCH-XHS-0003-ErlaubtStudierender</xsl:text>
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
   <xsl:template match="xhs:immatrikulationsbescheinigung//xhs:studierender/*"
                 priority="1000"
                 mode="M17">

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
               <xsl:text>" nicht agegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer, xbd:identifikationsnummer, xhs:hochschulsemester, xhs:urlaubssemester, xhs:ersteinschreibung</xsl:text>
               <xsl:text>
ID:SCH-XHS-0003-ErlaubtStudierender</xsl:text>
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
   <xsl:template match="xhs:rentenbescheinigung//xhs:studierender/*"
                 priority="1000"
                 mode="M18">

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
               <xsl:text>" nicht agegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer, xbd:identifikationsnummer, xhs:hochschulsemester, xhs:urlaubssemester, xhs:ersteinschreibung</xsl:text>
               <xsl:text>
ID:SCH-XHS-0003-ErlaubtStudierender</xsl:text>
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
   <xsl:template match="xhs:studienverlaufsbescheinigung//xhs:studierender/*"
                 priority="1000"
                 mode="M19">

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
               <xsl:text>" nicht agegeben werden. Erlaubt sind nur xbd:nameNatuerlichePerson, xbd:geburt, xhs:matrikelnummer, xbd:identifikationsnummer, xhs:hochschulsemester, xhs:urlaubssemester, xhs:ersteinschreibung</xsl:text>
               <xsl:text>
ID:SCH-XHS-0003-ErlaubtStudierender</xsl:text>
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
   <xsl:template match="xhs:diplomaSupplement//xhs:angabenInhaber/xbd:nameNatuerlichePerson/*"
                 priority="1000"
                 mode="M20">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':familienname') or ends-with(name(),':vorname') or&#xA;ends-with(name(),':fruehererFamilienname')"/>
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
               <xsl:text>" nicht agegeben werden. Erlaubt sind nur xbd:name, xbd:familienname, xbd:fruehererFamilienname</xsl:text>
               <xsl:text>
ID:SCH-XHS-0004-ErlaubtNameNatuerlichePerson</xsl:text>
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
   <xsl:template match="xhs:exmatrikulationsbescheinigung//xhs:studierender/xbd:nameNatuerlichePerson/*"
                 priority="1000"
                 mode="M21">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':familienname') or ends-with(name(),':vorname') or&#xA;ends-with(name(),':fruehererFamilienname')"/>
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
               <xsl:text>" nicht agegeben werden. Erlaubt sind nur xbd:name, xbd:familienname, xbd:fruehererFamilienname</xsl:text>
               <xsl:text>
ID:SCH-XHS-0004-ErlaubtNameNatuerlichePerson</xsl:text>
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
   <xsl:template match="xhs:hochschulabschlusszeugnis//xhs:studierender/xbd:nameNatuerlichePerson/*"
                 priority="1000"
                 mode="M22">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':familienname') or ends-with(name(),':vorname') or&#xA;ends-with(name(),':fruehererFamilienname')"/>
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
               <xsl:text>" nicht agegeben werden. Erlaubt sind nur xbd:name, xbd:familienname, xbd:fruehererFamilienname</xsl:text>
               <xsl:text>
ID:SCH-XHS-0004-ErlaubtNameNatuerlichePerson</xsl:text>
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
   <xsl:template match="xhs:immatrikulationsbescheinigung//xhs:studierender/xbd:nameNatuerlichePerson/*"
                 priority="1000"
                 mode="M23">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':familienname') or ends-with(name(),':vorname') or&#xA;ends-with(name(),':fruehererFamilienname')"/>
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
               <xsl:text>" nicht agegeben werden. Erlaubt sind nur xbd:name, xbd:familienname, xbd:fruehererFamilienname</xsl:text>
               <xsl:text>
ID:SCH-XHS-0004-ErlaubtNameNatuerlichePerson</xsl:text>
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
   <xsl:template match="xhs:rentenbescheinigung//xhs:studierender/xbd:nameNatuerlichePerson/*"
                 priority="1000"
                 mode="M24">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':familienname') or ends-with(name(),':vorname') or&#xA;ends-with(name(),':fruehererFamilienname')"/>
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
               <xsl:text>" nicht agegeben werden. Erlaubt sind nur xbd:name, xbd:familienname, xbd:fruehererFamilienname</xsl:text>
               <xsl:text>
ID:SCH-XHS-0004-ErlaubtNameNatuerlichePerson</xsl:text>
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
   <xsl:template match="xhs:studienverlaufsbescheinigung//xhs:studierender/xbd:nameNatuerlichePerson/*"
                 priority="1000"
                 mode="M25">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(name(),':familienname') or ends-with(name(),':vorname') or&#xA;ends-with(name(),':fruehererFamilienname')"/>
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
               <xsl:text>" nicht agegeben werden. Erlaubt sind nur xbd:name, xbd:familienname, xbd:fruehererFamilienname</xsl:text>
               <xsl:text>
ID:SCH-XHS-0004-ErlaubtNameNatuerlichePerson</xsl:text>
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
   <xsl:template match="xhs:studienverlaufsbescheinigung/xbd:ausstellung/*"
                 priority="1000"
                 mode="M26">

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
      <xsl:apply-templates select="*" mode="M26"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M26"/>
   <xsl:template match="@*|node()" priority="-2" mode="M26">
      <xsl:apply-templates select="*" mode="M26"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:hochschulabschlusszeugnis/xbd:gueltigkeitszeitraum/*"
                 priority="1000"
                 mode="M27">

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
      <xsl:apply-templates select="*" mode="M27"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M27"/>
   <xsl:template match="@*|node()" priority="-2" mode="M27">
      <xsl:apply-templates select="*" mode="M27"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:exmatrikulationsbescheinigung/xbd:ausstellung/*"
                 priority="1000"
                 mode="M28">

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
      <xsl:apply-templates select="*" mode="M28"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M28"/>
   <xsl:template match="@*|node()" priority="-2" mode="M28">
      <xsl:apply-templates select="*" mode="M28"/>
   </xsl:template>
</xsl:stylesheet>
