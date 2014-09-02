<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xc="xmlCache">
	<xsl:param name="myparam" as="xs:string" required="no"/>
	<xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>
	<xsl:strip-space  elements="*"/>

	<xsl:template match="node()|@*" mode ="copy" >
		<xsl:copy>
			<xsl:apply-templates select="node()|@*" mode="copy"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match ="node()|@*">
		<xsl:choose>
			<xsl:when test="@*[name()='xc:value']=$myparam">
				<xsl:copy>
					<xsl:apply-templates select="@*|*" mode="copy"/>
				</xsl:copy>
			</xsl:when>
			<xsl:when test="descendant::*/@*[name()='xc:value']=$myparam">
				<xsl:copy>
					<xsl:apply-templates select="@*" mode="copy"/>
					<xsl:apply-templates select="*" />
				</xsl:copy>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>