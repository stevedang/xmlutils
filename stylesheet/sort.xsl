<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	
	<xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>
	<xsl:strip-space  elements="*"/>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()">
				<xsl:sort select="@*[starts-with(name(),'xc:value')]"/>
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
