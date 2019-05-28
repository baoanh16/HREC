<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="row">
			<div class="col-12">
				<div class="table-responsive">
					<table>
						<thead>
							<tr>
								<th></th>
								<th>Ngày đăng</th>
								<th>Tải về</th>
							</tr>
						</thead>
						<tbody>
							<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<tr>
			<td>
				<a download="download">
					<xsl:attribute name="href">
						<xsl:value-of select="FileUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				</a>
				<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			</td>
			<td>
				<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
			</td>
			<td>
				<a class="mdi mdi-download" download="download">
					<xsl:attribute name="href">
						<xsl:value-of select="FileUrl"></xsl:value-of>
					</xsl:attribute>
				</a>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>