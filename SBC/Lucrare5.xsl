<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>Common</th>
        <th>Botanical</th>
        <th>Price</th>
        <th>Price minimised</th>
      </tr>
      <xsl:for-each select="CATALOG/PLANT">
       <xsl:variable name="vPrice" 
        select="translate(PRICE, translate(PRICE,'0123456789.',''), '')"/>
      <tr>
        <td><xsl:value-of select="COMMON"/></td>
        <td><xsl:value-of select="BOTANICAL"/></td>
        <td><xsl:value-of select="PRICE"/></td>
        <td><xsl:value-of select="concat('$', ($vPrice - ($vPrice * 0.15)))"/></td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
