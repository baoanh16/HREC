<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<h2 class="sub-title">
			<xsl:value-of disable-output-escaping="yes" select="/NewsList/ModuleTitle"></xsl:value-of>
		</h2>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
			</div>
			<div class="swiper-pagination"></div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="swiper-slide">
			<div class="imgbox" data-bg="./img/index/2.jpg">
				<xsl:attribute name="data-bg">
					<xsl:value-of disable-output-escaping="yes" select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<img class="swiper-lazy">
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</a>
			</div>
			<div class="content">
				<h2>
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
				</h2>
				<a class="btn-view" href="#">
					<xsl:attribute name="href">
						<xsl:value-of disable-output-escaping="yes" select="Url"></xsl:value-of>
					</xsl:attribute>
					<img src="/Data/Sites/1/skins/default/img/slider_arrow_2.png" alt=""/>
				</a>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>