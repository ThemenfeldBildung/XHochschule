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
                xmlns:xbd="http://xbildung.de/def/xbildung/1.1/xsd"
                xmlns:xhs="http://xhochschule.de/def/xhochschule/1.1/xsd"
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
   </xsl:template>
   <!--SCHEMATRON PATTERNS-->
   <!--PATTERN -->
   <xsl:template match="text()" priority="-1" mode="M13"/>
   <xsl:template match="@*|node()" priority="-2" mode="M13">
      <xsl:apply-templates select="*" mode="M13"/>
   </xsl:template>
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="xhs:exmatrikulationsbescheinigung"
                 priority="1000"
                 mode="M14">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="normalize-space(string())!=''"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0000 GlobaleRegel: Das Element </xsl:text>
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
         <xsl:when test="if (*:beurlaubungsstatus/code/code = 'http://xhochschule.de/def/xhochschule/1.0/code/beurlaubungsstatus/beurlaubt') then exists(*:beurlaubungsgrund) else empty(*:beurlaubungsgrund)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0001 Wenn und nur wenn der Beurlaubungsstatus 'beurlaubt' ist, darf der Beurlaubungsgrund angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0001-WennBeurlaubtDannBeurlaubungsgrund</xsl:text>
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
   <xsl:template match="xhs:immatrikulationsbescheinigungBAfoeGP9//xhs:lernzeitmodell"
                 priority="1000"
                 mode="M16">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="ends-with(*:code/code/text(),'/vollzeit') or ends-with(*:code/code/text(),'/teilzeit')"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0010 Das Lernzeitmodell muss in der Immatrikulationsbescheinigung nach BaföG § 9 die Ausprägung 'Teilzeit' oder 'Vollzeit' haben.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0010-LernzeitmodellVollOderTeilzeit</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0014 Wenn und nur wenn der Wert der Codeliste Lernzeitmodell 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0014-WertNichtInListeLernzeitmodell</xsl:text>
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
   <xsl:template match="xhs:hochschulabschlusszeugnis/xhs:benotung"
                 priority="1000"
                 mode="M17">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="exists(*:gesamtnote/*:note)"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0011 Fehlende Angabe in 'benotung'. 'note' muss angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0011-PflichtfelderBenotung</xsl:text>
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
   <xsl:template match="xhs:hochschulabschlusszeugnis//xhs:leistungsart"
                 priority="1000"
                 mode="M18">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0012 Wenn und nur wenn der Wert der Codeliste Leistungsart 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0012-WertNichtInListeLeistungsart</xsl:text>
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
   <xsl:template match="xhs:transcriptOfRecords//xhs:leistungsart"
                 priority="1000"
                 mode="M19">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0012 Wenn und nur wenn der Wert der Codeliste Leistungsart 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0012-WertNichtInListeLeistungsart</xsl:text>
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
   <xsl:template match="xhs:hochschulabschlusszeugnis//xhs:leistungsstatus"
                 priority="1000"
                 mode="M20">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0013 Wenn und nur wenn der Wert der Codeliste Leistungsstatus 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden. </xsl:text>
               <xsl:text>
ID:SCH-XHS-0013-WertNichtInListeLeistungsstatus</xsl:text>
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
   <xsl:template match="xhs:transcriptOfRecords//xhs:leistungsstatus"
                 priority="1000"
                 mode="M21">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0013 Wenn und nur wenn der Wert der Codeliste Leistungsstatus 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden. </xsl:text>
               <xsl:text>
ID:SCH-XHS-0013-WertNichtInListeLeistungsstatus</xsl:text>
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
   <xsl:template match="xhs:exmatrikulationsbescheinigung//xhs:lernzeitmodell"
                 priority="1000"
                 mode="M22">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0014 Wenn und nur wenn der Wert der Codeliste Lernzeitmodell 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0014-WertNichtInListeLernzeitmodell</xsl:text>
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
   <xsl:template match="xhs:immatrikulationsbescheinigung//xhs:lernzeitmodell"
                 priority="1000"
                 mode="M23">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0014 Wenn und nur wenn der Wert der Codeliste Lernzeitmodell 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0014-WertNichtInListeLernzeitmodell</xsl:text>
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
   <xsl:template match="xhs:rentenbescheinigung//xhs:lernzeitmodell"
                 priority="1000"
                 mode="M24">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0014 Wenn und nur wenn der Wert der Codeliste Lernzeitmodell 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0014-WertNichtInListeLernzeitmodell</xsl:text>
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
   <xsl:template match="xhs:studienverlaufsbescheinigung//xhs:lernzeitmodell"
                 priority="1000"
                 mode="M25">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0014 Wenn und nur wenn der Wert der Codeliste Lernzeitmodell 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0014-WertNichtInListeLernzeitmodell</xsl:text>
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
   <xsl:template match="xhs:exmatrikulationsbescheinigung//xhs:beurlaubungsstatus"
                 priority="1000"
                 mode="M26">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0015 Wenn und nur wenn der Wert der Codeliste Beurlaubungsstatus 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus</xsl:text>
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
   <xsl:template match="xhs:immatrikulationsbescheinigung//xhs:beurlaubungsstatus"
                 priority="1000"
                 mode="M27">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0015 Wenn und nur wenn der Wert der Codeliste Beurlaubungsstatus 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus</xsl:text>
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
   <xsl:template match="xhs:immatrikulationsbescheinigungBAfoeGP9//xhs:beurlaubungsstatus"
                 priority="1000"
                 mode="M28">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0015 Wenn und nur wenn der Wert der Codeliste Beurlaubungsstatus 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus</xsl:text>
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
   <xsl:template match="xhs:rentenbescheinigung//xhs:beurlaubungsstatus"
                 priority="1000"
                 mode="M29">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0015 Wenn und nur wenn der Wert der Codeliste Beurlaubungsstatus 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus</xsl:text>
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
   <xsl:template match="xhs:studienverlaufsbescheinigung//xhs:beurlaubungsstatus"
                 priority="1000"
                 mode="M30">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0015 Wenn und nur wenn der Wert der Codeliste Beurlaubungsstatus 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0015-WertNichtInListeBeurlaubungsstatus</xsl:text>
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
   <xsl:template match="xhs:immatrikulationsbescheinigung//xhs:immatrikulationsstatus"
                 priority="1000"
                 mode="M31">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0016 Wenn und nur wenn der Wert der Codeliste Immatrikulationsstatus 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0016-WertNichtInListeImmatrikulationsstatus</xsl:text>
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
   <xsl:template match="xhs:immatrikulationsbescheinigungBAfoeGP9//xhs:immatrikulationsstatus"
                 priority="1000"
                 mode="M32">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0016 Wenn und nur wenn der Wert der Codeliste Immatrikulationsstatus 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0016-WertNichtInListeImmatrikulationsstatus</xsl:text>
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
   <xsl:template match="xhs:hochschulabschlusszeugnis//xhs:lateinischeEhrenbezeichnung"
                 priority="1000"
                 mode="M33">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0017 Wenn und nur wenn der Wert der Codeliste LateinischeEhrenbezeichnung 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden. </xsl:text>
               <xsl:text>
ID:SCH-XHS-0017-WertNichtInListeLateinischeEhrenbezeichnung</xsl:text>
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
   <xsl:template match="xhs:hochschulabschlusszeugnis/xhs:leistung//xbd:note"
                 priority="1000"
                 mode="M34">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(matches(., '^(6([,.]0)?|([1-5]([,.]\d+)))|[A-F][+-]?$'))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0018 Im Feld Note dürfen nur zwei Formate 1. 'Zahl-Komma-Zahl' Beispiel "2,6" oder 2. 'Buchstabe A-F (+/-)' Beispiel "A" oder "A+" angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0018-Benotungsschema</xsl:text>
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
   <xsl:template match="xhs:transcriptOfRecords//xbd:note"
                 priority="1000"
                 mode="M35">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(matches(., '^(6([,.]0)?|([1-5]([,.]\d+)))|[A-F][+-]?$'))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0018 Im Feld Note dürfen nur zwei Formate 1. 'Zahl-Komma-Zahl' Beispiel "2,6" oder 2. 'Buchstabe A-F (+/-)' Beispiel "A" oder "A+" angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0018-Benotungsschema</xsl:text>
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
   <xsl:template match="xhs:hochschulabschlusszeugnis//xbd:note"
                 priority="1000"
                 mode="M36">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(matches(., '^(6([,.]0)?|([1-5]([,.]\d+)))|[A-F][+-]?$'))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0019 Im Feld Note dürfen nur zwei Formate 1. 'Zahl-Komma-Zahl' Beispiel "2,6" oder 2. 'Buchstabe A-F (+/-)' Beispiel "A" oder "A+" angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0019-BenotungsschemaGesamtnoteundAbschlussarbeit</xsl:text>
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
   <xsl:template match="xhs:hochschulabschlusszeugnis//xhs:leistung"
                 priority="1000"
                 mode="M37">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/leistungsartCode/code/text(), 'klausur') or  ends-with(*:leistungsart/leistungsartCode/code/text(), 'pruefung')) then not(exists(*:beschreibung/*:umfangInSWS)) else (not(exists(*:beschreibung/*:umfangInSWS)) or exists(*:beschreibung/*:umfangInSWS))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0020 Der Wert 'UmfangInSWS' darf nicht angegeben werden, wenn der Inhalt des Codewertes von 'leistungsart' mit 'klausur' oder 'pruefung' endet. Bei Prüfungenund Klausuren handelt es sich um punktuelle Ereignisse, die nicht über das Semester verteilt sind.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0020-KeineSWSBeiPruefungen</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:unbedenklichkeitsvermerk) or not(exists(*:unbedenklichkeitsvermerk))) else not(exists(*:unbedenklichkeitsvermerk))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0021 Der Unbedenklichkeitsvermerk darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0021-UnbedenklichkeitNurBeiStudienfach</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:angestrebterAbschluss) or not(exists(*:angestrebterAbschluss))) else not(exists(*:angestrebterAbschluss))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0022 Der angestrebte Abschluss darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0022-angestrebterAbschluss</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:fachsemester) or not(exists(*:fachsemester))) else not(exists(*:fachsemester))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0023 Das Fachsemester darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0023-fachsemester</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:schluesselISCED2011) or not(exists(*:schluesselISCED2011))) else not(exists(*:schluesselISCED2011))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0024 Der Schlüssel nach ISCED2011 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0024-schluesselISCED2011</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:schluesselISCEDF2013) or not(exists(*:schluesselISCEDF2013))) else not(exists(*:schluesselISCEDF2013))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0025 Der Schlüssel nach ISCEDF2013 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0025-schluesselISCEDF2013</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:schluesselEQF) or not(exists(*:schluesselEQF))) else not(exists(*:schluesselEQF))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0026 Der Schlüssel nach EQF darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0026-schluesselEQF</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:benotet/text(),'true') or ends-with(*:benotet/text(),'1')) then (exists(*:leistungsbenotungsstatus)) else (not(exists(*:leistungsbenotungsstatus)))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0027 Wenn und nur wenn eine Leistung benotet ist (boolean 'benotet' = 'true' oder '1'), soll der Leistungsbenotungsstatus angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0027-nurWennBenotetLeistungsbenotungsstatus</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:benotet/text(),'true') or ends-with(*:benotet/text(),'1')) then (exists(*:benotung)) else (not(exists(*:benotung)))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0028 Wenn und nur wenn eine Leistung benotet ist (boolean 'benotet' = 'true' oder '1'), soll die Benotung angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0028-nurWennBenotetNote</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="((ends-with(*:leistungsart/code/code/text(), 'modul')) and (not(exists(*:beschreibung/*:modulbeschreibungNachKMK)) or exists(*:beschreibung/*:modulbeschreibungNachKMK))) or (not(ends-with(*:leistungsart/code/code/text(), 'modul')) and (not(exists(*:beschreibung/*:modulbeschreibungNachKMK))))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0029 Nur wenn der Wert der Codeliste Leistungsart auf 'modul' gesetzt wurde, soll die Beschreibung nach den Vorgaben der KMK ausgefüllt werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0029-nurWennModulModulbeschreibungNachKMK</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:faecherschluesselDESTATIS) or not(exists(*:faecherschluesselDESTATIS))) else not(exists(*:faecherschluesselDESTATIS))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0031 Der Fächerschlüssel nach Destatis darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0031-faecherschluesselDESTATIS</xsl:text>
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
   <xsl:template match="xhs:transcriptOfRecords//xhs:leistung"
                 priority="1000"
                 mode="M38">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/leistungsartCode/code/text(), 'klausur') or  ends-with(*:leistungsart/leistungsartCode/code/text(), 'pruefung')) then not(exists(*:beschreibung/*:umfangInSWS)) else (not(exists(*:beschreibung/*:umfangInSWS)) or exists(*:beschreibung/*:umfangInSWS))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0020 Der Wert 'UmfangInSWS' darf nicht angegeben werden, wenn der Inhalt des Codewertes von 'leistungsart' mit 'klausur' oder 'pruefung' endet. Bei Prüfungenund Klausuren handelt es sich um punktuelle Ereignisse, die nicht über das Semester verteilt sind.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0020-KeineSWSBeiPruefungen</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:unbedenklichkeitsvermerk) or not(exists(*:unbedenklichkeitsvermerk))) else not(exists(*:unbedenklichkeitsvermerk))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0021 Der Unbedenklichkeitsvermerk darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0021-UnbedenklichkeitNurBeiStudienfach</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:angestrebterAbschluss) or not(exists(*:angestrebterAbschluss))) else not(exists(*:angestrebterAbschluss))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0022 Der angestrebte Abschluss darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0022-angestrebterAbschluss</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:fachsemester) or not(exists(*:fachsemester))) else not(exists(*:fachsemester))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0023 Das Fachsemester darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0023-fachsemester</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:schluesselISCED2011) or not(exists(*:schluesselISCED2011))) else not(exists(*:schluesselISCED2011))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0024 Der Schlüssel nach ISCED2011 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0024-schluesselISCED2011</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:schluesselISCEDF2013) or not(exists(*:schluesselISCEDF2013))) else not(exists(*:schluesselISCEDF2013))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0025 Der Schlüssel nach ISCEDF2013 darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0025-schluesselISCEDF2013</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:schluesselEQF) or not(exists(*:schluesselEQF))) else not(exists(*:schluesselEQF))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0026 Der Schlüssel nach EQF darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0026-schluesselEQF</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:benotet/text(),'true') or ends-with(*:benotet/text(),'1')) then (exists(*:leistungsbenotungsstatus)) else (not(exists(*:leistungsbenotungsstatus)))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0027 Wenn und nur wenn eine Leistung benotet ist (boolean 'benotet' = 'true' oder '1'), soll der Leistungsbenotungsstatus angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0027-nurWennBenotetLeistungsbenotungsstatus</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:benotet/text(),'true') or ends-with(*:benotet/text(),'1')) then (exists(*:benotung)) else (not(exists(*:benotung)))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0028 Wenn und nur wenn eine Leistung benotet ist (boolean 'benotet' = 'true' oder '1'), soll die Benotung angegeben werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0028-nurWennBenotetNote</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="((ends-with(*:leistungsart/code/code/text(), 'modul')) and (not(exists(*:beschreibung/*:modulbeschreibungNachKMK)) or exists(*:beschreibung/*:modulbeschreibungNachKMK))) or (not(ends-with(*:leistungsart/code/code/text(), 'modul')) and (not(exists(*:beschreibung/*:modulbeschreibungNachKMK))))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0029 Nur wenn der Wert der Codeliste Leistungsart auf 'modul' gesetzt wurde, soll die Beschreibung nach den Vorgaben der KMK ausgefüllt werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0029-nurWennModulModulbeschreibungNachKMK</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="if(ends-with(*:leistungsart/code/code/text(), 'studienfach') or ends-with(*:leistungsart/code/code/text(), 'studiengang')) then (exists(*:faecherschluesselDESTATIS) or not(exists(*:faecherschluesselDESTATIS))) else not(exists(*:faecherschluesselDESTATIS))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0031 Der Fächerschlüssel nach Destatis darf nur angegeben werden, wenn der Wert der Codeliste Leistungsart auf 'studienfach' oder 'studiengang' gesetzt wurde.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0031-faecherschluesselDESTATIS</xsl:text>
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
   <xsl:template match="xhs:hochschulabschlusszeugnis//xhs:leistungsbenotungsstatus"
                 priority="1000"
                 mode="M39">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0030 Wenn und nur wenn der Wert der Codeliste Leistungsbenotungsstatus 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden. </xsl:text>
               <xsl:text>
ID:SCH-XHS-0030-WertNichtInListeLeistungsbenotungsstatus</xsl:text>
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
   <xsl:template match="xhs:transcriptOfRecords//xhs:leistungsbenotungsstatus"
                 priority="1000"
                 mode="M40">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="(exists(*:nichtGelisteterWert) and ends-with(*:code/code/text(), 'wert_nicht_in_liste')) or (not(exists(*:nichtGelisteterWert)) and not(ends-with(*:code/code/text(), 'wert_nicht_in_liste')))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0030 Wenn und nur wenn der Wert der Codeliste Leistungsbenotungsstatus 'wert_nicht_in_liste' ist, soll das Freitextfeld 'nichtGelisteterWert' angegeben werden. </xsl:text>
               <xsl:text>
ID:SCH-XHS-0030-WertNichtInListeLeistungsbenotungsstatus</xsl:text>
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
   <xsl:template match="xhs:rentenbescheinigung" priority="1000" mode="M41">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test="not(exists(*:rentenversicherungsnummer/gueltigkeit/ende))"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>XHS-0032 Die Rentenversicheurngsnummer ist ab Geburt ein Leben lang gültig. Ablaufdatum darf nicht angezeigt werden.</xsl:text>
               <xsl:text>
ID:SCH-XHS-0032-keinAblaufdatumRentenversicherungsnummer</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M41"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M41"/>
   <xsl:template match="@*|node()" priority="-2" mode="M41">
      <xsl:apply-templates select="*" mode="M41"/>
   </xsl:template>
</xsl:stylesheet>
