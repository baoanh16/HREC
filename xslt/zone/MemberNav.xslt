<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="news-tab-wrapper member">
			<div class="news-tab">
				<div class="tab-title">Chuyên mục</div>
				<nav>
					<xsl:apply-templates select="/ZoneList/Zone" mode="Link"></xsl:apply-templates>
				</nav>
				<select>
					<xsl:apply-templates select="/ZoneList/Zone" mode="Select"></xsl:apply-templates>
				</select>
			</div>
			<h2 class="page-title"><xsl:value-of disable-output-escaping="yes" select="/ZoneList/Title"></xsl:value-of></h2>
		</div>
	</xsl:template>
	<xsl:template match="Zone" mode="Link">
		<a>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
				<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="href">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
		</a>
	</xsl:template>
	<xsl:template match="Zone" mode="Select">
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