<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="job-detail">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">
						<h1 class="page-title">
							<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/Title"></xsl:value-of>
							<xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h1>
						<div class="job-attributes">
							<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/BriefContent"></xsl:value-of>
						</div>
						<div class="brief-content">
							<div class="table-responsive">
								<table>
									<xsl:apply-templates select="/NewsDetail/NewsAttributes"></xsl:apply-templates>
								</table>
							</div>
						</div>
						<div class="full-content">
							<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/FullContent"></xsl:value-of>
						</div>
						<div class="btn-wrapper">
							<a class="btn-apply" href="javascript:void(0)">Ứng tuyển ngay</a>
							<span>hoặc</span>
							<a class="btn-download" href="#">
								<span>Tải mẫu đơn xin việc</span>
								<span>(Nộp trực tiếp)</span>
							</a>
						</div>
						<div class="form-apply">
							<iframe>
								<xsl:attribute name="src">
									<xsl:value-of disable-output-escaping="yes" select="/NewsDetail/ApplyUrl"></xsl:value-of>
								</xsl:attribute>
							</iframe>
						</div>
					</div>
					<div class="col-lg-4 other-job">
						<h2 class="main-title">Vị trí khác</h2>
						<xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="NewsAttributes">
		<tr>
			<td>
				<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
			</td>
			<td>
				<xsl:value-of disable-output-escaping="yes" select="Content"></xsl:value-of>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="NewsOther">
		<div class="other-job-item">
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
						<p>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
						</p>
					</div>
					<div class="job-info">
						<p>
							<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
						</p>
					</div>
					<div class="job-info">
						<p>Ngày bắt đầu: 
							
							
							
							
							<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
						</p>
					</div>
					<div class="job-info">
						<p>Hạn nộp hồ sơ: 
							
							
							
							
							<xsl:value-of disable-output-escaping="yes" select="EndDate"></xsl:value-of>
						</p>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>