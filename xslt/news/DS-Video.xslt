<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="gallery-wrapper">
			<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<xsl:if test="position()=1">
			<xsl:text disable-output-escaping="yes">
				&lt;div class="home-7-row"&gt;&lt;div class="col-gallery big"&gt;
			</xsl:text>
		</xsl:if>
		<xsl:if test="position()=2">
			<xsl:text disable-output-escaping="yes">
				&lt;div class="col-gallery side"&gt;&lt;div class="home-7-row"&gt;
			</xsl:text>
		</xsl:if>
		<xsl:if test="position()=6">
			<xsl:text disable-output-escaping="yes">
				&lt;div class="home-7-row"&gt;&lt;div class="col-gallery side"&gt;&lt;div class="home-7-row"&gt;
			</xsl:text>
		</xsl:if>
		<xsl:if test="position()=10">
			<xsl:text disable-output-escaping="yes">
				&lt;div class="col-gallery big"&gt;
			</xsl:text>
		</xsl:if>
		<div class="gallery-item">
			<article>
				<div class="imgbox">
					<xsl:attribute name="data-bg">
						<xsl:value-of disable-output-escaping="yes" select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<img class="lazyload">
						<xsl:attribute name="data-src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</div>
				<div class="info">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="data-fancybox">
							<xsl:text disable-output-escaping="yes">gallery_</xsl:text>
							<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
						</xsl:attribute>
						<img src="/Data/Sites/1/skins/default/img/btn_vid.png" />
						<h3>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</h3>
					</a>
				</div>
			</article>
			<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
		</div>
		<xsl:if test="position()=1">
			<xsl:text disable-output-escaping="yes">
				&lt;/div&gt;
			</xsl:text>
		</xsl:if>
		<xsl:if test="position()=5">
			<xsl:text disable-output-escaping="yes">
				&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;
			</xsl:text>
		</xsl:if>
		<xsl:if test="position()=9">
			<xsl:text disable-output-escaping="yes">
				&lt;/div&gt;&lt;/div&gt;
			</xsl:text>
		</xsl:if>
		<xsl:if test="position()=10 or position()=last()">
			<xsl:text disable-output-escaping="yes">
				&lt;/div&gt;&lt;/div&gt;
			</xsl:text>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>