<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output method="xml" encoding="ISO-8859-1" indent="yes"/>
 <xsl:strip-space elements="*"/>
 <xsl:template match="/">
  <xsl:copy-of select="."/>
 </xsl:template>
</xsl:stylesheet>
