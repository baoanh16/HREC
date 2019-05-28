<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="faq-list">
			<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<article class="faq-item">
			<div class="title">
				<h3><xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of></h3>
				<span class="mdi-menu-down mdi"></span>
			</div>
			<div class="info">
			<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
			<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
			</div>
		</article>
	</xsl:template>
</xsl:stylesheet>