<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<xsl:if test="count(/BannerList/Banner) > 0">
			<div class="container">
				<xsl:apply-templates select="/BannerList/Banner">
					<xsl:with-param select="/BannerList/ZoneTitle" name="rootTitle"></xsl:with-param>
				</xsl:apply-templates>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Banner">
		<xsl:param name="rootTitle"></xsl:param>
		<div class="banner-item" data-bg="./img/banner/1.jpg">
			<xsl:attribute name="data-bg">
				<xsl:value-of disable-output-escaping="yes" select="ImageUrl"></xsl:value-of>
			</xsl:attribute>
			<h1>
				<xsl:value-of disable-output-escaping="yes" select="$rootTitle"></xsl:value-of>
			</h1>
		</div>
	</xsl:template>
</xsl:stylesheet>