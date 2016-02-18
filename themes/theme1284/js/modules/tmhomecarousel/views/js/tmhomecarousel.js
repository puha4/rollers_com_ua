/*
* 2002-2015 TemplateMonster
*
* TemplateMonster Homepage Products Carousel
*
* NOTICE OF LICENSE
*
* This source file is subject to the General Public License (GPL 2.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/GPL-2.0

* @author     TemplateMonster (Alexander Grosul)
* @copyright  2002-2015 TemplateMonster
* @license    http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*/

$(document).ready(function(){
	if(typeof(carousel_status) != 'undefined' && carousel_status)
	{
		setNbItems();
		if (!!$.prototype.bxSlider)
			slider = $('#homepage-carousel').bxSlider({
				responsive:true,
				useCSS: false,
				minSlides: carousel_item_nb_new,
				maxSlides: carousel_item_nb_new,
				slideWidth: carousel_item_width,
				slideMargin: carousel_item_margin,
				infiniteLoop: carousel_loop,
				hideControlOnEnd: carousel_hide_control,
				randomStart: carousel_random,
				moveSlides: carousel_item_scroll,
				pager: carousel_pager,
				autoHover: carousel_auto_hover,
				auto: carousel_auto,
				speed: carousel_speed,
				pause: carousel_auto_pause,
				controls: carousel_control,
				autoControls: carousel_auto_control,
				startText:'',
				stopText:'',
				prevText:'',
				nextText:'',
                
			});
	
		start_content = $('#index .tab-content ul:first').html();
		$('#homepage-carousel').append(start_content);
		slider.reloadSlider();
		$('#home-page-tabs li').on('click', function(e){
			e.preventDefault();
			thisClass = $(this).children('a').attr('class');
			content = $('.tab-content ul.'+thisClass).html();
			$('#homepage-carousel').empty();
			$('#homepage-carousel').append(content);
			slider.reloadSlider();
		});
		var doit;
		window.onresize = function() {
			clearTimeout(doit);
			doit = setTimeout(function() {
				resizedw();
			}, 200);
		};
	}
    $(window).on("resize load", function(){
        $(".prod_con_before").width(($('.prod_con_wrap').width() - $('.product_con').innerWidth())/2);
        $(".prod_con_after").width(($('.prod_con_wrap').width() - $('.product_con').innerWidth())/2);
    });
});

function resizedw(){
	setNbItems();
	slider.reloadSlider({
		responsive:true,
		useCSS: false,
		minSlides: carousel_item_nb_new,
		maxSlides: carousel_item_nb_new,
		slideWidth: carousel_item_width,
		slideMargin: carousel_item_margin,
		infiniteLoop: carousel_loop,
		hideControlOnEnd: carousel_hide_control,
		randomStart: carousel_random,
		moveSlides: carousel_item_scroll,
		pager: carousel_pager,
		autoHover: carousel_auto_hover,
		auto: carousel_auto,
		speed: carousel_speed,
		pause: carousel_auto_pause,
		controls: carousel_control,
		autoControls: carousel_auto_control,
		startText:'',
		stopText:'',
		prevText:'',
		nextText:'',
	});
}

function setNbItems()
{
	if ($('.tab-content').width() < 400)
		carousel_item_nb_new = 1;
	if ($('.tab-content').width() >= 400)
		carousel_item_nb_new = 2;
	if ($('.tab-content').width() >= 560)
		carousel_item_nb_new = 3;
    if($('.tab-content').width() >= 991)
        carousel_item_nb_new = 4;
	if($('.tab-content').width() > 1800)
		carousel_item_nb_new = carousel_item_nb;
}