/**
 * @desc:
 * @time: 2017-08-15 17:20
 * @author: JustFresh
 */
$(function(){
	
	var sliderAct = 0;
	var sliderTime = 5000;
	var sliderInterval = setInterval(function(){
		if(sliderAct == $("#recommends .slider .slider-num ul li").length - 1){
			sliderAct = 0;
		}else{
			sliderAct++;
		}
		$("#recommends .slider .slider-box ul li").eq(sliderAct).addClass("selected").siblings().removeClass("selected");
		$("#recommends .slider .slider-num ul li").eq(sliderAct).addClass("selected").siblings().removeClass("selected");
	},sliderTime);
	$("#recommends .slider .slider-num ul li").hover(function(){
		$(this).addClass("selected").siblings().removeClass("selected");
		$("#recommends .slider .slider-box ul li").eq($(this).index()).addClass("selected").siblings().removeClass("selected");
		sliderAct = $(this).index();
	});
	
	/* 鼠标移动到div上面显示隐藏的视频播放按钮部分 */
	$("#recommends .slider .slider-box ul li").mouseenter(function(){$(this).find(".bg").fadeIn();});
	$("#recommends .slider .slider-box ul li").mouseleave(function(){$(this).find(".bg").fadeOut();});
	/* 鼠标移动到div上面显示隐藏的视频播放按钮部分 */
	$("#recommends .list ul li").mouseenter(function(){$(this).find(".bg").fadeIn();});
	$("#recommends .list ul li").mouseleave(function(){$(this).find(".bg").fadeOut();});
	/* 鼠标移动到div上面显示隐藏的视频播放按钮部分 */
	$("#videoList ul li").mouseenter(function(){$(this).find(".bg").fadeIn();});
	$("#videoList ul li").mouseleave(function(){$(this).find(".bg").fadeOut();});
});