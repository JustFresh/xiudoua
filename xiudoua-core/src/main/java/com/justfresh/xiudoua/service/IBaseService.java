package com.justfresh.xiudoua.service;

import java.util.List;

import com.justfresh.xiudoua.entity.Page;

public abstract interface IBaseService<T> {
	
	public int add(T param) throws Exception;
	
	public int delete(T param) throws Exception;
	
	public int update(T param) throws Exception;
	
	public T getOne(T param) throws Exception;
	
	public List<T> getList(T param) throws Exception;
	
	public Page<T> page(T param) throws Exception;
	
}
