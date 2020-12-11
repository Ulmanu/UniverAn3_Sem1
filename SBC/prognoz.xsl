<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
    <table border="1">
      <tr bgcolor="gray">
        <th>PHENOMENA</th>
        <th>PRESSURE</th>
        <th>TEMPERATURE</th>
        <th>WIND</th>
        <th>RELWET</th>
        <th>HEAT</th>
      </tr>
      <xsl:for-each select="MMWEATHER/REPORT/TOWN/FORECAST">
   
      <tr>
       
        <td>
        cloudiness=
        <xsl:value-of select="PHENOMENA/@cloudiness"/>
        <br></br>
         precipitation=
         <xsl:value-of select="PHENOMENA/@precipitation"/>
         <br></br>
         rpower=
          <xsl:value-of select="PHENOMENA/@rpower"/>
         <br></br>
          spower=
           <xsl:value-of select="PHENOMENA/@spower"/>
        </td>
        <td>
        max=
        <xsl:value-of select="PRESSURE/@max"/>
        <br></br>
         min=
        <xsl:value-of select="PRESSURE/@min"/>
        </td>

        <td>
          max=
        <xsl:value-of select="TEMPERATURE/@max"/>
        <br></br>
         min=
        <xsl:value-of select="TEMPERATURE/@min"/>
        </td>
        
        <td>
          max=
        <xsl:value-of select="WIND/@max"/>
        <br></br>
         min=
        <xsl:value-of select="WIND/@min"/>
        <br></br>
        direction=
         <xsl:value-of select="WIND/@direction"/>
        </td>

        <td>
           max=
        <xsl:value-of select="RELWET/@max"/>
        <br></br>
         min=
        <xsl:value-of select="RELWET/@min"/>
        </td>

        <td>
          max=
        <xsl:value-of select="HEAT/@max"/>
        <br></br>
         min=
        <xsl:value-of select="HEAT/@min"/>
        </td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
