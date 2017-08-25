/**
 * @desc:
 * @time: 2017-08-15 17:20
 * @author: JustFresh
 */

$(function(){
	var navbarSliderAct = 0;
	var navbarSliderTime = 3000;
	var navbarSliderInterval = setInterval(function(){
		if(navbarSliderAct == $("#navbar ul.slider-box li").length - 1){
			navbarSliderAct = 0;
		}else{
			navbarSliderAct++;
		}
		$("#navbar ul.slider-box li").eq(navbarSliderAct).addClass("selected").siblings().removeClass("selected");
		$("#navbar ul.slider-num li").eq(navbarSliderAct).addClass("selected").siblings().removeClass("selected");
	},navbarSliderTime);
	$("#navbar ul.slider-num li").mouseenter(function(){
		$(this).addClass("selected").siblings().removeClass("selected");
		$("#navbar ul.slider-box li").eq($(this).index()).addClass("selected").siblings().removeClass("selected");
		navbarSliderAct = $(this).index();
		clearInterval(navbarSliderInterval);
	});
	$("#navbar ul.slider-num li").mouseleave(function(){
		navbarSliderInterval = setInterval(function(){
			if(navbarSliderAct == $("#navbar ul.slider-box li").length - 1){
				navbarSliderAct = 0;
			}else{
				navbarSliderAct++;
			}
			$("#navbar ul.slider-box li").eq(navbarSliderAct).addClass("selected").siblings().removeClass("selected");
			$("#navbar ul.slider-num li").eq(navbarSliderAct).addClass("selected").siblings().removeClass("selected");
		},navbarSliderTime);
	});
	
	
	var videoSliderAct = 0;
	var videoSliderTime = 5000;
	var videoSliderInterval = setInterval(function(){
		if(videoSliderAct == $(".cms-main .one-third-last ul.tab-panel li").length - 1){
			videoSliderAct = 0;
		}else{
			videoSliderAct++;
		}
		$(".cms-main .one-third-last h4 ul.tab-nav li").eq(videoSliderAct+1).addClass("selected").siblings().removeClass("selected");
		$(".cms-main .one-third-last ul.tab-panel li").eq(videoSliderAct).addClass("selected").siblings().removeClass("selected");
	},videoSliderTime);
	$(".cms-main .one-third-last h4 ul.tab-nav li").mouseenter(function(){
		if($(this).index() > 0){
			$(this).addClass("selected").siblings().removeClass("selected");
			$(".cms-main .one-third-last ul.tab-panel li").eq($(this).index() - 1).addClass("selected").siblings().removeClass("selected");
			videoSliderAct = $(this).index() - 1;
			clearInterval(videoSliderInterval);
		}
	});
	$(".cms-main .one-third-last h4 ul.tab-nav li").mouseleave(function(){
		videoSliderInterval = setInterval(function(){
			if(videoSliderAct == $(".cms-main .one-third-last ul.tab-panel li").length - 1){
				videoSliderAct = 0;
			}else{
				videoSliderAct++;
			}
			$(".cms-main .one-third-last h4 ul.tab-nav li").eq(videoSliderAct+1).addClass("selected").siblings().removeClass("selected");
			$(".cms-main .one-third-last ul.tab-panel li").eq(videoSliderAct).addClass("selected").siblings().removeClass("selected");
		},videoSliderTime);
	});
});