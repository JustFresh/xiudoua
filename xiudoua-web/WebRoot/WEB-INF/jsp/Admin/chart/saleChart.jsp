<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/chart/saleChart.css" />
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
								<li class="selected"><a href="javascript: void(0)"><i class="fa fa-line-chart"></i> 销售收入统计</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-line-chart"></i> 预存款统计</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-line-chart"></i> 订单统计</a></li>
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
								<label>年份：</label>
								<select class="input-select" name="">
									<option>2010</option>
									<option>2011</option>
									<option>2012</option>
									<option selected>2017</option>
								</select>
							</span>
							<span class="form-element">
								<label>月份：</label>
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
			
			<div class="container-fluid total-info">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<h4>
							<span><b>收款金额：</b>0.00元</span>
							<span><b>退款金额：</b>0.00元</span>
							<span><b>实收金额：</b>0.00元</span>
							<span><b>佣金总额：</b>0.00元</span>
							<span><b>店铺费用：</b>0.00元</span>
							<span><b>总收入：</b>0.00元</span>
						</h4>
					</div>
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div class="main-body container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th colspan="10">
										<div class="pull-right">
											<a href="javascript: void(0)" class="btn btn-default btn-sm">
												<i class="fa fa-file-excel-o"></i> 导出Excel
											</a>
										</div>
									</th>
								</tr>
								<tr>
									<th>店铺名称</th>
									<th>卖家账号</th>
									<th>订单金额</th>
									<th>收取佣金</th>
									<th>退单金额</th>
									<th>退回佣金</th>
									<th>店铺费用</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" name="checkall" value="" /></td>
									<td>
										<input type="text" value="1" name="" style="width: 50px;"/>
									</td>
									<td>
										<input type="text" value="分类一" name="" />
									</td>
									<td>&nbsp;</td>
									<td><img src="<%=basePath %>assets/images/logo.png" title="***网站" style="height: 30px;"/></td>
									<td>图片</td>
									<td><i class="fa fa-check"></i></td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-danger">禁用</a>
										<a href="#" class="btn-outline btn-outline-success">编辑</a>
										<a href="#" class="btn-outline btn-outline-danger">删除</a>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="10">
										<div class="paging-info pull-left">
											<span class="total" style="margin-right: 20px;">共有***条数据</span>
											<span class="">第1/**页</span>
										</div>
										<ul class="pagination navigation pull-right" style="margin: 0px;">
											<li><a href="#">首页</a></li>
											<li><a href="#">上一页</a></li>
											<li class="active"><a href="#">1</a></li> 
											<li><a href="#">2</a></li> 
											<li><a href="#">3</a></li> 
											<li><a href="#">4</a></li>
											<li><a href="#">5</a></li> 
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
			
			<!-- JustFresh 底部操作按钮列表部分 -->
			<div class="clearfix"></div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="bottom-opts">
							<span class="opt-btn">
								<input type="checkbox" name="checkall" onclick="changeCheckboxStatus('adsIds')" />
								<a href="javascript: void(0)" class="btn btn-default btn-sm">批量删除</a>
							</span>
						</div>
					</div>
				</div>
			</div>
			
			<div class="clearfix"></div>
			<div style="height: 50px;width: 100%;"></div>
			
		</div>
	</div>
	<jsp:include page="/admin/js.do"></jsp:include>
</body>