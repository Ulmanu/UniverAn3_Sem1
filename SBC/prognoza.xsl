<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
    <table border="1">
      <tr bgcolor="gray">
        <th>PHENOMENA</th>
        <th>Pressure</th>
        <th>Price</th>
        <th>Price minimised</th>
      </tr>
      <xsl:for-each select="">
     
      <tr>
        <td><xsl:value-of select="PHENOMENA"/></td>
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
