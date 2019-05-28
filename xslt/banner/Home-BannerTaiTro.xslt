<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Banner">
		<div class="banner-item">
			<xsl:attribute name="data-bg">
				<xsl:value-of disable-output-escaping="yes" select="ImageUrl"></xsl:value-of>
			</xsl:attribute>
			<div class="imgbox">
				<img class="lazyload">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</img>
			</div>
			<div class="content">
				<h3><xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of></h3>
				<p><xsl:value-of disable-output-escaping="yes" select="Description"></xsl:value-of></p>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>