/**
 *
 *
 */
$(function(){
	
	/* 鼠标移动到div上面显示隐藏的视频播放按钮部分 */
	$(".content .recommends .videos dl dd").mouseenter(function(){$(this).find(".bg").fadeIn();});
	$(".content .recommends .videos dl dd").mouseleave(function(){$(this).find(".bg").fadeOut();});
	
});