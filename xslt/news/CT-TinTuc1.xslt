<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="news-detail pd-60">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">
						<time>
							<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/CreatedDate"></xsl:value-of>
						</time>
						<h1>
							<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/Title"></xsl:value-of>
							<xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h1>
						<!-- <div class="brief-content"><p><xsl:value-of disable-output-escaping="yes" select="/NewsDetail/BriefContent"></xsl:value-of></p></div> -->
						<div class="full-content">
							<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullContent"></xsl:value-of>
						</div>
						<div class="social-share" style="display: flex; align-items: center">
							<div class="fb-like" data-href="https://preview2691.canhcam.com.vn" data-width="" data-layout="button_count" data-action="like" data-size="large" data-show-faces="false" data-share="true">
								<xsl:attribute name="data-href">
									<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullUrl"></xsl:value-of>
								</xsl:attribute>
							</div>
							<a class="twitter-share-button" href="https://twitter.com/intent/tweet?text=Hello%20world" data-size="large">
								<xsl:attribute name="href">
									<xsl:text disable-output-escaping="yes">https://twitter.com/intent/tweet?</xsl:text>
									<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullUrl"></xsl:value-of>
								</xsl:attribute>
								Tweet

							
							</a>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="news-other" style="margin-bottom: 30px">
							<h2 class="main-title">Sự kiện khác</h2>
							<xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
						</div>
						<div class="banner-list">
							<xsl:apply-templates select="/NewsDetail/Banner"></xsl:apply-templates>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Banner">
		<div class="banner-item">
		<a>
		<xsl:attribute name="href">
			<xsl:value-of select="Url"></xsl:value-of>
		</xsl:attribute>
		<xsl:attribute name="title">
			<xsl:value-of select="Title"></xsl:value-of>
		</xsl:attribute>
		<img class="lazyload" style="width: 100%">
			<xsl:attribute name="data-src">
				<xsl:value-of select="ImageUrl"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="alt">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
		</img>
		</a>
		</div>
	</xsl:template>
	<xsl:template match="NewsOther">
		<xsl:if test="position()&lt;6">
			<article class="news-other-item">
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
					</h3>
				</div>
			</article>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
