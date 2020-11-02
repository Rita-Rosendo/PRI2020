<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/" >
        <xsl:result-document href="arqsite/index.html" >
            <html>
                <head>
                    <title> Arqueossítios do NW português </title>
                </head>
                <body style="background:#e6ffff">
                    <h3> Índice de Arqueossítios </h3>
                    <ol>
                        <xsl:apply-templates mode="indice" select="//ARQELEM" >
                            <xsl:sort select="CONCEL" ></xsl:sort>
                        </xsl:apply-templates>
                    </ol>
                </body>
            </html>
            
        </xsl:result-document>
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Templates para o índice -->
    
    <xsl:template match="ARQELEM" mode="indice" >
        <li>
            <a name="i{generate-id()}"/>
            <a href="{generate-id()}.html" >
                <xsl:value-of select="CONCEL"/>
                -
                <xsl:value-of select="IDENTI"/>
            </a>
        </li>
    </xsl:template>
    
    <!-- Templates para o conteúdo -->
    
    <xsl:template match="ARQELEM">
        <xsl:result-document href="arqsite/{generate-id()}.html" >
            <html>
                <head>
                    <title> <xsl:value-of select="IDENTI"/>  </title>
                    <style>
                        hr {
                        width: 100%;
                        }
                    </style>
                </head>
                
                <body style="background:#e6ffff">
                    <xsl:if test="TIPO">
                        <p><b>Tipo: </b><xsl:value-of select="TIPO/@ASSUNTO"/></p>
                        <hr></hr>
                       
                    </xsl:if> 
                                       
                    
                    <xsl:if test="IDENTI">
                        <p><b>Nome:</b><xsl:value-of select="IDENTI"/></p>
                        <hr></hr>
                       
                    </xsl:if>
                    
                    <xsl:if test="DESCRI">
                        <p><b>Descrição:</b><xsl:value-of select="DESCRI/LIGA"/></p>
                        <hr></hr>
                    </xsl:if>
                    
                    <xsl:if test="CRONO">
                        <p><b>Cronologia:</b><xsl:value-of select="CRONO"/></p>
                        <hr></hr>
                    </xsl:if> 
                    
                    <xsl:if test="LUGAR">
                        <p><b>Lugar:</b><xsl:value-of select="LUGAR"/> </p>
                        <hr></hr>
                    </xsl:if>
                    
                    <xsl:if test="FREGUE">
                        <p><b>Freguesia:</b><xsl:value-of select="FREGUE"/></p>
                        <hr></hr>
                    </xsl:if>
                    
                    <xsl:if test="CONCEL">
                        <p><b>Concelho:</b><xsl:value-of select="CONCEL"/></p>
                        <hr></hr>
                    </xsl:if>                    
                    
                    <xsl:if test="CODADM">
                        <p><b>Codadmin:</b><xsl:value-of select="CODADM"/></p>
                        <hr></hr>
                    </xsl:if>
                    
                    
                    <xsl:if test="LATITU">
                        <p><b>Latitude:</b><xsl:value-of select="LATITU"/></p>
                        <hr></hr>
                     
                    </xsl:if>
                    
                    <xsl:if test="LONGIT">
                        <p><b>Longitude:</b><xsl:value-of select="LONGIT"/></p>
                        <hr></hr>
                       
                    </xsl:if>
                    
                    <xsl:if test="ALTITU">
                        <p><b>Altitude:</b><xsl:value-of select="ALTITU"/></p>
                        <hr></hr>
                    </xsl:if>
                    
                    <xsl:if test="ACESSO">
                        <p><b>Acesso:</b> <xsl:value-of select="ACESSO"/></p>
                        <hr></hr>
                           
                    </xsl:if>
                    
                    <xsl:if test="QUADRO">
                        <p><b>Quadro</b>: <xsl:value-of select="QUADRO"/> </p>
                        <hr></hr>
                    </xsl:if>
                   
                    <xsl:if test="TRAARQ">
                        <p><b>Traarq</b>: <xsl:value-of select="TRAARQ"/></p>
                        <hr></hr>
                    </xsl:if>
                    
                    <xsl:if test="DESARQ">
                        <p><b>Descrição arq</b>: <xsl:value-of select="DESARQ"/></p>
                        <hr></hr>
                    </xsl:if>
                    
                    <xsl:if test="INTERP">
                        <p><b>Interpretação</b>: <xsl:value-of select="INTERP"/></p> 
                        <hr></hr>
                    </xsl:if>
                    
                    <xsl:if test="DEPOSI">
                        <p><b>Museu</b>: <xsl:value-of select="DEPOSI"/></p>
                        <hr></hr>
                    </xsl:if>
                    
                    <xsl:if test="INTERE">
                        <p><b>Interesse</b>: <xsl:value-of select="INTERE"/></p>
                        <hr></hr>
                    </xsl:if>
                    
                    <xsl:if test="BIBLIO">
                        <b>Bibliografia</b>:
                        <ul>
                            <xsl:value-of select="BIBLIO"/> 
                            
                        </ul>
                    </xsl:if>
                    
                    <xsl:if test="AUTOR">
                        <p><b>Autor</b>: <xsl:value-of select="AUTOR"/></p>
                        <hr></hr>
                    </xsl:if>
                    
                    <xsl:if test="DATA">
                        <p><b>Data</b>: <xsl:value-of select="DATA"/></p>
                        <hr></hr>
                    </xsl:if>
      
                </body>
                <address>[<a href="index.html#i{generate-id()}">Voltar ao índice</a>] </address>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    
</xsl:stylesheet>