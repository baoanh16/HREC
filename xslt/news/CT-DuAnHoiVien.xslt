<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="project-detail">
			<div class="detail-container">
				<div class="row no-gutters">
					<div class="col-lg-8">
						<div class="imgbox">
							<xsl:apply-templates select="/NewsDetail/NewsImages"></xsl:apply-templates>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="textbox">
							<h1>
								<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/Title"></xsl:value-of>
								<xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
							</h1>
							<div class="table-responsive">
								<table>
									<xsl:apply-templates select="/NewsDetail/NewsAttributes"></xsl:apply-templates>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="detail-container">
				<h3 class="full-content-title">Chi tiết dự án</h3>
				<div class="full-content">
					<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullContent"></xsl:value-of>
				</div>
				<hr/>
			</div>
			<div class="detail-container">
				<h2 class="page-title">Dự án khác</h2>
				<div class="swiper-container">
					<div class="swiper-nav">
						<div class="swiper-prev">
							<img src="/Data/Sites/1/skins/default/img/slider-prev-3.png"/>
						</div>
						<div class="swiper-next">
							<img src="/Data/Sites/1/skins/default/img/slider-next-3.png"/>
						</div>
					</div>
					<div class="swiper-wrapper">
						<xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="NewsImages">
		<xsl:if test="position()=1">
			<img class="lazyload" style="width: 100%">
				<xsl:attribute name="data-src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
			</img>
		</xsl:if>
	</xsl:template>
	<xsl:template match="NewsAttributes">
		<tr>
			<td>
				<xsl:if test="position()=1">
					<span class="mdi mdi-account-outline"></span>
				</xsl:if>
				<xsl:if test="position()=2">
					<span class="mdi mdi-account-multiple-outline"></span>
				</xsl:if>
				<xsl:if test="position()=3">
					<span class="mdi mdi-map-marker-outline"></span>
				</xsl:if>
				<xsl:if test="position()=4">
					<span class="mdi mdi-office-building"></span>
				</xsl:if>
				<xsl:if test="position()=5">
					<span class="mdi mdi-crop"></span>
				</xsl:if>
				<xsl:if test="position()=6"></xsl:if>
				<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
			</td>
			<td>
				<xsl:value-of disable-output-escaping="yes" select="Content"></xsl:value-of>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="NewsOther">
		<div class="swiper-slide">
			<article class="project-item">
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
						<img class="lazyload d-none">
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
				</div>
			</article>
		</div>
	</xsl:template>
</xsl:stylesheet>