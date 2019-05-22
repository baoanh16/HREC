var BottomHeaderPosition;

$(document).ready(function () {
	if ($(window).scrollTop() > 0) {
		$('header .top-header').hide()
	}
	DataBG();
	ChangeHeaderBannerByScreenSize();
	ToggleMenuMobile();
	ToggleAccount();
	StickHeader();
	ToggleSearch();
	HomeSlider();
	HomeGallerySlider();
	SetupFancybox();
	GoToLink();
	HomePartnerSlider();
	AboutTab();
	StickAboutNavbar();
	AboutScrollClick();
	// News scripts
	SetHeightNewsItem();
});

$(window).on('resize', function () {
	ChangeHeaderBannerByScreenSize();
	// News scripts
	SetHeightNewsItem();
})

$(window).on('scroll', function () {
	StickHeader();
	StickAboutNavbar();
})

function DataBG() {
	$('[data-bg]').each(function () {
		$(this).addClass('data-bg lazyload')
	})
}

function ChangeHeaderBannerByScreenSize() {
	if ($(window).outerWidth() >= 1025) {
		var src = $('header .header-banner img').attr('desktop-src')
		$('header .header-banner img').attr('src', src)
	} else {
		var src = $('header .header-banner img').attr('mobile-src')
		$('header .header-banner img').attr('src', src)
	}
}

function ToggleMenuMobile() {
	$('header .mobile-toggle').on('click', function () {
		$('header .main-nav').toggleClass('open')
		if ($('header .main-nav').hasClass('open')) {
			$('header .backdrop').fadeIn(300)
			$('body').addClass('active-hidden')
		} else {
			$('header .backdrop').fadeOut(300)
			$('body').removeClass('active-hidden')
		}
	})
	$('header .mobile-off, header .backdrop').on('click', function () {
		$('header .main-nav').removeClass('open')
		if ($('header .main-nav').hasClass('open')) {
			$('header .backdrop').fadeIn(300)
			$('body').addClass('active-hidden')
		} else {
			$('header .backdrop').fadeOut(300)
			$('body').removeClass('active-hidden')
		}
	})
}

function ToggleAccount() {
	$('header .account .account-toggle').on('click', function () {
		$('header .account .account-menu').slideToggle();
	})
}

function StickHeader() {
	if ($(window).scrollTop() > 0) {
		$('header .top-header').slideUp()
	} else {
		$('header .top-header').slideDown()
	}
}

function ToggleSearch() {
	$('header .search-toggle').on('click', function () {
		$('header .searchbox').toggleClass('open')
	})
}

function HomeSlider() {
	var HomeBanner1 = new Swiper('.home-banner .banner-left .swiper-container', {
		slidesPerView: 1,
		speed: 1200,
		preloadImages: true,
		loadOnTransitionStart: true,
		lazy: true,
		loop: true,
		spaceBetween: 10,
		autoplay: {
			delay: 3500,
			disableOnInteraction: false
		},
		pagination: {
			el: '.home-banner .banner-left .swiper-pagination',
			type: 'bullets',
		},
	})

	var HomeBanner2 = new Swiper('.home-banner .banner-right .swiper-container', {
		slidesPerView: 1,
		speed: 1200,
		preloadImages: true,
		loadOnTransitionStart: true,
		loop: true,
		loopAdditionalSlides: 2,
		spaceBetween: 10,
		autoplay: {
			delay: 4500,
			disableOnInteraction: false
		},
		breakpoints: {
			1025: {
				slidesPerView: 3
			},
			768: {
				slidesPerView: 2
			}
		},
		pagination: {
			el: '.home-banner .banner-right .swiper-pagination',
			type: 'bullets',
		},
		on: {
			init: function () {
				if ($(window).outerWidth() >= 1025) {
					$('.home-banner .banner-right .swiper-container').height($('.home-banner .banner-left .swiper-container').height())
				}
			},
			resize: function () {
				if ($(window).outerWidth() >= 1025) {
					$('.home-banner .banner-right .swiper-container').height($('.home-banner .banner-left .swiper-container').height())
				}
			}
		}
	})
}

function SetHeightNewsItem() {
	$('.news-2-item .imgbox').each(function () {
		$(this).height($(this).width() / (610 / 380))
	})
	if ($(window).outerWidth() < 1025) {
		$('.news-1-item .imgbox').each(function () {
			$(this).height($(this).width() / (610 / 380))
		})
		$('.news-3-item .imgbox').each(function () {
			$(this).height($(this).width() / (610 / 380))
		})
		$('.gallery-item .imgbox').each(function () {
			$(this).height($(this).width() / (300 / 180))
		})
	} else {
		$('.news-1-item .imgbox').each(function () {
			$(this).attr('style', '')
		})
		$('.news-3-item .imgbox').each(function () {
			$(this).attr('style', '')
		})
		$('.gallery-item .imgbox').each(function () {
			$(this).attr('style', 'background-image: url("' + $(this).attr('data-bg') + '")')
		})
	}
}

function HomeGallerySlider() {
	var HomeGallerySlider = new Swiper('.home-7 .swiper-container', {
		slidesPerView: 1,
		spaceBetween: 5,
		speed: 1400,
		loop: true,
		pagination: {
			el: '.home-7 .swiper-pagination',
			type: 'bullets',
		},
		breakpoints: {
			1025: {
				slidesPerView: 1,
			},
		}
	})
}

function SetupFancybox() {
	$('[data-fancybox]').fancybox({
		thumbs: {
			autoStart: true, // Display thumbnails on opening
			hideOnClose: true, // Hide thumbnail grid when closing animation starts
			axis: "x" // Vertical (y) or horizontal (x) scrolling
		},
		slideShow: {
			autoStart: true,
			speed: 3000
		},
	})
}


function GoToLink() {
	$('.home-nav-wrapper select').each(function () {
		$(this).on('change', function () {
			// var FullUrl = window.location.host +'/'+ $(this).val()
			var FullUrl = $(this).val()
			// console.log(FullUrl)
			window.location.assign(FullUrl)
		})
	})
}

function HomePartnerSlider() {
	var HomePartnerSlider = new Swiper('.home-8 .swiper-container', {
		slidesPerView: 6,
		speed: 1300,
		loop: true,
		spaceBetween: 20,
		autoplay: {
			delay: 4100,
			disableOnInteraction: false,
		},
		lazy: {
			loadPrevNextAmount: 6,
			loadOnTransitionStart: true,
			loadPrevNext: true,
		},
		navigation: {
			prevEl: '.home-8 .swiper-prev',
			nextEl: '.home-8 .swiper-next'
		},
		breakpoints: {
			1025: {
				slidesPerView: 5,
			},
			768: {
				slidesPerView: 4,
			},
			576: {
				slidesPerView: 3,
			},
			420: {
				slidesPerView: 2,
			},
		}
	})
}


function AboutTab() {

	// Active tab khi click vô cái tab ở trang about, section 4
	$('[tab-for="about-4"] a').on('click', function (e) {
		e.preventDefault();
		$(this).addClass('active')
		$(this).siblings('a').removeClass('active')
		var target = $(this).attr('href');
		$('[tab-content="about-4"] .list').hide().removeClass('show')
		$('[tab-content="about-4"] ' + target).fadeIn().addClass('show')
		$('[select-for="about-4"] option').removeAttr('selected')
		$('[select-for="about-4"]').val(target)

		// Nếu màn hình > 1025px và có nọi dung trong mỗi tab thì mỗi lần click đổi tab sẽ tự chọn lại item đầu tiên để hiện ra, nếu không có thì ẩn
		if ($(window).outerWidth() >= 1025) {
			if ($(target + ' .staff-item').length > 0) {
				$(target + ' .staff-item').eq(0).trigger('click')
			} else {
				$('#staff-item').html('')
			}
		}
	})

	// active tab bằng select liên kết với menu trong section 4
	$('[select-for="about-4"]').on('change', function () {
		var target = $(this).val()
		$('[tab-for="about-4"] a[href="' + target + '"]').trigger('click')
	})


	// Click đổi nọi dung của mỗi item trong từng tab
	$('.about-4 .list .staff-item').on('click', function () {
		var content = $(this).html()
		$(this).addClass('active')
		$(this).siblings('.staff-item').removeClass('active')
		$('#staff-item').html(content)
		if ($(window).outerWidth() < 1025) {
			$('#staff-item').fancybox().click()
		}
	})

}

function StickAboutNavbar() {
	if ($('.about-nav-scroll').length > 0) {
		var ThatPosition = $('.about-nav-scroll').offset().top - 60
		if ($(window).scrollTop() >= ThatPosition) {
			$('.about-nav-scroll .about-nav-scroll-wrapper').addClass('fixed')
		} else {
			$('.about-nav-scroll .about-nav-scroll-wrapper').removeClass('fixed')
		}
	}
}
function AboutScrollClick() {
	$('.about-nav-scroll a').each(function () {
		$(this).on('click', function (e) {
			e.preventDefault()
			var target = $(this).attr('href')
			$(this).parent().addClass('active')
			$(this).parent().siblings('li').removeClass('active')
			$('html,body').animate({
				scrollTop: $(target).offset().top - 100
			}, 1200)
		})
	})

	$('.about-nav-scroll select').on('change', function () {
		var target = $(this).val()
		$('.about-nav-scroll a').each(function () {
			if($(this).attr('href') == target){
				$(this).trigger('click')
			}
		})
	})
}