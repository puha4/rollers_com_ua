$(document).ready(function(){

	if (typeof(homeslider_speed) == 'undefined')
		homeslider_speed = 500;
	if (typeof(homeslider_pause) == 'undefined')
		homeslider_pause = 3000;
	if (typeof(homeslider_loop) == 'undefined')
		homeslider_loop = true;
    if (typeof(homeslider_width) == 'undefined')
        homeslider_width = 779;
	
	var tl = new TimelineMax();
	
    tl.from(".homeslider-description", 0.3,{autoAlpha:0});

	if (!!$.prototype.bxSlider)
		$('#homeslider').bxSlider({
			mode:'fade',
			useCSS: false,
			maxSlides: 1,
			slideWidth: homeslider_width,
			infiniteLoop: homeslider_loop,
			hideControlOnEnd: true,
			pager: true,
			autoHover: true,
			autoControls: false,
			auto: homeslider_loop,
			speed: parseInt(homeslider_speed),
			pause: homeslider_pause,
			controls: true,
			startText:'',
			stopText:'',
			pagerCustom: '#bx-pager-thumb',
			onSliderLoad:function(){tl.play()},
			onSlideBefore:function(){tl.restart()},
			onSlideAfter:function(){}
		});

    $('.homeslider-description').click(function () {
        window.location.href = $(this).prev('a').prop('href');
    });
    $("#homepage-slider")
        .on("mouseenter",function(){
            $(".bx-controls-direction > a").addClass("active");
        })
        .on("mouseleave",function(){
        $(".bx-controls-direction > a").removeClass("active");
        });
});