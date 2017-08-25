<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/chart/memberChart.css" />
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
								<li class="selected"><a href="javascript: void(0)"><i class="fa fa-plus"></i> 新增会员</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-user"></i> 会员分析</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-line-chart"></i> 会员规模分析</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-area-chart"></i> 区域分析</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-money"></i> 购买分析</a></li>
							</ul>
							<div class="opts pull-right">
								
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			
			<!--  JustFresh 2017-07-14 begin 条件查询部分 -->
			<div class="container-fluid conditions">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<form class="search-form pull-right">
							<span class="form-element">
								<select class="input-select" name="">
									<option value="10">按照天统计</option>
									<option value="20">按照周统计</option>
									<option value="50">按照月统计</option>
								</select>
							</span>
							<span class="form-element">
								<select class="input-select" name="">
									<option>2010</option>
									<option>2011</option>
									<option>2012</option>
									<option selected>2017</option>
								</select>
							</span>
							<span class="form-element">
								<select class="input-select" name="">
									<option>01</option>
									<option>02</option>
									<option>03</option>
									<option selected>07</option>
								</select>
							</span>
							<span class="form-element">
								<button type="submit" class="btn btn-warning"><i class="fa fa-search"></i> 搜索</button>
							</span>
						</form>
					</div>
				</div>
			</div>
			<!--  JustFresh 2017-07-14 end 条件查询部分 -->
			<div class="clearfix"></div>
			
			<div class="container-fluid chart">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div id="memberChart"></div>
					</div>
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div class="main-body container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<table class="table table-striped">
							<thead>
								<tr>
									<th colspan="6">
										7日内店铺销售TOP30 
										<div class="pull-right">
											<a href="javascript: void(0)" class="btn btn-default btn-sm">
												<i class="fa fa-file-excel-o"></i> 导出Excel
											</a>
										</div>
									</th>
								</tr>
								<tr>
									<th>日期</th>
									<th>上月</th>
									<th>本月</th>
									<th>同比</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>12</td>
									<td>15</td>
									<td>25%</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-info">查看</a>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>12</td>
									<td>15</td>
									<td>25%</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-info">查看</a>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>12</td>
									<td>15</td>
									<td>25%</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-info">查看</a>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>12</td>
									<td>15</td>
									<td>25%</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-info">查看</a>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>12</td>
									<td>15</td>
									<td>25%</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-info">查看</a>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>12</td>
									<td>15</td>
									<td>25%</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-info">查看</a>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>12</td>
									<td>15</td>
									<td>25%</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-info">查看</a>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>12</td>
									<td>15</td>
									<td>25%</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-info">查看</a>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td>12</td>
									<td>15</td>
									<td>25%</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-info">查看</a>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="6">
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
	<script type="text/javascript" src="<%=basePath %>assets/pagejs/admin/chart/memberChart.js"></script>
	
</body>