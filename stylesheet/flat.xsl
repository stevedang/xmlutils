<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xc="XmlCache">
	<xsl:output method="text" omit-xml-declaration="yes" indent="yes"/>
	<xsl:variable name="vFirstLeaf" select="(//*[@xc:value][not(descendant::*[@xc:value])])[1]"/>
	<xsl:variable name="vAllLevels" select="$vFirstLeaf/ancestor-or-self::*[@xc:value]|$vFirstLeaf/*"/>

	<xsl:template match="/">
		<xsl:apply-templates select="$vAllLevels" mode="title"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:apply-templates mode="lastNormal" select="//*[@xc:value and not(descendant::*[@xc:value])]"/>
	</xsl:template>

	<xsl:template match="*" mode="title">
		<xsl:if test="position() &gt; 2">, </xsl:if>
		<xsl:if test="not(position()=1) "><xsl:value-of select="local-name()"/></xsl:if>
	</xsl:template>

	<xsl:template match="*" mode="lastNormal">
		<xsl:apply-templates mode="value" select="ancestor-or-self::*[@xc:value]"/>
		<xsl:apply-templates select="*"/>
		<xsl:text>&#xA;</xsl:text>
	</xsl:template>

	<xsl:template match="*" mode="value">
		<xsl:if test="position() &gt; 2">, </xsl:if>
		<xsl:if test="not(position()=1) "><xsl:value-of select="@xc:value"/> </xsl:if> 
	</xsl:template>

	<xsl:template match="*">
		<xsl:text>, </xsl:text>
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>
