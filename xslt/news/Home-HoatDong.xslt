<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="home-nav-wrapper">
			<h2 class="main-title">
				<xsl:value-of disable-output-escaping="yes" select="/ZoneList/ModuleTitle"></xsl:value-of>
			</h2>
			<xsl:apply-templates select="/ZoneList/Zone" mode="Nav"></xsl:apply-templates>
		</div>
		<div class="news-list clearfix">
			<xsl:apply-templates select="/ZoneList/Zone" mode="News"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="Zone" mode="News">
		<xsl:apply-templates select="News"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="News">
		<div class="news-3-item">
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">news-3-item big</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<article>
				<div class="imgbox">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
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
					</a>
				</div>
				<div class="info">
					<time>
						<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
					</time>
					<h3>
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</a>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					</h3>
					<p>
						<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
					</p>
				</div>
			</article>
		</div>
	</xsl:template>
	<xsl:template match="Zone" mode="Nav">
		<div class="home-nav">
			<div class="nav-title">Chuyên mục</div>
			<nav>
				<xsl:apply-templates select="Zone" mode="Link"></xsl:apply-templates>
			</nav>
			<select>
				<xsl:apply-templates select="Zone" mode="Select"></xsl:apply-templates>
			</select>
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