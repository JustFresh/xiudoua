<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/chart/index.css" />
<body>
	<jsp:include page="/admin/header.do"></jsp:include>
	<div class="main">
		<jsp:include page="/admin/left_nav.do"></jsp:include>
		<div class="content pull-right">
			
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="tab-nav">
							<ul class="pull-left">
								<li class="selected"><a href="javascript: void(0)"><i class="fa fa-cog"></i> 统计概述</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-area-chart"></i> 商品价格区间</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-area-chart"></i> 订单金额区间</a></li>
							</ul>
							<div class="opts pull-right">
								
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container-fluid warning-info">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<h4><i class="fa fa-warning"></i> 操作提示</h4>
						<p>符合以下任何一种条件的订单即为有效订单：1、采用在线支付方式支付并且已付款；2、采用货到付款方式支付并且交易已完成</p>
					</div>
				</div>
			</div>
			
			<div class="container-fluid info-table">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<table class="table table-striped">
							<thead>
								<tr>
									<th colspan="4">2017-07-17最新情报</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<p>下单金额 </p>
										<p>0.00元</p>
									</td>
									<td>
										<p>下单会员数 </p>
										<p>0</p>
									</td>
									<td>
										<p>下单量 </p>
										<p>0</p>
									</td>
									<td>
										<p>下单商品数 </p>
										<p>0</p>
									</td>
								</tr>
								<tr>
									<td>
										<p>平均价格 </p>
										<p>0.00元</p>
									</td>
									<td>
										<p>平均客单价 </p>
										<p>0.00元</p>
									</td>
									<td>
										<p>新增会员 </p>
										<p>0</p>
									</td>
									<td>
										<p>会员数量 </p>
										<p>0</p>
									</td>
								</tr>
								<tr>
									<td>
										<p>新增店铺 </p>
										<p>0</p>
									</td>
									<td>
										<p>店铺数量 </p>
										<p>0</p>
									</td>
									<td>
										<p>新增商品</p>
										<p>0</p>
									</td>
									<td>
										<p>商品数量</p>
										<p>2304</p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div class="container-fluid chart">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<h4>2017-07-17销售走势</h4>
						<div id="trendChart"></div>
					</div>
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div class="main-body container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-6">
						<table class="table table-striped">
							<thead>
								<tr>
									<th colspan="3">
										7日内店铺销售TOP30 
									</th>
								</tr>
								<tr>
									<th>序号</th>
									<th>店铺名称</th>
									<th>下单金额</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>***店铺</td>
									<td>￥100.00</td>
								</tr>
								<tr>
									<td>2</td>
									<td>***店铺</td>
									<td>￥100.00</td>
								</tr>
								<tr>
									<td>3</td>
									<td>***店铺</td>
									<td>￥100.00</td>
								</tr>
								<tr>
									<td>4</td>
									<td>***店铺</td>
									<td>￥100.00</td>
								</tr>
								<tr>
									<td>5</td>
									<td>***店铺</td>
									<td>￥100.00</td>
								</tr>
								<tr>
									<td>6</td>
									<td>***店铺</td>
									<td>￥100.00</td>
								</tr>
								<tr>
									<td>7</td>
									<td>***店铺</td>
									<td>￥100.00</td>
								</tr>
								<tr>
									<td>8</td>
									<td>***店铺</td>
									<td>￥100.00</td>
								</tr>
								<tr>
									<td>9</td>
									<td>***店铺</td>
									<td>￥100.00</td>
								</tr>
								<tr>
									<td>10</td>
									<td>***店铺</td>
									<td>￥100.00</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="3">
										<div class="paging-info pull-left">
											<span class="total" style="margin-right: 20px;">共有***条数据</span>
											<span class="">第1/**页</span>
										</div>
										<ul class="pagination navigation pull-right" style="margin: 0px;">
											<li><a href="#">首页</a></li>
											<li><a href="#">上一页</a></li>
											<li class="active"><a href="#">1</a></li> 
											<li><a href="#">下一页</a></li>
											<li><a href="#">尾页</a></li> 
										</ul>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
					<div class="col-sm-12 col-md-6">
						<table class="table table-striped">
							<thead>
								<tr>
									<th colspan="3">
										7日内店铺销售TOP30 
									</th>
								</tr>
								<tr>
									<th>序号</th>
									<th>商品名称</th>
									<th>销量</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>***商品</td>
									<td>10</td>
								</tr>
								<tr>
									<td>2</td>
									<td>***商品</td>
									<td>10</td>
								</tr>
								<tr>
									<td>3</td>
									<td>***商品</td>
									<td>10</td>
								</tr>
								<tr>
									<td>4</td>
									<td>***商品</td>
									<td>10</td>
								</tr>
								<tr>
									<td>5</td>
									<td>***商品</td>
									<td>10</td>
								</tr>
								<tr>
									<td>6</td>
									<td>***商品</td>
									<td>10</td>
								</tr>
								<tr>
									<td>7</td>
									<td>***商品</td>
									<td>10</td>
								</tr>
								<tr>
									<td>8</td>
									<td>***商品</td>
									<td>10</td>
								</tr>
								<tr>
									<td>9</td>
									<td>***商品</td>
									<td>10</td>
								</tr>
								<tr>
									<td>10</td>
									<td>***商品</td>
									<td>10</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="3">
										<div class="paging-info pull-left">
											<span class="total" style="margin-right: 20px;">共有***条数据</span>
											<span class="">第1/**页</span>
										</div>
										<ul class="pagination navigation pull-right" style="margin: 0px;">
											<li><a href="#">首页</a></li>
											<li><a href="#">上一页</a></li>
											<li class="active"><a href="#">1</a></li> 
											<li><a href="#">下一页</a></li>
											<li><a href="#">尾页</a></li> 
										</ul>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div style="height: 50px;width: 100%;"></div>
			
		</div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/chart/index.js"></script>
	
</body>