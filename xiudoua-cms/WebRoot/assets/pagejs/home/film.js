/**
 *
 */

$(function(){
	
	/* 鼠标移动到div上面显示隐藏的视频播放按钮部分 */
	$(".content .recommends .videos dl dd").mouseenter(function(){$(this).find(".bg").fadeIn();});
	$(".content .recommends .videos dl dd").mouseleave(function(){$(this).find(".bg").fadeOut();});
	
	var sliderAct = 0;
	var sliderTime = 5000;
	var sliderInterval = setInterval(function(){
		if(sliderAct == $(".content .content-detail .images .slider-num ul li").length - 1){
			sliderAct = 0;
		}else{
			sliderAct++;
		}
		$(".content .content-detail .images .slider-num ul li").eq(sliderAct).addClass("selected").siblings().removeClass("selected");
		$(".content .content-detail .images .slider-box ul li").eq(sliderAct).addClass("selected").siblings().removeClass("selected");
	},sliderTime);
	$(".content .content-detail .images .slider-num ul li").hover(function(){
		$(this).addClass("selected").siblings().removeClass("selected");
		$(".content .content-detail .images .slider-box ul li").eq($(this).index()).addClass("selected").siblings().removeClass("selected");
		sliderAct = $(this).index();
	});
	$(".content .content-detail .images .opt.next").click(function(){
		if(sliderAct != 0){
			sliderAct++;
		}else{
			sliderAct = $(".content .content-detail .images .slider-num ul li").length - 1;
		}
		$(".content .content-detail .images .slider-num ul li").eq(sliderAct).addClass("selected").siblings().removeClass("selected");
		$(".content .content-detail .images .slider-box ul li").eq(sliderAct).addClass("selected").siblings().removeClass("selected");
	});
	$(".content .content-detail .images .opt.prev").click(function(){
		if(sliderAct != $(".content .content-detail .images .slider-num ul li").length - 1){
			sliderAct--;
		}else{
			sliderAct = 0;
		}
		$(".content .content-detail .images .slider-num ul li").eq(sliderAct).addClass("selected").siblings().removeClass("selected");
		$(".content .content-detail .images .slider-box ul li").eq(sliderAct).addClass("selected").siblings().removeClass("selected");
	});
	
});