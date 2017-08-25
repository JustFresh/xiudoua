package com.justfresh.xiudoua.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfSettings;
import com.justfresh.xiudoua.model.JfSettingsExample;

public interface JfSettingsMapper {
    int countByExample(JfSettingsExample example);

    int deleteByExample(JfSettingsExample example);

    int deleteByPrimaryKey(String name);

    int insert(JfSettings record);

    int insertSelective(JfSettings record);

    List<JfSettings> selectByExample(JfSettingsExample example);

    JfSettings selectByPrimaryKey(String name);

    int updateByExampleSelective(@Param("record") JfSettings record, @Param("example") JfSettingsExample example);

    int updateByExample(@Param("record") JfSettings record, @Param("example") JfSettingsExample example);

    int updateByPrimaryKeySelective(JfSettings record);

    int updateByPrimaryKey(JfSettings record);
	
	/**
	 * 分页查询
	 * 
	 * @param example
	 * @param params
	 * @return
	 */
	List<JfSettings> selectWithPageByExample(@Param("example") JfSettingsExample example,@Param("params") Map<String, String> params);
	
}