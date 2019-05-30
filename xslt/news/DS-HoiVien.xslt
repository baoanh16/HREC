<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="row">
			<div class="col-12">
				<div class="swiper-container big-member" data-bg="/Data/Sites/1/skins/default/img/member/2.jpg">
					<div class="swiper-nav">
						<div class="swiper-next">
							<img src="/Data/Sites/1/skins/default/img/slider-next-3.png" alt="" />
						</div>
					</div>
					<div class="swiper-wrapper">
						<xsl:apply-templates select="/NewsList/News" mode="Slide"></xsl:apply-templates>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<xsl:apply-templates select="/NewsList/News" mode="Normal"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="News" mode="Slide">
		<xsl:if test="position()&lt;4">
			<div class="swiper-slide">
				<div class="imgbox">
					<img src="./img/member/2.jpg" alt="" style="opacity: 0"/>
				</div>
				<div class="content">
					<div class="img-top">
						<div class="logo">
							<img src="/Data/Sites/1/skins/default/img/logo.png" alt="" />
						</div>
						<div class="partner">
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
					<div class="title">
						<h4>
							<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h4>
					</div>
					<div class="info">
						<div class="img">
							<xsl:apply-templates select="NewsImages"></xsl:apply-templates>
						</div>
						<div class="description">
							<p>
								<strong>Đại diện: </strong>
								<span>
									<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
								</span>
							</p>
							<p>
								<strong>Chức vụ: </strong>
								<span>
									<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
								</span>
							</p>
							<hr/>
							<div class="attributes">
								<xsl:apply-templates select="NewsAttributes"></xsl:apply-templates>
							</div>
							<div class="btn-wrapper">
								<a href="javascript:void(0)">
									<xsl:attribute name="data-fancybox">
										<xsl:text disable-output-escaping="yes">member_</xsl:text>
										<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="data-src">
										<xsl:text disable-output-escaping="yes">#member_</xsl:text>
										<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
									</xsl:attribute>
									<span>Xem thêm</span>
									<span class="mdi mdi-arrow-right"></span>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="d-none">
					<div class="member-popup">
						<xsl:attribute name="id">
							<xsl:text disable-output-escaping="yes">member_</xsl:text>
							<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
						</xsl:attribute>
						<div class="content">
							<div class="logo">
								<img src="/Data/Sites/1/skins/default/img/logo.png" alt="" />
								<img class="lazyload">
									<xsl:attribute name="data-src">
										<xsl:value-of select="ImageUrl"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="alt">
										<xsl:value-of select="Title"></xsl:value-of>
									</xsl:attribute>
								</img>
							</div>
							<div class="title">
								<h4>
									<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
								</h4>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="info">
										<div class="img">
											<xsl:apply-templates select="NewsImages"></xsl:apply-templates>
										</div>
										<div class="description">
											<p>
												<strong>Đại diện: </strong>
												<span>
													<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
												</span>
											</p>
											<p>
												<strong>Chức vụ: </strong>
												<span>
													<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
												</span>
											</p>
											<hr/>
											<div class="attributes">
												<xsl:apply-templates select="NewsAttributes"></xsl:apply-templates>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="full-content">
										<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="News" mode="Normal">
		<xsl:if test="position()&gt;3">
			<div class="col-sm-6 col-lg-3">
				<div class="member-item">
					<div class="imgbox">
						<a href="javascript:void(0)" class="member-normal">
							<img class="lazyload">
								<xsl:attribute name="data-src">
									<xsl:value-of select="ImageUrl"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="alt">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
							</img>
						</a>
						<a href="javascript:void(0)" class="thumb-popup">
							<xsl:attribute name="data-fancybox">
								<xsl:text disable-output-escaping="yes">member_</xsl:text>
								<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="data-src">
								<xsl:text disable-output-escaping="yes">#member_</xsl:text>
								<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
							</xsl:attribute>
							<xsl:apply-templates select="NewsImages" mode="Thumbs"></xsl:apply-templates>
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
								<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
							</a>
						</h3>
						<p>
							<strong>Đại diện:</strong>
							<span>
								<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
							</span>
						</p>
					</div>
				</div>
				<div class="d-none">
					<div class="member-popup">
						<xsl:attribute name="id">
							<xsl:text disable-output-escaping="yes">member_</xsl:text>
							<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
						</xsl:attribute>
						<div class="content">
							<div class="logo">
								<img src="/Data/Sites/1/skins/default/img/logo.png" alt="" />
								<img class="lazyload">
									<xsl:attribute name="data-src">
										<xsl:value-of select="ImageUrl"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="alt">
										<xsl:value-of select="Title"></xsl:value-of>
									</xsl:attribute>
								</img>
							</div>
							<div class="title">
								<h4>
									<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
								</h4>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="info">
										<div class="img">
											<xsl:apply-templates select="NewsImages"></xsl:apply-templates>
										</div>
										<div class="description">
											<p>
												<strong>Đại diện: </strong>
												<span>
													<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
												</span>
											</p>
											<p>
												<strong>Chức vụ: </strong>
												<span>
													<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
												</span>
											</p>
											<hr/>
											<div class="attributes">
												<xsl:apply-templates select="NewsAttributes"></xsl:apply-templates>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="full-content">
										<xsl:value-of disable-output-escaping="yes" select="FullContent"></xsl:value-of>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="NewsImages">
		<xsl:if test="position()&gt;1">
			<img class="lazyload">
				<xsl:attribute name="data-src">
					<xsl:value-of select="ImageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
			</img>
		</xsl:if>
	</xsl:template>
	<xsl:template match="NewsImages" mode="Thumbs">
		<xsl:if test="position()&gt;1">
			<xsl:attribute name="data-bg">
				<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
			</xsl:attribute>
			<img class="lazyload member-thumb">
				<xsl:attribute name="data-src">
					<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
			</img>
		</xsl:if>
	</xsl:template>
	<xsl:template match="NewsAttributes">
		<div class="contact-info">
			<xsl:if test="position()=1">
				<span class="mdi mdi-map-marker"></span>
			</xsl:if>
			<xsl:if test="position()=2">
				<span class="mdi mdi-phone-in-talk"></span>
			</xsl:if>
			<xsl:if test="position()=3">
				<span class="mdi mdi-email"></span>
			</xsl:if>
			<xsl:if test="position()=4">
				<span class="mdi mdi-web"></span>
			</xsl:if>
			<p>
				<strong>
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				</strong>
				<xsl:text disable-output-escaping="yes">: </xsl:text>
				<span>
					<xsl:value-of disable-output-escaping="yes" select="Content"></xsl:value-of>
				</span>
			</p>
		</div>
	</xsl:template>
</xsl:stylesheet>