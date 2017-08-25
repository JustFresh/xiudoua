<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/transaction/comment.css" />
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
								<li class="selected"><a href="javascript: void(0)"><i class="fa fa-comment"></i> 来自买家的评价</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-comment-o"></i> 店铺动态评价</a></li>
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
								<label>商品名称：</label>
								<input type="text" class="input-text" name="" />
							</span>
							<span class="form-element">
								<label>店铺名称：</label>
								<input type="text" class="input-text" name="" />
							</span>
							<span class="form-element">
								<label>评价时间：</label>
								<input type="text" class="input-text" name="" id="beginTime" /> ~ 
								<input type="text" class="input-text" name="" id="endTime" />
							</span>
							<span class="form-element">
								<button type="submit" class="btn btn-warning"><i class="fa fa-search"></i> 搜索</button>
							</span>
						</form>
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
									<th colspan="10">
										<div class="pull-left">
											订单总额共计：10016.07元
										</div>
										<div class="pull-right">
											<a href="javascript: void(0)" class="btn btn-default btn-sm">
												<i class="fa fa-file-excel-o"></i> 导出Excel
											</a>
										</div>
									</th>
								</tr>
								<tr>
									<th>产品名称</th>
									<th>评价描述</th>
									<th>评价时间</th>
									<th>评价人</th>
									<th>店铺名称</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>农夫山泉 380ml</td>
									<td>
										商品评分：
										<i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i> 
									</td>
									<td>2016-09-09 10:54</td>
									<td>JustFresh</td>
									<td>***店铺</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-success">查看</a>
										<a href="#" class="btn-outline btn-outline-danger">取消</a>
										<a href="#" class="btn-outline btn-outline-info">收到货款</a>
									</td>
								</tr>
								<tr>
									<td>农夫山泉 380ml</td>
									<td>
										商品评分：
										<i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i> 
									</td>
									<td>2016-09-09 10:54</td>
									<td>JustFresh</td>
									<td>***店铺</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-success">查看</a>
										<a href="#" class="btn-outline btn-outline-danger">取消</a>
										<a href="#" class="btn-outline btn-outline-info">收到货款</a>
									</td>
								</tr>
								<tr>
									<td>农夫山泉 380ml</td>
									<td>
										商品评分：
										<i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i> 
									</td>
									<td>2016-09-09 10:54</td>
									<td>JustFresh</td>
									<td>***店铺</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-success">查看</a>
										<a href="#" class="btn-outline btn-outline-danger">取消</a>
										<a href="#" class="btn-outline btn-outline-info">收到货款</a>
									</td>
								</tr>
								<tr>
									<td>农夫山泉 380ml</td>
									<td>
										商品评分：
										<i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i> 
									</td>
									<td>2016-09-09 10:54</td>
									<td>JustFresh</td>
									<td>***店铺</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-success">查看</a>
										<a href="#" class="btn-outline btn-outline-danger">取消</a>
										<a href="#" class="btn-outline btn-outline-info">收到货款</a>
									</td>
								</tr>
								<tr>
									<td>农夫山泉 380ml</td>
									<td>
										商品评分：
										<i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i> 
									</td>
									<td>2016-09-09 10:54</td>
									<td>JustFresh</td>
									<td>***店铺</td>
									<td width="200px">
										<a href="#" class="btn-outline btn-outline-success">查看</a>
										<a href="#" class="btn-outline btn-outline-danger">取消</a>
										<a href="#" class="btn-outline btn-outline-info">收到货款</a>
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
	
	<script type="text/javascript">
	$(function () {
        $("#beginTime").jeDate({format:"YYYY-MM-DD hh:mm",isTime:true});
        $("#endTime").jeDate({format:"YYYY-MM-DD hh:mm",isTime:true});
    }); 
	</script>
</body>