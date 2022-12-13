<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="html" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
    <!-- match con tutto il documento -->
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>
          <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']" />
        </title>
        <!--css-->
        <link rel="stylesheet" type="text/css" href="style.css" />

        <!--Font awesome -->
        <script src="https://kit.fontawesome.com/631a8dead6.js" crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      </head>
      <body>
        <!-- header nav bar-->
        <header id="header">
          <i class="fa-solid fa-bars"></i>
          <ul class="navbar">
            <li>
              <a href="#informazioni">Informazioni</a>
            </li>
            <li>
              <a href="#pagina11a">Pagina 11a</a>
            </li>
            <li>
              <a href="#pagina12">Pagina 12</a>
            </li>
            <li>
              <a href="#terminologia">Terminologia</a>
            </li>
            <li>
              <a href="#bibliografia">Bibliografia</a>
            </li>
            <li>
              <a href="#riferimenti">Riferimenti</a>
            </li>
          </ul>
        </header>
        <main>
          <!-- informazioni-->
          <section class="informazioni" id="info1">
            <div>
              <img src="immagini/fer.png" id="ferdi" />
            </div>
            <div class="info">
              <p>
                <xsl:apply-templates select="//tei:msContents" />
              </p>
            </div>

          </section>
          <!-- descrizione fisica-->
          <section class="informazioni" id="info2">
            <div>
              <img src="immagini/copertina.jpg" id="copertina" />
            </div>
            <div class="desc">
              <p>
                <xsl:apply-templates select="//tei:physDesc" />
              </p>
            </div>
          </section>
          <!-- storia-->
          <section class="informazioni" id="info3">
            <div>
              <img src="immagini/ginevra-svizzera.png" id="ginevra" />
            </div>
            <div class="storia">
              <p>
                <xsl:apply-templates select="//tei:history" />
              </p>
            </div>
          </section>
          <!-- Lista bottoni cancellazione, gap, aggiunte, correzioni, abbreviazioni, espansioni, termini, glottonimi, esempi linguistici, date-->
          <div id="lista_bottoni">
            <button type="button" id="cancellazioni">Cancellazioni</button>
            <button type="button" id="notReading">Gap</button>
            <button type="button" id="aggiunte">Aggiunte</button>
            <button type="button" id="correzioni">Correzioni</button>
            <button type="button" id="abbreviazioni">Abbreviazioni</button>

            <button type="button" id="termini">Termini</button>
            <button type="button" id="glottonimi">Glottonimi</button>
            <button type="button" id="linguistico">Esempio linguistico</button>
            <button type="button" id="date">Date</button>
          </div>
          <!-- sezione contenente l'immagine della pagina, il retro della pagina e il testo/traduzione-->
          <section id="pagina11a">
            <!--l'immagine è stata inserita qua, avendo sezioni distinte per le due pagine diverse-->
            <h1>Pagina 11a</h1>
            <div id="immagine11a">
              <div class="img">
                <xsl:element name="img">
                  <xsl:attribute name="src">
                    <xsl:value-of select="//tei:surface[@xml:id='P11aIntera']/tei:graphic/@url" />
                  </xsl:attribute>
                  <xsl:attribute name="id">containerFoto</xsl:attribute>
                  <!--avendo le immagini in due sezioni distinte, per la realizzazione della mappa è stato inserito in entrambe le sezioni per le pagine da mappare -->
                  <xsl:attribute name="usemap">
                    <xsl:value-of>#P11aIntera</xsl:value-of>
                  </xsl:attribute>
                </xsl:element>
                <xsl:apply-templates select="//tei:surface[@xml:id='P11aIntera']" />
              </div>
            </div>
            <button id="retro11a">Gira la pagina</button> <!--bottone per visualizzare il retro della pagina 11a -->
            <div id="imgretro" style="display: none">
              <xsl:element name="img">
                <xsl:attribute name="src">
                  <xsl:value-of select="//tei:surface[@xml:id='P11aRetro']/tei:graphic/@url" />
                </xsl:attribute>
                <xsl:attribute name="id">P11aRetro</xsl:attribute>
              </xsl:element>

            </div>

            <!--testo originale-->
            <div id="pag11a">


              <h3>Testo originale</h3>

              <xsl:apply-templates select="//tei:div[@n='11a']" />

            </div>
            <div class="traduzione">
              <h3 id="tradPag11a">Traduzione</h3>
              <p id="tradPag11a" style="display: none">
                <xsl:apply-templates select="//tei:div[@type= 'traduzionePagina11a']" />
              </p>

            </div>
            <button class="bottoneTraduzione">
              <!--bottone per visualizzare la traduzione del testo-->
              <span>Mostra Traduzione</span>
            </button>
          </section>
          <!-- sezione contenente l'immagine della pagina e il testo/traduzione-->
          <section id="pagina12">
            <h1 id="pag12">Pagina 12</h1>
            <div class="immagine12" id="img12">
              <!--immagine 12-->
              <div class="img">
                <xsl:element name="img">
                  <!--creiamo subito l'elemento immagine-->
                  <xsl:attribute name="src">
                    <xsl:value-of select="//tei:surface[@xml:id='P12Intera']/tei:graphic/@url" />
                  </xsl:attribute>
                  <!--creiamo l'attributo usemap da applicare sulla pagina 12-->
                  <xsl:attribute name="usemap">
                    <xsl:value-of>#P12Intera</xsl:value-of>
                  </xsl:attribute>
                </xsl:element>
                <xsl:apply-templates select="//tei:surface[@xml:id='P12Intera']" />
              </div>
            </div>

            <div class="pag12" id="pag12">
              <h3>Testo originale</h3> <!--testo originale del foglio 12-->

              <xsl:apply-templates select="//tei:div[@n='12']" />

            </div>
            <div class="traduzione">
              <h3 id="tradPag12">Traduzione</h3> <!--traduzione del foglio 12-->
              <p id="tradPag12" style="display: none">
                <xsl:apply-templates select="//tei:div[@type= 'traduzionePagina12']" />
              </p>

            </div>
            <button class="bottoneTraduzione">
              <span>Mostra Traduzione</span>
            </button>
          </section>

          <!--terminologia-->
          <section id="terminologia">
            <xsl:apply-templates select="//tei:back/tei:list[@type='terminologia']" />
          </section>
          <!--bibliografia-->
          <section id="bibliografia">
            <h2>Bibliografia</h2>
            <p>
              <xsl:apply-templates select="//tei:back/tei:listBibl" />
            </p>
          </section>
        </main>
        <footer id="xc">

          <h2>Riferimenti</h2>
          <p>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt" />
          </p>
          <!--javascript-->
          <script src="inter.js"></script>
        </footer>
      </body>

    </html>


  </xsl:template>
  <!--Templates applicati sopra-->

  <!--template caratteristiche-->
  <xsl:template match="tei:msContents">
    <h2>Informazioni</h2>
    <h3>Titolo: </h3>
    <p>
      <xsl:apply-templates select="//tei:msItem/tei:title" />
    </p>
    <br />
    <h3>Autore: </h3>
    <p>
      <xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author" />
    </p>
    <br />
    <h3>Lingua: </h3>
    <p>
      <xsl:value-of select="//tei:language" />
    </p>
    <br />
    <h3>Acquisizione: </h3>
    <p>
      <xsl:apply-templates select="//tei:settingDesc/tei:setting/tei:name" />
    </p>
    <br />
    <h3>Data: </h3>
    <p>
      <xsl:apply-templates select="//tei:settingDesc/tei:setting/tei:time" />
    </p>
    <br />
  </xsl:template>
  <!--template della descrizione fisica del documento-->
  <xsl:template match="tei:physDesc">
    <h2>Descrizione fisica</h2>
    <h3>Supporto: </h3>
    <p>
      <xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support" />
    </p>

    <h3>Quantità: </h3>
    <p>
      <xsl:apply-templates select="//tei:physDesc/tei:objectDesc/tei:supportDesc/tei:extent" />
    </p>

    <h3>Condizioni: </h3>
    <p>
      <xsl:apply-templates select="//tei:physDesc/tei:objectDesc/tei:supportDesc/tei:condition" />
    </p>

    <h3>Layout: </h3>
    <p>
      <xsl:apply-templates select="//tei:physDesc/tei:objectDesc/tei:layoutDesc/tei:layout/tei:p" />
    </p>

    <h3>Grafia: </h3>
    <p>
      <xsl:apply-templates select="//tei:physDesc/tei:typeDesc/tei:p" />
    </p>

    <h3>Mani: </h3>
    <p>
      <xsl:apply-templates select="//tei:physDesc/tei:handDesc/tei:p" />
    </p>
  </xsl:template>
  <!--templates storia editoriale-->
  <xsl:template match="tei:history">
    <h2>Storia</h2>
    <p>
      <xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:history/tei:origin/tei:p" />
    </p>
  </xsl:template>

  <!--template immagini con mappatura provare per le immagini a fare un for each.-->
  <!-- <xsl:template match="tei:facsimile">
    <xsl:for-each select="tei:surface">
      <xsl:element name="img">
        <xsl:attribute name="class">img</xsl:attribute>
        <xsl:attribute name="src">
          <xsl:value-of select="tei:graphic/@url" />
        </xsl:attribute>

        <xsl:attribute name="usemap">
          <xsl:value-of select="concat('#', @xml:id)" />
        </xsl:attribute>
      </xsl:element>
    </xsl:for-each>
  </xsl:template> -->

  <xsl:template match="tei:surface">
    <!--mappare l'immagine, template che matcha son surface-->


    <xsl:element name="map">
      <xsl:attribute name="name">
        <xsl:value-of select="@xml:id" />
      </xsl:attribute>
      <xsl:variable name="Width">
        <xsl:value-of select="concat(substring-before(tei:graphic/@width, 'px'), '')" />
      </xsl:variable>
      <xsl:variable name="ratio" select="500 div $Width" />
      <xsl:for-each select="tei:zone">
        <xsl:element name="area">
          <xsl:attribute name="shape">rect</xsl:attribute>
          <xsl:attribute name="coords">
            <xsl:value-of select="concat(@ulx*$ratio, ',', @uly*$ratio, ',', @lrx*$ratio, ',', @lry*$ratio)" />
          </xsl:attribute>
          <xsl:attribute name="id">
            <xsl:value-of select="@xml:id" />
          </xsl:attribute>
          <xsl:attribute name="href">##<xsl:value-of select="@xml:id" />
          </xsl:attribute>
        </xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>


  <!--template pericope-->
  <xsl:template match="tei:ab">
    <xsl:element name="br" />
    <h3>
      <xsl:element name="b">
        <xsl:attribute name="class">pericope</xsl:attribute>
        <br />
        Pericope
        <xsl:value-of select="@n" />
      </xsl:element>
    </h3>
    <xsl:apply-templates />
  </xsl:template>

  <!--template righe-->
  <xsl:template match="tei:lb">
    <xsl:element name="br" />

    <xsl:element name="b">
      <xsl:attribute name="id">
        <xsl:value-of select="@facs" />
      </xsl:attribute>
      <xsl:attribute name="class">numero</xsl:attribute>
      <xsl:value-of select="@n" />
    </xsl:element>

  </xsl:template>

  <!--templates bottoni-->
  <!--cancellazioni-->
  <xsl:template match="tei:del">
    <xsl:element name="span">
      <xsl:attribute name="class">del</xsl:attribute>
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>


  <!--testo non leggibile-->
  <xsl:template match="tei:gap">
    <xsl:element name="span">
      <xsl:attribute name="class">gap</xsl:attribute>
      ???
    </xsl:element>
  </xsl:template>


  <!--aggiunte-->
  <xsl:template match="tei:add">
    <xsl:element name="span">
      <xsl:attribute name="class">add</xsl:attribute>
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>


  <!--correzioni-->
  <xsl:template match="//tei:choice/tei:sic">
    <xsl:element name="span">
      <xsl:attribute name="class">sic</xsl:attribute>
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>

  <xsl:template match="//tei:choice/tei:corr">
    <xsl:element name="span">
      <xsl:attribute name="class">corr</xsl:attribute>
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>

  <!--abbreviazioni-->
  <xsl:template match="tei:abbr">
    <xsl:element name="span">
      <xsl:attribute name="class">abbr</xsl:attribute>
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>
  <!--espansioni-->
  <xsl:template match="tei:expan">
    <xsl:element name="span">
      <xsl:attribute name="class">expan</xsl:attribute>
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>


  <!--termini-->
  <xsl:template match="tei:term">
    <xsl:element name="span">
      <xsl:element name="a">
        <xsl:attribute name="class">term</xsl:attribute>
        <xsl:attribute name="ref">
          <xsl:value-of select="@ref" />
        </xsl:attribute>
        <xsl:apply-templates />
      </xsl:element>
    </xsl:element>
  </xsl:template>
  <!--glottonimi-->
  <xsl:template match="tei:lang">
    <xsl:element name="span">
      <xsl:attribute name="class">lang</xsl:attribute>
      <xsl:value-of select="." />
    </xsl:element>
  </xsl:template>
  <!--esempio linguistico-->
  <xsl:template match="tei:mentioned">
    <xsl:element name="span">
      <xsl:attribute name="class">mentioned</xsl:attribute>
      <xsl:apply-templates /> <!--si attiva ricorsivamente-->
    </xsl:element>
  </xsl:template>
  <!--date-->
  <xsl:template match="tei:date">
    <xsl:element name="span">
      <xsl:attribute name="class">date</xsl:attribute>
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>

  <!--template terminologia -->
  <xsl:template match="tei:list">
    <h2>Terminologia</h2>
    <xsl:for-each select="tei:label">
      <div class="label">
        <h3>
          <xsl:element name="france">
            <xsl:value-of select="tei:term[@xml:lang='fr']" />
            -
          </xsl:element>
          <xsl:element name="ita">
            <xsl:value-of select="tei:term[@xml:lang='it']" />
          </xsl:element>
        </h3>
      </div>
      <xsl:variable name="assocTerm">
        <xsl:value-of select="tei:term[@xml:lang='it']/@ref" />
      </xsl:variable>
      <xsl:for-each select="../tei:item/tei:gloss">
        <xsl:if test="@target = $assocTerm">
          <p>
            <xsl:value-of select="." />
          </p>
        </xsl:if>
      </xsl:for-each>
    </xsl:for-each>

  </xsl:template>

  <!--template bibliografia-->
  <xsl:template match="tei:listBibl">
    <xsl:element name="ul">
      <xsl:for-each select="tei:bibl">
        <xsl:element name="li">
          <p>
            <b>
              <xsl:value-of select="tei:title" />
            </b>
            <xsl:for-each select="tei:author/tei:persName">
              <i>
                <xsl:value-of select="." />
              </i>
              ,
            </xsl:for-each>
            <xsl:for-each select="tei:pubPlace/tei:placeName">
              <xsl:value-of select="." />
              ,
            </xsl:for-each>
            <xsl:value-of select="tei:publisher" />
            ,
            <xsl:value-of select="tei:date" />
          </p>
        </xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
  <!--edition statement-->
  <footer id="riferimenti">

    <xsl:template match="tei:editionStmt">
      <p>
        <xsl:value-of select="current()/tei:edition" />
      </p>
      <p>
        <xsl:for-each select="current()/tei:respStmt">
          <xsl:value-of select="." />
        </xsl:for-each>
      </p>

    </xsl:template>
  </footer>
</xsl:stylesheet> <!--da fare sull'xsl: mappatura sull'immagine-->