<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style type="text/css">
#qrcodeImg{position: fixed;z-index: 5;top: 300px;width: 120px;height: 150px;background-color: #fff;left: 50%;margin-left: -735px;}
#qrcodeImg img{width: 120px;}
#qrcodeImg p{text-align: center;}

#goTop{position: fixed;z-index: 5;bottom: 20px;right: 50%;margin-right: -650px;width: 40px;height: 40px;background-color: #CCCACA;}
#goTop a{display: inline-block;width: 100%;height: 100%;font-size: 20px;text-align: center;line-height: 40px;}
#goTop a:hover{background-color: #ff6600;color: #fff;}
</style>
<div id="qrcodeImg">
	<img src="<%=basePath %>assets/images/qrcode.jpg" />
	<p>微信平台订阅号</p>
</div>
<div id="goTop">
	<a href="javascript: void(0)" onclick="goTop()" title="回到顶部"><i class="fa fa-angle-up"></i></a>
</div>
<script type="text/javascript">
var goTop = function(){
	var speed=1000;//滑动的速度
    $('body,html').animate({scrollTop:0}, speed);
    return false;
};
</script>