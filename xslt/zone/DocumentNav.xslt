<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<h2 class="page-title">
			<xsl:value-of disable-output-escaping="yes" select="/ZoneList/Title"></xsl:value-of>
		</h2>
		<div class="row">
			<div class="col-12 document-nav">
				<h4>Xem theo</h4>
				<select>
					<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
				</select>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Zone">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of disable-output-escaping="yes" select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
		</option>
	</xsl:template>
</xsl:stylesheet>