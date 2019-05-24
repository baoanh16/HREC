<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="about-nav-scroll">
			<div class="about-nav-scroll-wrapper">
				<div class="container">
					<ul>
						<xsl:apply-templates select="/ZoneList/Zone" mode="List"></xsl:apply-templates>
					</ul>
					<select>
						<option selected="selected">Chuyên mục</option>
						<xsl:apply-templates select="/ZoneList/Zone" mode="Select"></xsl:apply-templates>
					</select>
				</div>
			</div>
		</div>
		<div class="about-wrapper pt-60" id="about-1">
			<div class="container">
				<div class="page-title">
					<xsl:value-of disable-output-escaping="yes" select="/ZoneList/ZoneTitle"></xsl:value-of>
				</div>
			</div>
		</div>
		<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone" mode="List">
		<li>
			<a>
				<xsl:attribute name="href">
					<xsl:text disable-output-escaping="yes">#about-</xsl:text>
					<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
			</a>
		</li>
	</xsl:template>
	<xsl:template match="Zone" mode="Select">
		<option>
			<xsl:attribute name="value">
				<xsl:text disable-output-escaping="yes">#about-</xsl:text>
				<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="Zone">
		<xsl:choose>
			<xsl:when test="position()=1">
				<section class="about-1">
					<div class="container">
						<div class="content-wrapper">
							<xsl:attribute name="data-bg">
								<xsl:value-of disable-output-escaping="yes" select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<h2 class="main-title no-borders">
								<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							</h2>
							<xsl:apply-templates select="News" mode="News1"></xsl:apply-templates>
						</div>
					</div>
				</section>
			</xsl:when>
			<xsl:when test="position()=2">
				<section class="about-2 pd-60" id="about-2">
					<div class="container">
						<h2 class="sub-title no-borders">
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</h2>
						<div class="row">
							<xsl:apply-templates select="News" mode="News2"></xsl:apply-templates>
						</div>
					</div>
				</section>
			</xsl:when>
			<xsl:when test="position()=3">
				<section class="about-3" id="about-3">
					<div class="container">
						<div class="content-wrapper">
							<h2 class="main-title no-borders">
								<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							</h2>
							<xsl:apply-templates select="News" mode="News3"></xsl:apply-templates>
						</div>
					</div>
				</section>
			</xsl:when>
			<xsl:when test="position()=4">
				<section class="about-4 pd-60" id="about-4">
					<div class="container">
						<div class="about-tab-wrapper">
							<h2 class="sub-title no-borders">
								<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							</h2>
							<div class="about-tab">
								<div class="tab-title">Chuyên mục</div>
								<nav tab-for="about-4">
									<xsl:apply-templates select="Zone" mode="About4List"></xsl:apply-templates>
								</nav>
								<select select-for="about-4">
									<xsl:apply-templates select="Zone" mode="About4Select"></xsl:apply-templates>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-4" tab-content="about-4">
								<xsl:apply-templates select="Zone" mode="About4Zone"></xsl:apply-templates>
							</div>
							<div class="col-lg-8">
								<xsl:apply-templates select="Zone" mode="About4ZoneFirst"></xsl:apply-templates>
							</div>
						</div>
					</div>
				</section>
			</xsl:when>
			<xsl:when test="position()=5">
				<section class="about-5" id="about-5">
					<div class="container">
						<h2 class="main-title no-borders">
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</h2>
						<div class="row">
							<xsl:apply-templates select="News" mode="News5"></xsl:apply-templates>
						</div>
					</div>
				</section>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="Zone" mode="About4List">
		<a>
			<xsl:attribute name="href">
				<xsl:text disable-output-escaping="yes">#about4tab_</xsl:text>
				<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
		</a>
	</xsl:template>
	<xsl:template match="Zone" mode="About4Select">
		<option>
			<xsl:attribute name="value">
				<xsl:text disable-output-escaping="yes">#about4tab_</xsl:text>
				<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
			</xsl:attribute>
			<xsl:if test="position()=1">
				<xsl:attribute name="selected">
					<xsl:text disable-output-escaping="yes"></xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="Zone" mode="About4Zone">
		<div class="list">
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">list show</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="id">
				<xsl:text disable-output-escaping="yes">about4tab_</xsl:text>
				<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
			</xsl:attribute>
			<xsl:apply-templates select="News" mode="News4"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="Zone" mode="About4ZoneFirst">
		<xsl:if test="position()=1">
			<xsl:apply-templates select="News" mode="News4First"></xsl:apply-templates>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News" mode="News1">
		<xsl:if test="position()=1">
			<div class="row">
				<div class="col-lg-8">
					<div class="title">
						<h3>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h3>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="description">
						<p>
							<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
						</p>
					</div>
				</div>
				<div class="col-12">
					<div class="imgbox">
						<img class="lazyload">
							<xsl:attribute name="data-src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
						</img>
					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News" mode="News2">
		<div class="col-md-4 col-11">
			<div class="item">
				<div class="imgbox">
					<img class="lazyload">
						<xsl:attribute name="data-src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</div>
				<div class="content">
					<h3>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					</h3>
					<p>
						<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
					</p>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="News3">
		<div class="imgbox">
			<a data-fancybox="about-3" href="./img/about/2.png">
				<xsl:attribute name="href">
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
	</xsl:template>
	<xsl:template match="News" mode="News4">
		<div class="staff-item">
			<div class="imgbox thumb">
				<img class="lazyload">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</img>
			</div>
			<div class="imgbox normal">
				<img class="lazyload">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</img>
			</div>
			<div class="description">
				<h3>
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				</h3>
				<h4>
					<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
				</h4>
				<div class="brief-content">
					<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="News4First">
		<xsl:if test="position()=1">
			<div class="staff-item" id="staff-item">
				<div class="imgbox thumb">
					<img class="lazyload">
						<xsl:attribute name="data-src">
							<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</div>
				<div class="imgbox normal">
					<img class="lazyload">
						<xsl:attribute name="data-src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
					</img>
				</div>
				<div class="description">
					<h3>
						<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					</h3>
					<h4>
						<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
					</h4>
					<div class="brief-content">
						<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News" mode="News5">
		<div class="col-lg-6">
			<div class="item">
				<div class="imgbox">
					<img class="lazyload">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>
				<div class="description">
					<h3><xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of></h3>
					<div class="brief-content">
						<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
					</div>
					<a class="btn-download" download="">
						<xsl:attribute name="href">
							<xsl:value-of disable-output-escaping="yes" select="FileUrl"></xsl:value-of>
						</xsl:attribute>
						<span>Tải về (PDF)</span>
						<span class="mdi mdi-download"></span>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>