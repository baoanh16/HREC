<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone">
		<div class="home-nav-wrapper">
			<h2 class="main-title">
				<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
			</h2>
			<div class="home-nav">
				<div class="nav-title">Chuyên mục</div>
				<nav>
					<xsl:apply-templates select="Zone" mode="Link"></xsl:apply-templates>
				</nav>
				<select>
					<xsl:apply-templates select="Zone" mode="Select"></xsl:apply-templates>
				</select>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Zone" mode="Link">
		<a>
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
			<xsl:attribute name="value">
				<xsl:value-of disable-output-escaping="yes" select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
		</option>
	</xsl:template>
</xsl:stylesheet>