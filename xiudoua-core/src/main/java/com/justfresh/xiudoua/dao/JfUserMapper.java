package com.justfresh.xiudoua.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfUser;
import com.justfresh.xiudoua.model.JfUserExample;

public interface JfUserMapper {
    int countByExample(JfUserExample example);

    int deleteByExample(JfUserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(JfUser record);

    int insertSelective(JfUser record);

    List<JfUser> selectByExample(JfUserExample example);

    JfUser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") JfUser record, @Param("example") JfUserExample example);

    int updateByExample(@Param("record") JfUser record, @Param("example") JfUserExample example);

    int updateByPrimaryKeySelective(JfUser record);

    int updateByPrimaryKey(JfUser record);
    
    /**
	 * 查询当前数据表最大ID
	 * @param example
	 * @return
	 */
	int selectMaxIdByExample(JfUserExample example);
	
	/**
	 * 分页查询
	 * 
	 * @param example
	 * @param params
	 * @return
	 */
	List<JfUser> selectWithPageByExample(@Param("example") JfUserExample example,@Param("params") Map<String, String> params);
	
}