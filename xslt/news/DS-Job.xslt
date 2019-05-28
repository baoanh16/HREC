<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<h2 class="page-title"><xsl:value-of disable-output-escaping="yes" select="/NewsList/ZoneTitle"></xsl:value-of></h2>
		<div class="row">
			<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<div class="col-sm-6 job-item-wrapper">
			<div class="job-item">
				<div class="imgbox">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
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
					<div class="row">
						<div class="job-info">
							<p><xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of></p>
						</div>
						<div class="job-info">
							<p><xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of></p>
						</div>
						<div class="job-info">
							<p>Ngày bắt đầu: <xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of></p>
						</div>
						<div class="job-info">
							<p>Hạn nộp hồ sơ: <xsl:value-of disable-output-escaping="yes" select="EndDate"></xsl:value-of></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>