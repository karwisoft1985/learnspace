/*********************************************************************************

	Template Name: Azan - Islamic HTML Template  
	Template URI: https://themeforest.net/user/hastech
	Description: Azan is a beautiful and creative islamic  html template
	Author: HasTech
	Author URI: https://themeforest.net/user/hastech
	Version: 1.0

	Note: This is active js. Plugins activation code here.

**********************************************************************************/


/*===============================================================================
			[ INDEX ]
=================================================================================

	Silde Active
		Event Slide
		Activity slider active
		Banner Slide
	Mobile Menu
	Wow Active
	ScrollUp
	Video Popup
	Fakeloader

=================================================================================
			[ END INDEX ]
================================================================================*/

(function($) {
	'use strict';

	/*=========== Silde Active ===========*/
	// Event Slide
	$('.event-slide-active').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: false,
		fade: true,
		dots: true,
		asNavFor: '.event-filters-active',
	});

	$('.event-filters-active').slick({
		infinite: true,
		slidesToShow: 3,
		slidesToScroll: 3,
		centerMode: true,
		focusOnSelect: true,
		arrows: false,
		dots: false,
		asNavFor: '.event-slide-active'
	});

	// Activity slider active
	$('.activity-slider-active').slick({
		infinite: true,
		slidesToShow: 3,
		slidesToScroll: 1,
		focusOnSelect: true,
		arrows: true,
		dots: false,
		prevArrow: '<button class="arrow-prev"><span><i class="fa fa-angle-left"></i></span></button>',
		nextArrow: '<button class="arrow-next"><span><i class="fa fa-angle-right"></i></span></button>',
		responsive: [
			{
				breakpoint: 992,
				settings: {
					slidesToShow: 2,
					slidesToScroll: 1
				}
			},
			{
				breakpoint: 768,
				settings: {
					slidesToShow: 1,
					slidesToScroll: 1
				}
			}
		]
	});


	// Banner Slide
	$('.banner-slide-active').slick({
		infinite: true,
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: true,
		prevArrow: '<button class="arrow-prev"><i class="icofont icofont-rounded-left"></i></button>',
		nextArrow: '<button class="arrow-next"><i class="icofont icofont-rounded-right"></i></button>',
		adaptiveHeight: true
	});

	$('.banner-text-slide').slick({
		infinite: true,
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: true,
		prevArrow: '<button class="arrow-prev"><i class="icofont icofont-rounded-left"></i></button>',
		nextArrow: '<button class="arrow-next"><i class="icofont icofont-rounded-right"></i></button>',
		fade: true,
		cssEase: 'linear' 
	});





	/*=========== Mobile Menu ===========*/
	$('.header--style-1 nav.menu').meanmenu({
		meanMenuClose: 'X',
		meanMenuCloseSize: '18px',
		meanScreenWidth: '991',
		meanExpandableChildren: true,
		meanMenuContainer: '.mobile-menu',
		onePage: true
	});

	$('.header--style-2 nav.menu').meanmenu({
		meanMenuClose: 'X',
		meanMenuCloseSize: '18px',
		meanScreenWidth: '991',
		meanExpandableChildren: true,
		meanMenuContainer: '.mobile-menu',
		onePage: true
	});





	/*=========== Wow Active ===========*/
	 new WOW().init();





	/*=========== ScrollUp ===========*/
	$.scrollUp({
	    scrollText: '<i class="fa fa-angle-up"></i>',
	    easingType: 'linear',
	    scrollSpeed: 900,
	    animation: 'slideInRight'
	});


	/*=========== Video Popup ===========*/
	$('a.video--trigger').yu2fvl();




	/*=========== Fakeloader ===========*/
	$('.fakeloader').fakeLoader({
	    timeToHide:1200,
	    spinner:'spinner3'
	});

})(jQuery);