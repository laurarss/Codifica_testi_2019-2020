<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <!--Progetto per l'esame di Codifica di Testi, aa 2019/20
    Codifica di cartoline storiche della Grande Guerra
    A cura di: Laura Rossi mat 559715 e Silvia Bonaccorsi mat 560155 -->


    <!-- TEMPLATES -->
    <xsl:template match="/">        <!-- Principale root-->
        <html lang="ita">
            <head>
                <title>
                    <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
                <xsl:element name="meta">                    <!-- creazione elemento meta HTML -->
                    <xsl:attribute name="name">author</xsl:attribute>
                    <xsl:attribute name="content">
                        <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:respStmt/tei:persName[1]"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="meta">                    <!-- creazione elemento meta HTML -->
                    <xsl:attribute name="name">author</xsl:attribute>
                    <xsl:attribute name="content">
                        <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:respStmt/tei:persName[2]"/>
                    </xsl:attribute>
                </xsl:element>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
                <link href="stile.css" rel="stylesheet" />
                <!-- collegamento a foglio di stile css -->
                <script src="function.js" />
                <!-- collegamento a javascript -->
            </head>

            <body>
                <header>
                    <xsl:comment>    
                            Progetto per l'esame di Codifica di Testi, aa 2019/20.
                            Codifica di cartoline storiche della Grande Guerra.
                    </xsl:comment>
                    <h1>
                        <xsl:value-of select="//tei:titleStmt/tei:title"/>
                    </h1>
                    <xsl:element name="h4">
                        <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:respStmt/tei:resp"/>
                        <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:respStmt/tei:persName[@xml:id='LR']"/>
e
                        <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:respStmt/tei:persName[@xml:id='SB']"/>
                    </xsl:element>
                </header>

                <!-- Chiamata al template title e immagini prima cartolina-->
                <xsl:apply-templates select="/tei:TEI/tei:TEI[1]"/>
                <!-- Bottone 1 -->
                <xsl:element name="div">
                    <xsl:attribute name="style">text-align: center</xsl:attribute>
                    <button id="button-C025" onclick="mostraInfo(event)"> Scopri di più </button>
                </xsl:element>
                <xsl:element name="div">
                    <xsl:attribute name="id">text-C025</xsl:attribute>
                    <xsl:attribute name="class">isHidden</xsl:attribute>
                    <p>
                        <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:sourceDesc//tei:msDesc/tei:msContents/tei:summary"/>
                    </p>
                    <p>
                        <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:sourceDesc//tei:msDesc/tei:physDesc//tei:material"/>
:                        <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:sourceDesc//tei:msDesc/tei:physDesc//tei:height"/>
                            x <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:sourceDesc//tei:msDesc/tei:physDesc//tei:width"/>
 cm
                    </p>
                    <p>
                        <strong>Numero identificativo per l'archivio: </strong>
                        <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:sourceDesc//tei:msDesc/tei:msIdentifier//tei:idno"/>
                    </p>
                    <p>
                        <strong> Conservazione: </strong>
                        <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:distributor" />
                    </p>
                    <xsl:apply-templates select="tei:TEI//tei:sourceDesc" />
                </xsl:element>
                <div class="cart">
                    <xsl:apply-templates select="//tei:surface[@xml:id='c025F']/tei:graphic"/>
                    <xsl:apply-templates select="//tei:surface[@xml:id='c025R']/tei:graphic"/>
                </div>
                <!-- Creazione tabella CARTOLINA 025-->
                <xsl:element name="table">
                    <xsl:element name="tr">
                        <th>
                            <h2> Info cartolina </h2>
                        </th>
                        <th>
                            <h2> Testo scritto </h2>
                        </th>
                        <th>
                            <h2> Elementi tipografici </h2>
                        </th>
                    </xsl:element>
                    <xsl:element name="tr">
                        <td>
                            <p class="manoscritto">
                                <xsl:attribute name="id">text-loch</xsl:attribute>
                                <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:text[@xml:id='descCarto']//tei:div[@facs='#loch']" />
                            </p>
                            <p class="manoscritto">
                                <xsl:attribute name="id">text-desc025</xsl:attribute>
                                <xsl:value-of select="/tei:TEI/tei:TEI[1]//tei:title[@facs='#desc025']"/>
                                <br/>
Traduzione in italiano:<br/>
                            <xsl:value-of select="/tei:TEI/tei:TEI[1]//tei:note[@xml:id='itdesc025']"/>
                        </p>
                    </td>
                    <!-- Testo cartolina -->
                    <td>
                        <xsl:attribute name="style">border-left: 1px solid #453c31;</xsl:attribute>
                        <p>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[@xml:id='C025']//tei:text[@xml:id='textC025']" />
                        </p>
                        <xsl:apply-templates select="/tei:TEI/tei:TEI[@xml:id='C025']//tei:text[@xml:id='address25']" />
                    </td>
                    <!-- Comparsa -->
                    <td>
                        <xsl:attribute name="style">border-left: 1px solid #453c31;</xsl:attribute>
                        <xsl:attribute name="class">content_tooltip</xsl:attribute>
                        <p>
                            <xsl:attribute name="id">text-timbroArrivo</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:text[@xml:id='timbri']//tei:stamp[@facs='#timbroArrivo']"/>
                            <br/>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:sourceDesc//tei:date[@xml:id='postcard_date']"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-timbroInvio</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:text[@xml:id='timbri']//tei:stamp[@facs='#timbroInvio']"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-addOnly</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:text[@xml:id='timbri']//tei:stamp[@facs='#addOnly']"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-stampLeft</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:text//tei:note[@facs='#stampLeft']"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-impronta</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:sourceDesc//tei:note[@facs='#impronta']"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-titolo</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:text//tei:title[@facs='#titolo']"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-sottoTitolo</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:text//tei:title[@facs='#sottoTitolo']"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-print</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:sourceDesc//tei:pubPlace/tei:note[@facs='#print']"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-stampSxBottom</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:sourceDesc//tei:note[@facs='#stampSxBottom']"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-num25</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:value-of select="/tei:TEI/tei:TEI[1]//tei:text//tei:div[@facs='#num25']"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-diritti</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            Editore cartolina: <xsl:value-of select="/tei:TEI/tei:TEI[1]//tei:sourceDesc//tei:publisher[@facs='#diritti']"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-macchia</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:sourceDesc//tei:note[@facs='#macchia']"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-centralspot</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[1]//tei:sourceDesc//tei:note[@facs='#centralspot']"/>
                        </p>
                    </td>
                </xsl:element>
            </xsl:element>
            <!-- chiamata al template ed alle immagini seconda cartolina -->
            <xsl:apply-templates select="/tei:TEI/tei:TEI[2]"/>
            <!-- Bottone 2 -->
            <xsl:element name="div">
                <xsl:attribute name="style">text-align: center</xsl:attribute>
                <button id="button-C035" onclick="mostraInfo(event)"> Scopri di più </button>
            </xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="id">text-C035</xsl:attribute>
                <xsl:attribute name="class">isHidden</xsl:attribute>
                <p>
                    <xsl:apply-templates select="/tei:TEI/tei:TEI[2]//tei:sourceDesc//tei:msDesc/tei:msContents/tei:summary"/>
                </p>
                <p>
                    <xsl:apply-templates select="/tei:TEI/tei:TEI[2]//tei:sourceDesc//tei:msDesc/tei:physDesc//tei:material"/>
:                    <xsl:apply-templates select="/tei:TEI/tei:TEI[2]//tei:sourceDesc//tei:msDesc/tei:physDesc//tei:height"/>
                            x <xsl:apply-templates select="/tei:TEI/tei:TEI[2]//tei:sourceDesc//tei:msDesc/tei:physDesc//tei:width"/>
 cm
                </p>
                <p>
                    <strong>Numero identificativo per l'archivio: </strong>
                    <xsl:apply-templates select="/tei:TEI/tei:TEI[2]//tei:sourceDesc//tei:msDesc/tei:msIdentifier//tei:idno"/>
                </p>
                <p>
                    <strong> Conservazione: </strong>
                    <xsl:apply-templates select="/tei:TEI/tei:TEI[2]//tei:distributor" />
                </p>

                <xsl:apply-templates select="tei:TEI//tei:sourceDesc" />
            </xsl:element>
            <div class="cart">
                <xsl:apply-templates select="//tei:surface[@xml:id='c035F']/tei:graphic"/>
                <xsl:apply-templates select="//tei:surface[@xml:id='c035R']/tei:graphic"/>
            </div>

            <!-- CREAZIONE TABELLA CARTOLINA 035 -->
            <xsl:element name="table">
                <xsl:element name="tr">

                    <th>
                        <h2> Testo </h2>
                    </th>
                    <th>
                        <h2> Elementi tipografici </h2>
                    </th>
                </xsl:element>
                <xsl:element name="tr">

                    <td>
                        <xsl:apply-templates select="/tei:TEI/tei:TEI[@xml:id='C035']//tei:text[@xml:id='textC035']" />
                    </td>
                    <td>
                        <xsl:attribute name="style">border-left: 1px solid #453c31;</xsl:attribute>
                        <xsl:attribute name="class">content_tooltip</xsl:attribute>
                        <p>
                            <xsl:attribute name="id">text-filfranco</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[@xml:id='C035']//tei:stamp[@facs='#filfranco']"/>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[@xml:id='C035']//tei:date[@xml:id='noDate']"/>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[@xml:id='C035']//tei:date[@ref=noDate]"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-num35</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[@xml:id='C035']//tei:text[@xml:id='textC035']//tei:div[@facs='#num35']"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-prop</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            Editore cartolina:<xsl:apply-templates select="/tei:TEI/tei:TEI[2]//tei:sourceDesc//tei:publisher"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-minitimbro</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[@xml:id='C035']//tei:stamp[@facs='#minitimbro']"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-arle</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[@xml:id='C035']//tei:sourceDesc//tei:p[@facs='#arle']"/>
                        </p>
                        <p>
                            <xsl:attribute name="id">text-signarle</xsl:attribute>
                            <xsl:attribute name="class">isHidden</xsl:attribute>
                            <xsl:apply-templates select="/tei:TEI/tei:TEI[@xml:id='C035']//tei:sourceDesc//tei:note[@facs='#signarle']"/>
                        </p>
                    </td>
                </xsl:element>
            </xsl:element>

            <!-- TABELLA PER FOOTER-->
            <footer>
                <table>
                    <hr />
                    <tr>
                        <th> Pubblicazione </th>
                        <th> Ente di appartenenza </th>
                        <th> Curatori </th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher/tei:orgName" />
                        </td>
                        <td>
                            <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:distributor/tei:orgName" />
                        </td>
                        <td>
                            <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt[2]/tei:resp" />
: 
                            <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt[2]/tei:name[@xml:id='TC']" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <xsl:value-of select="//tei:editionStmt/tei:respStmt[3]/tei:resp" />
: 

                            <xsl:value-of select="//tei:editionStmt/tei:respStmt[3]/tei:name[@xml:id='GP']" />
 e 

                            <xsl:value-of select="//tei:editionStmt/tei:respStmt[3]/tei:name[@xml:id='ES']" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <xsl:value-of select="//tei:editionStmt/tei:respStmt[4]/tei:resp" />
: 

                            <xsl:value-of select="//tei:editionStmt/tei:respStmt[4]/tei:name[@xml:id='MR']" />
                        </td>
                    </tr>
                </table>
            </footer>

        </body>
    </html>
</xsl:template>

<xsl:template match="/tei:TEI/tei:TEI">
    <div>
        <xsl:element name="h2">
            <xsl:choose>
                <xsl:when test="./@xml:id='C025'">
                    <xsl:value-of select="./tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </xsl:when>
                <xsl:when test="./@xml:id='C035'">
                    <xsl:value-of select="./tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </xsl:when>
            </xsl:choose>
        </xsl:element>
    </div>
</xsl:template>

<!-- IMMAGINI CARTOLINE CON ZONE -->
<xsl:template match="//tei:surface[@xml:id='c025F']/tei:graphic">
    <div class="img_container">
        <img id="c025F" src="{@url}" class="img_size"></img>
        <svg class="img_size overlay" viewBox="0 0 600 379">
            <xsl:for-each select="../tei:zone">
                <xsl:apply-templates select="."/>
            </xsl:for-each>
        </svg>
    </div>
</xsl:template>

<xsl:template match="//tei:surface[@xml:id='c025R']/tei:graphic">
    <div class="img_container">
        <img id="c025R" src="{@url}" class="img_size" usemap="#c025R">
        </img>
        <svg class="img_size overlay" viewBox="0 0 600 379">
            <xsl:for-each select="../tei:zone">
                <xsl:apply-templates select="."/>
            </xsl:for-each>
        </svg>
    </div>
</xsl:template>

<xsl:template match="//tei:surface[@xml:id='c035F']/tei:graphic">
    <div class="img_container">
        <img id="c035F" src="{@url}"></img>
        <svg class="overlay" viewBox="0 0 379 600">
            <xsl:for-each select="../tei:zone">
                <xsl:apply-templates select="."/>
            </xsl:for-each>
        </svg>
    </div>
</xsl:template>

<xsl:template match="//tei:surface[@xml:id='c035R']/tei:graphic">
    <div class="img_container">
        <img id="c035R" src="{@url}" class="img_size" />
        <svg id="c035R" class="img_size overlay" viewBox="0 0 600 379">
            <xsl:for-each select="../tei:zone">
                <xsl:apply-templates select="."/>
            </xsl:for-each>
        </svg>
    </div>
</xsl:template>

<!-- TEMPLATE FONTI CARTOLINA -->
<!-- impostare con bottone javascript-->
<xsl:template match="tei:TEI//tei:sourceDesc">
    <xsl:for-each select="./tei:listPerson/tei:person[@xml:id='auth_GC']">
        <h2> Mittente </h2>
        <h3>
            <xsl:value-of select="./tei:persName"/>
        </h3>
        <p>Sesso: <xsl:value-of select="./tei:sex"/>
        </p>
        <p>Nazionalità: <xsl:value-of select="./tei:nationality"/>
        </p>
        <xsl:if test="./tei:langKnowledge">
            <p>Lingua: <xsl:value-of select="./tei:langKnowledge"/>
            </p>
        </xsl:if>
    </xsl:for-each>
    <xsl:for-each select="./tei:listPerson/tei:person[@xml:id='Oliva']">
        <h2> Destinatario </h2>
        <h3>
            <xsl:value-of select="./tei:persName"/>
        </h3>
        <p>Sesso: <xsl:value-of select="./tei:sex"/>
        </p>
        <p>Nazionalità: <xsl:value-of select="./tei:nationality"/>
        </p>
        <xsl:if test="./tei:langKnowledge">
            <p>Lingua: <xsl:value-of select="./tei:langKnowledge"/>
            </p>
        </xsl:if>
    </xsl:for-each>
</xsl:template>

<!-- CARTOLINA 025-->
<!-- CREARE UNA CHOOSE CON MATCH=//TEXT -->
<!--Trascrizione testo righe cartolina + id con text-<nomepolygon> per collegare eventi di evidenziazione riga-->
<xsl:template match="/tei:TEI/tei:TEI[@xml:id='C025']//tei:text[@xml:id='textC025']">
    <p>
        <xsl:attribute name="id">text-date</xsl:attribute>
        <xsl:attribute name="class">manoscritto</xsl:attribute>
        <xsl:value-of select=".//tei:opener/tei:dateline[@facs='#date']" />
    </p>
    <p>
        <xsl:attribute name="id">text-riga1</xsl:attribute>
        <xsl:attribute name="class">manoscritto</xsl:attribute>
        <xsl:value-of select="//tei:p[@facs='#riga1']" />
    </p>
    <p>
        <xsl:attribute name="id">text-riga2</xsl:attribute>
        <xsl:attribute name="class">manoscritto</xsl:attribute>
        <xsl:value-of select="//tei:closer/tei:salute[@facs='#riga2']"/>
    </p>
    <p>
        <xsl:attribute name="id">text-sign</xsl:attribute>
        <xsl:attribute name="class">manoscritto</xsl:attribute>
        <xsl:value-of select="//tei:closer/tei:signed[@facs='#sign']" />
    </p>
</xsl:template>
<!-- indirizzo destinatario cartolina 025 -->
<xsl:template match="/tei:TEI/tei:TEI[@xml:id='C025']//tei:text[@xml:id='address25']">
    <p>
        <xsl:attribute name="id">text-to</xsl:attribute>
        <xsl:attribute name="class">manoscritto</xsl:attribute>
        <xsl:value-of select=".//tei:addrLine[@facs='#to']" />
    </p>
    <p>
        <xsl:attribute name="id">text-destinatario</xsl:attribute>
        <xsl:attribute name="class">manoscritto</xsl:attribute>
        <xsl:value-of select=".//tei:addrLine[@facs='#destinatario']" />
    </p>
    <p>
        <xsl:attribute name="id">text-address</xsl:attribute>
        <xsl:attribute name="class">manoscritto</xsl:attribute>
        <xsl:value-of select=".//tei:street"/>
    </p>
    <p>
        <xsl:attribute name="id">text-place</xsl:attribute>
        <xsl:attribute name="class">manoscritto</xsl:attribute>
        <xsl:value-of select=".//tei:addrLine[@facs='place']" />
    </p>
</xsl:template>

<!-- CARTOLINA 035 -->
<!--Trascrizione testo righe cartolina + id con text-<nomepolygon> per collegare eventi di evidenziazione riga-->
<xsl:template match="/tei:TEI/tei:TEI[@xml:id='C035']//tei:text[@xml:id='textC035']">
    <xsl:element name="p">
        <xsl:attribute name="id">
            <xsl:variable name="facs">
                <xsl:value-of select="substring-after(.//tei:div//tei:salute/@facs, '#')"/>
            </xsl:variable>
            <xsl:value-of select="concat('text-', $facs)"/>
        </xsl:attribute>
        <xsl:attribute name="class">manoscritto</xsl:attribute>
        <xsl:value-of select=".//tei:salute[@facs='#carissima']"/>
    </xsl:element>
    <xsl:choose>
        <xsl:when test=".//tei:div">
            <xsl:for-each select="//tei:p/tei:s">
                <xsl:element name="p">
                    <xsl:attribute name="id">
                        <xsl:variable name="facs">
                            <xsl:value-of select="substring-after(./@facs, '#')"/>
                        </xsl:variable>
                        <xsl:value-of select="concat('text-', $facs)"/>
                    </xsl:attribute>
                    <xsl:attribute name="class"> manoscritto </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:for-each>
        </xsl:when>
    </xsl:choose>
    <xsl:element name="p">
        <xsl:attribute name="id">
            <xsl:variable name="facs">
                <xsl:value-of select="substring-after(.//tei:closer//@facs, '#')"/>
            </xsl:variable>
            <xsl:value-of select="concat('text-', $facs)"/>
        </xsl:attribute>
        <xsl:value-of select=".//tei:salute[@facs='#saluti']"/>
        <br />
        <xsl:value-of select=".//tei:postscript[@facs='#saluti']"/>
    </xsl:element>
</xsl:template>

<!--Template per le aree(poligoni) dell'img ed eventi loro collegati-->
<xsl:template match="tei:zone">

    <xsl:element name="polygon">

        <xsl:attribute name="id">
            <xsl:value-of select="./@xml:id"/>
        </xsl:attribute>

        <xsl:attribute name="class">
            area
        </xsl:attribute>

        <!-- aggiungi evento mostra elementi tooltip -->
        <xsl:if test="(./@xml:id ='signarle') or (./@xml:id ='minitimbro') or (./@xml:id ='centralspot') or (./@xml:id ='macchia') or (./@xml:id ='arle') or(./@xml:id ='diritti') or (./@xml:id ='prop') or (./@xml:id ='num35') or (./@xml:id ='stampSxBottom') or (./@xml:id ='addOnly') or (./@xml:id ='filfranco') or (./@xml:id ='timbroArrivo') or (./@xml:id = 'timbroInvio') or (./@xml:id ='num25') or (./@xml:id ='stampLeft')or (./@xml:id ='impronta') or (./@xml:id ='titolo')or (./@xml:id ='sottoTitolo')or (./@xml:id ='print')">
            <xsl:attribute name="onclick">
                    mostraInfoTooltip(event)
            </xsl:attribute>
        </xsl:if>

        <!-- aggiungi evento mouse enter mouse leave -->
        <xsl:if test="not((./@xml:id ='signarle') or (./@xml:id ='minitimbro') or (./@xml:id ='centralspot') or (./@xml:id ='macchia') or (./@xml:id ='arle') or (./@xml:id ='diritti') or (./@xml:id ='prop') or (./@xml:id ='num35') or (./@xml:id ='stampSxBottom') or (./@xml:id ='addOnly') or (./@xml:id ='filfranco') or (./@xml:id ='timbroArrivo') or (./@xml:id = 'timbroInvio') or (./@xml:id ='num25') or (./@xml:id ='stampLeft')or (./@xml:id ='impronta')or (./@xml:id ='titolo')or (./@xml:id ='sottoTitolo')or (./@xml:id ='print'))">
            <xsl:attribute name="onmouseenter">
                    evidenziaRiga(event) 
            </xsl:attribute>
            <xsl:attribute name="onmouseleave">
                    togliEvidenziazioneRiga(event) 
            </xsl:attribute>
        </xsl:if>

        <!-- aggiunta attributo points con coordinate dei points delle zones xml-->
        <xsl:attribute name="points">
            <xsl:value-of select="./@points"/>
        </xsl:attribute>

    </xsl:element>

</xsl:template>

</xsl:stylesheet>
