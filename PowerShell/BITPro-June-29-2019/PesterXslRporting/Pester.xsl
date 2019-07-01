<!DOCTYPE html[]>
<!-- <?xml version="1.0" encoding="iso-8859-1"?>-->
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="X-UA-Compatible" />
                <style>
            table {
                border: 1px solid white;
            }

            .th {
                /* background-color:#a6caf0;*/
                background-color: #0B0B61;
                color: white;
                font-size: 15pt;
                border-radius: 10px;
                font-weight: bold;
                text-align: center;
                height: 30pt;
            }

            .testcase {
                text-align: left;
                height: 10pt;
                border-radius: 10px;

            }
            td {
                text-align: center;
                height: 10pt;
                border-radius: 10px;
                vertical-align: center

            }

            tr:nth-child(even) {
                background-color: lightgray
            }

           .testpass {
                text-align: center;
                height: 10pt;
                border-radius: 10px  ;
                color: green;
                vertical-align: center
           }

           .testfail {
                text-align: center;
                height: 10pt;
                border-radius: 10px  ;
                color: red;
                vertical-align: center;

           }

            .header {
                align: center;
                color: navy;
                font-weight: bold;
                font-size: 20pt;
            }

            .hostNameStyle {
                font-size: 12pt;
                /*			overflow:hidden;*/
                font-weight: bold;
                /*background-color:#0000FF;*/
                color: black;
                border: 1px Black solid;
            }

            .note {
                font-weight: bold;
                text-align: center;
                background-color:yellow

            }

                </style>
            </head>
            <body>

                <xsl:variable name="nodename" select="//test-results/environment/@machine-name"/>
                <xsl:variable name="failures" select="//test-results/@failures"/>
                <p align="center" class="header">
         Sanity checks :
                    <xsl:if test="$failures &gt; 0">
                        <h style="color:red">Failed</h>
                        <p class="note">There are failed tests, please contact abc@example.com</p>
                    </xsl:if>
                    <xsl:if test="$failures = 0">
                        <h style="color:green">Passed</h>
                    </xsl:if>
                </p>

                <table align="center" width='1300'>
                    <tr>
                        <th width="500" class="th">Test name</th>
                        <th width="100" class="th">Test result</th>
                        <xsl:if test="$failures &gt; '0'">
                            <th class="th" width="400">Remarks</th>
                        </xsl:if>
                        <!-- <th width="100" class="th">Hot Fix</th> -->

                    </tr>

                    <!--<xsl:for-each select="//test-results/test-suite/results/test-suite/results/test-suite/results/test-case">-->
                    <xsl:for-each select="//test-case">
                        <xsl:variable name="description" select="@description" />
                        <xsl:variable name="result" select="@result" />
                        <xsl:variable name="time" select="@time" />
                        <xsl:variable name="remark" select="//test-case[@description=$description]/@label" />
                        <xsl:variable name="currenttestresult" select="//test-case[@description=$description]/@result" />

                        <tr>
                            <td class="testcase">
                                <xsl:value-of select="$description" />
                            </td>
                            <td >
                                <xsl:if test="$result='Success'">
                                    <xsl:attribute name="class">
                                        <xsl:value-of select="'testpass'"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="'&#10004;'" />
                                </xsl:if>
                                <xsl:if test="$result='Failure'">
                                    <xsl:attribute name="class">
                                        <xsl:value-of select="'testfail'"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="'&#10008;'" />
                                </xsl:if>
                                <xsl:if test="$result='Ignored'">
                                    <xsl:value-of select="'ignored test'" />
                                </xsl:if>
                            </td>
                            <xsl:if test="$failures &gt; '0'">
                                <td>
                                    <xsl:if test="$currenttestresult='Success'">
                                        <xsl:value-of select="'good'"/>
                                    </xsl:if>
                                    <xsl:if test="$currenttestresult='Failure'">
                                        <xsl:value-of select="$remark"/>
                                    </xsl:if>
                                </td>
                            </xsl:if>
                            <!-- <td><a href="www.google.com"> HotFix </a></td> -->
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>