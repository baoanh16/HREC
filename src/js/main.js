var BottomHeaderPosition, CurrentPosition;

$(document).ready(function () {
	DataBG();
	ChangeHeaderBannerByScreenSize();
	ToggleMenuMobile();
	ToggleAccount();
	StickHeader();
	ToggleSearch();
	HomeSlider();
});

$(window).on('resize', function () {
	ChangeHeaderBannerByScreenSize();
})

$(window).on('scroll', function () {
	StickHeader();
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
	CurrentPosition = $(window).scrollTop()
	if (CurrentPosition >= 20) {
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
		autoplay:{
			delay: 3500,
			disableOnInteraction: false
		}
	})

	var HomeBanner2 = new Swiper('.home-banner .banner-right .swiper-container', {
		slidesPerView: 1,
		speed: 1200,
		preloadImages: true,
		loadOnTransitionStart: true,
		loop: true,
		loopAdditionalSlides: 2,
		spaceBetween: 10,
		autoplay:{
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