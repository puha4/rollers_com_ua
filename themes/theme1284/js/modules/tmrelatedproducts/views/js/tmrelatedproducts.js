$(document).ready(function() {
	if (typeof productColumns != 'undefined') {
		if ($(document).width() >= 768) {
			if(productColumns == 1){minSlides=6}else if(productColumns == 2){minSlides=5} else {minSlides = 3}
			maxSlides = 6;
		}else{
			minSlides = 3;
			maxSlides = 3;	
		}
	}else {
		minSlides = 2,
		maxSlides = 6
	}
	if (!!$.prototype.bxSlider)
		slider3= $('#tmrelatedproducts').bxSlider({
			minSlides: minSlides,
			maxSlides: maxSlides,
			slideWidth: 178,
			slideMargin: 20,
			pager: false,
			nextText: '',
			prevText: '',
			moveSlides:1,
			infiniteLoop:false,
			hideControlOnEnd: true
		});
		if($('#tmrelatedproducts').length) {
			$(window).on("resize load", function(){
				if($(document).width() <= 767) {
					if(($(document).width() <= 500)){
						slider3.reloadSlider({
							minSlides: 2,
							maxSlides: 2,
							slideWidth: 178,
							slideMargin: 20,
							pager: false,
							nextText: '',
							prevText: '',
							moveSlides:1,
							infiniteLoop:false,
							hideControlOnEnd: true
						})
					}
					else{
						slider3.reloadSlider({
							minSlides: 3,
							maxSlides: 3,
							slideWidth: 178,
							slideMargin: 20,
							pager: false,
							nextText: '',
							prevText: '',
							moveSlides:1,
							infiniteLoop:false,
							hideControlOnEnd: true
						})
					}
				}
				else if (($(document).width() <= 1199)&&($(document).width() >= 768)){
					if (($(document).width() <= 991)){
						if (productColumns != 'undefined') {
							if(productColumns == 1){minSlides=4}else if(productColumns == 2){minSlides=3} else {minSlides = 2}
							}else {
							minSlides = 2	
						}
						slider3.reloadSlider({
							minSlides: minSlides,
							maxSlides: 4,
							slideWidth: 178,
							slideMargin: 20,
							pager: false,
							nextText: '',
							prevText: '',
							moveSlides:1,
							infiniteLoop:false,
							hideControlOnEnd: true
						})
					}else{
						if (productColumns != 'undefined') {
							if(productColumns == 1){minSlides=5}else if(productColumns == 2){minSlides=4} else {minSlides = 3}
							}else {
							minSlides = 2	
						}
						slider3.reloadSlider({
							minSlides: minSlides,
							maxSlides: 5,
							slideWidth: 178,
							slideMargin: 20,
							pager: false,
							nextText: '',
							prevText: '',
							moveSlides:1,
							infiniteLoop:false,
							hideControlOnEnd: true
						})
					}
					}
					else if ($(document).width() >= 1200){
					if (typeof productColumns != 'undefined') {
						if(productColumns == 1){minSlides=6}else if(productColumns == 2){minSlides=5} else {minSlides = 3}
						} else {
							minSlides = 2	
						}
						slider3.reloadSlider({
							minSlides: minSlides,
							maxSlides: 6,
							slideWidth: 178,
							slideMargin: 20,
							pager: false,
							nextText: '',
							prevText: '',
							moveSlides:1,
							infiniteLoop:false,
							hideControlOnEnd: true
						})	
					}
				})
			}
});
