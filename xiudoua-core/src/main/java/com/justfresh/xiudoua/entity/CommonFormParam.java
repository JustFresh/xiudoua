package com.justfresh.xiudoua.entity;

import java.util.HashMap;
import java.util.Map;

public class CommonFormParam {
	
	private int page;
	
	private int rows;
	
	private String sort;
	
	private String order;
	
	private String ids;
	
	private String q;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map<String, String> getParams() {
		Map<String, String> params = new HashMap();
		if ((this.page != 0) && (this.rows != 0)) {
			int start = (this.page - 1) * this.rows;
			int end = start + this.rows;
			params.put("rowStart", start + "");
			params.put("rowEnd", end + "");
			params.put("pageSize", this.rows + "");
		}
		if ((this.order != null) && (!"".equals(this.order))) {
			params.put("order", this.order);
		}
		return params;
	}

	public int getPage() {
		return this.page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return this.rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String getSort() {
		return this.sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return this.order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getIds() {
		return this.ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getQ() {
		return this.q;
	}

	public void setQ(String q) {
		this.q = q;
	}

}
