<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

        <!-- putting the xslt stylsheet into a html format -->
        <html>
            <body>

                <h1>Oscar Nominations of 2010</h1>
                Create a new search Query
                <fieldset>
                   <input id="back-to-webpage" type="button" value="Create new query"
                           onclick="window.location.href = 'http://titan.dcs.bbk.ac.uk/~mshala02/iwt-cs2/iwt-cs2/main.html'" />
                </fieldset>
                <!-- creating a table with a bit of styling adapted from a w3 schools tutorial-->
                <table border="2">
                    <tr bgcolor="#bf8040">
                        <th style="text-align:left">Year</th>
                        <th style="text-align:left">Category</th>
                        <th style="text-align:left">Nominee</th>
                        <th style="text-align:left">Info</th>
                        <th style="text-align:left">Won???</th>
                    </tr>
                    <!-- putting the creating search queries for the oscar winners -->
                    <xsl:for-each select="Oscars/Nomination">
                        <xsl:choose>
                            <xsl:when test="$winner = 'yes'">
                                <xsl:if test = "$winner=Won and (contains(Category,$category) and contains(Year,$year) and contains(Nominee,$nominee) and contains(Info,$info))" >
                                    <tr>
                                        <td><xsl:value-of select="Year"/></td>
                                        <td><xsl:value-of select="Category"/></td>
                                        <td><xsl:value-of select="Nominee"/></td>
                                        <td><xsl:value-of select="Info"/></td>
                                        <td><xsl:value-of select="Won"/></td>
                                    </tr>
                                </xsl:if>
                            </xsl:when>

                            <!-- putting the creating search queries for the oscar losers -->

                            <xsl:when test="$winner = 'no'">
                                <xsl:if test = "$winner = Won and (contains(Category,$category) and contains(Year,$year) and contains(Nominee,$nominee) and contains(Info,$info))">
                                    <tr>
                                        <td><xsl:value-of select="Year"/></td>
                                        <td><xsl:value-of select="Category"/></td>
                                        <td><xsl:value-of select="Nominee"/></td>
                                        <td><xsl:value-of select="Info"/></td>
                                        <td><xsl:value-of select="Won"/></td>
                                    </tr>
                                </xsl:if>
                            </xsl:when>

                            <!-- putting the creating search queries for everyone -->

                            <xsl:when test="$winner = 'all' or ($winner != 'yes' and $winner != 'no' and $winner != 'all')">
                                <xsl:if test = "(contains(Category,$category) and contains(Year,$year) and contains(Nominee,$nominee) and contains(Info,$info))">
                                    <tr>
                                        <td><xsl:value-of select="Year"/></td>
                                        <td><xsl:value-of select="Category"/></td>
                                        <td><xsl:value-of select="Nominee"/></td>
                                        <td><xsl:value-of select="Info"/></td>
                                        <td><xsl:value-of select="Won"/></td>
                                    </tr>
                                </xsl:if>
                            </xsl:when>

                        </xsl:choose>
                    </xsl:for-each>
                </table>
                Create a new search Query
                <fieldset>
                    <input id="back-to-webpage" type="button" value="Create new query"
                                                onclick="window.location.href = 'http://titan.dcs.bbk.ac.uk/~mshala02/iwt-cs2/main.html'" />
                </fieldset>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

