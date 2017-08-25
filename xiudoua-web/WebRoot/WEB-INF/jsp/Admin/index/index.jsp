<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/index/index.css" />
<body>
	<jsp:include page="/admin/header.do"></jsp:include>
	<div class="main">
		<jsp:include page="/admin/left_nav.do"></jsp:include>
		<div class="content pull-right">
			<!-- JustFresh 2017-06-24 begin 统计块部分 -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-3 total transation-block">
						<div class="panel panel-success">
						  	<div class="panel-heading"><i class="fa fa-credit-card"></i> 交易</div>
						  	<div class="panel-body">
						    	<h3><i class="fa fa-credit-card"></i></h3>
						    	<br/>
						    	<p>交易订单及投诉/举报</p>
						  	</div>
						  	<div class="panel-footer">
						  		<ul>
						  			<li><a href="#">待发货</a></li>
						  			<li><a href="#">退款</a></li>
						  			<li><a href="#">退货</a></li>
						  			<li><a href="#">投诉</a></li>
						  		</ul>
						  		<div class="clearfix"></div>
						  	</div>
						</div>
					</div>
					<div class="col-sm-12 col-md-3 total goods-block">
						<div class="panel panel-info">
						  	<div class="panel-heading"><i class="fa fa-shopping-basket"></i> 商品</div>
						  	<div class="panel-body">
						    	<h3><i class="fa fa-shopping-basket"></i></h3>
						    	<br/>
						    	<p>新增商品/上下架商品</p>
						  	</div>
						  	<div class="panel-footer">
						  		<ul>
						  			<li><a href="#">新增商品</a></li>
						  			<li><a href="#">上架商品</a></li>
						  			<li><a href="#">下架商品</a></li>
						  		</ul>
						  		<div class="clearfix"></div>
						  	</div>
						</div>
					</div>
					<div class="col-sm-12 col-md-3 total user-block">
						<div class="panel panel-warning">
						  	<div class="panel-heading"><i class="fa fa-user"></i> 用户</div>
						  	<div class="panel-body">
						    	<h3><i class="fa fa-user"></i></h3>
						    	<br/>
						    	<p>本周新增/预存款提现</p>
						 	</div>
						 	<div class="panel-footer">
						  		<ul>
						  			<li><a href="#">本周新增</a></li>
						  			<li><a href="#">预存款提现</a></li>
						  		</ul>
						  		<div class="clearfix"></div>
						  	</div>
						</div>
					</div>
					<div class="col-sm-12 col-md-3 total article-block">
						<div class="panel panel-danger">
						  	<div class="panel-heading"><i class="fa fa-cc"></i> 文章</div>
							<div class="panel-body">
						    	<h3><i class="fa fa-cc"></i></h3>
						    	<br/>
						    	<p>新增文章/文章审核/新增评论</p>
						 	</div>
						 	<div class="panel-footer">
						  		<ul>
						  			<li><a href="#">新增文章</a></li>
						  			<li><a href="#">文章审核</a></li>
						  			<li><a href="#">新增评论</a></li>
						  		</ul>
						  		<div class="clearfix"></div>
						  	</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- JustFresh 2017-06-24 begin echarts报表部分 -->
			<div class="container-fluid charts">
				<div class="row">
					<div class="col-sm-12 col-md-6">
						<div class="panel panel-success">
							<div class="panel-heading"><i class="fa fa-bar-chart"></i> 销售报表</div>
							<div class="panel-body">
								<div id="saleChart" ></div>
							</div>
						</div>
					</div>
					<div class="col-sm-12 col-md-6">
						<div class="panel panel-success">
							<div class="panel-heading"><i class="fa fa-bar-chart"></i> 商品报表</div>
							<div class="panel-body">
								<div id="goodsChart" ></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/index.js"></script>
</body>