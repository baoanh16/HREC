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
			<div class="home-nav">
				<div class="nav-title">Chuyên mục</div>
				<nav>
					<xsl:apply-templates select="/ZoneList/Zone" mode="Link"></xsl:apply-templates>
				</nav>
				<select>
					<xsl:apply-templates select="/ZoneList/Zone" mode="Select"></xsl:apply-templates>
				</select>
			</div>
		</div>
		<div class="home-7-row">
			<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
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
	<xsl:template match="Zone">
		<xsl:if test="position()=1">
			<div class="col-gallery big">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="News" mode="Image"></xsl:apply-templates>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</xsl:if>
		<xsl:if test="position()=2">
			<div class="col-gallery side">
				<div class="home-7-row">
					<xsl:apply-templates select="News" mode="Video"></xsl:apply-templates>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News" mode="Image">
		<xsl:if test="position() &lt; 6">
			<div class="swiper-slide">
				<div class="gallery-item">
					<article>
						<div class="imgbox" data-bg="./img/news/1.jpg">
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
						</div>
						<div class="info">
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="data-fancybox">
									<xsl:text disable-output-escaping="yes">gallery_</xsl:text>
									<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
								</xsl:attribute>
								<img src="/Data/Sites/1/skins/default/img/btn_img.png"/>
								<h3>
									<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
								</h3>
							</a>
							<!-- <a>
								<xsl:attribute name="href">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="data-fancybox">
									<xsl:text disable-output-escaping="yes">gallery_</xsl:text>
									<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
								</xsl:attribute>
							</a> -->
						</div>
						<div class="d-none">
							<xsl:apply-templates select="NewsImages">
								<xsl:with-param select="position()" name="Position"></xsl:with-param>
							</xsl:apply-templates>
						</div>
					</article>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="NewsImages">
		<xsl:param name="Position"></xsl:param>
		<xsl:if test="position()&gt;2">
			
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="ImageUrl"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="data-fancybox">
				<xsl:text disable-output-escaping="yes">gallery_</xsl:text>
				<xsl:value-of disable-output-escaping="yes" select="$Position"></xsl:value-of>
			</xsl:attribute>
		</a>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News" mode="Video">
		<xsl:if test="position()&lt;5">
			<div class="gallery-item">
				<article>
					<div class="imgbox">
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
					</div>
					<div class="info">
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="BriefContent"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="data-fancybox">
								<xsl:text disable-output-escaping="yes">gallery_video_</xsl:text>
								<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
							</xsl:attribute>
							<img src="/Data/Sites/1/skins/default/img/btn_vid.png"/>
							<h3>
								<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							</h3>
						</a>
						<!-- <a>
							<xsl:attribute name="href">
								<xsl:value-of select="BriefContent"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="data-fancybox">
								<xsl:text disable-output-escaping="yes">gallery_video_</xsl:text>
								<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
							</xsl:attribute>
						</a> -->
					</div>
				</article>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>