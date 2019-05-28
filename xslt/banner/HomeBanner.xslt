<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
			</div>
			<div class="swiper-pagination"></div>
		</div>
	</xsl:template>
	<xsl:template match="Banner">
		<div class="swiper-slide">
			<div class="imgbox">
				<xsl:attribute name="data-bg">
					<xsl:value-of disable-output-escaping="yes" select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<a>
					<xsl:if test="Url != ''">
						<xsl:attribute name="href">
							<xsl:value-of disable-output-escaping="yes" select="Url"></xsl:value-of>
						</xsl:attribute>
					</xsl:if>
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
						<xsl:if test="Url != ''">
							<xsl:attribute name="href">
								<xsl:value-of disable-output-escaping="yes" select="Url"></xsl:value-of>
							</xsl:attribute>
						</xsl:if>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					</a>
				</h2>
				<a class="btn-view">
					<xsl:if test="Url != ''">
						<xsl:attribute name="href">
							<xsl:value-of disable-output-escaping="yes" select="Url"></xsl:value-of>
						</xsl:attribute>
					</xsl:if>
					<img src="/Data/Sites/1/skins/default/img/slider_arrow_2.png"/>
				</a>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>