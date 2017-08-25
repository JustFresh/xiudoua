<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/admin/css.do"></jsp:include>
<link type="text/css" rel="stylesheet" href="<%=basePath %>assets/pagecss/admin/transaction/consult.css" />
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
								<li class="selected"><a href="javascript: void(0)"><i class="fa fa-cogs"></i> 管理</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-cog"></i> 设置</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-list"></i> 咨询类型</a></li>
								<li><a href="javascript: void(0)"><i class="fa fa-plus"></i> 新增类型</a></li>
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
								<label>
									咨询类型：
								</label>
								<select class="input-select" name="">
									<option value="10">--全部--</option>
									<option value="20">--商品咨询--</option>
									<option value="50">--支付问题--</option>
									<option value="100">--发票及保养--</option>
									<option value="100">--促销及赠品--</option>
								</select>
							</span>
							<span class="form-element">
								<label>咨询人：</label>
								<input type="text" class="input-text" name="" />
							</span>
							<span class="form-element">
								<label>咨询内容：</label>
								<input type="text" class="input-text" name="" />
							</span>
							<span class="form-element">
								<label>分页：</label>
								<select class="input-select" name="">
									<option value="10">--10--</option>
									<option value="20">--20--</option>
									<option value="50">--50--</option>
									<option value="100">--100--</option>
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
			
			<!-- JustFresh 2017-07-18 begin -->
			<div class="container-fluid consult-list">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<ul>
							<li>
								<h4>
									<input type="checkbox" name="consult" value="1" />
									<span class="object">咨询对象:  和平意式荞麦挂面380g</span>
									<span class="store">店铺名称: ***店</span>
									<span class="opt">
										<a href="javascript: void(0)" onclick="">删除</a>
									</span>
								</h4>
								<div class="ask-detail">
									<p>
										<span class="author">咨询人：游客</span>
										<span class="time">咨询时间: 2016-03-04 16:19:32</span>
									</p>
									<p>请问这个没有其他图片展示了么，我怎么知道产品保质期生产日期</p>
								</div>
								<div class="replay">
									<p>店主回复:</p>
									<p>亲，我们的图片都有拍出生产日期的，这款面的生产日期2015年11月15日哦。商品详情里有保质期12个月呢。</p>
								</div>
							</li>
							<li>
								<h4>
									<input type="checkbox" name="consult" value="1" />
									<span class="object">咨询对象:  和平意式荞麦挂面380g</span>
									<span class="store">店铺名称: ***店</span>
									<span class="opt">
										<a href="javascript: void(0)" onclick="">删除</a>
									</span>
								</h4>
								<div class="ask-detail">
									<p>
										<span class="author">咨询人：游客</span>
										<span class="time">咨询时间: 2016-03-04 16:19:32</span>
									</p>
									<p>请问这个没有其他图片展示了么，我怎么知道产品保质期生产日期</p>
								</div>
								<div class="replay">
									<p>店主回复:</p>
									<p>亲，我们的图片都有拍出生产日期的，这款面的生产日期2015年11月15日哦。商品详情里有保质期12个月呢。</p>
								</div>
							</li>
							<li>
								<h4>
									<input type="checkbox" name="consult" value="1" />
									<span class="object">咨询对象:  和平意式荞麦挂面380g</span>
									<span class="store">店铺名称: ***店</span>
									<span class="opt">
										<a href="javascript: void(0)" onclick="">删除</a>
									</span>
								</h4>
								<div class="ask-detail">
									<p>
										<span class="author">咨询人：游客</span>
										<span class="time">咨询时间: 2016-03-04 16:19:32</span>
									</p>
									<p>请问这个没有其他图片展示了么，我怎么知道产品保质期生产日期</p>
								</div>
								<div class="replay">
									<p>店主回复:</p>
									<p>亲，我们的图片都有拍出生产日期的，这款面的生产日期2015年11月15日哦。商品详情里有保质期12个月呢。</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- JustFresh 2017-07-18 end -->
			
			<div class="container-fluid paging">
				<div class="row">
					<div class="col-sm-12 col-md-12">
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