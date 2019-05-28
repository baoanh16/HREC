<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/ZoneList/Zone">
			<xsl:with-param select="/NewsList/ModuleTitle" name="BlockBanner"></xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone">
		<xsl:param name="BlockBanner"></xsl:param>
		<xsl:if test="position()=1">
			<div class="content-wrapper data-bg lazyloaded">
				<xsl:attribute name="data-bg">
					<xsl:text disable-output-escaping="yes">/Data/Sites/1/skins/default/img/index/bg_1.jpg</xsl:text>
				</xsl:attribute>
				<h2 class="main-title">
					<xsl:value-of disable-output-escaping="yes" select="$BlockBanner"></xsl:value-of>
				</h2>
				<xsl:apply-templates select="News">
					<xsl:with-param select="Url" name="BlockUrl"></xsl:with-param>
				</xsl:apply-templates>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News">
		<xsl:param name="BlockUrl"></xsl:param>
		<div class="row no-gutters">
			<div class="col-lg-8">
				<div class="title">
					<h3>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					</h3>
					<a class="btn-link" href="#">
						<xsl:attribute name="href">
							<xsl:value-of disable-output-escaping="yes" select="$BlockUrl"></xsl:value-of>
						</xsl:attribute>
						<span>Về chúng tôi</span>
						<span class="mdi mdi-arrow-right"></span>
					</a>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="description">
					<p>
						<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
					</p>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>