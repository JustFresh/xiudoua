package com.justfresh.xiudoua.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfMessages;
import com.justfresh.xiudoua.model.JfMessagesExample;

public interface JfMessagesMapper {
    int countByExample(JfMessagesExample example);

    int deleteByExample(JfMessagesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(JfMessages record);

    int insertSelective(JfMessages record);

    List<JfMessages> selectByExample(JfMessagesExample example);

    JfMessages selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") JfMessages record, @Param("example") JfMessagesExample example);

    int updateByExample(@Param("record") JfMessages record, @Param("example") JfMessagesExample example);

    int updateByPrimaryKeySelective(JfMessages record);

    int updateByPrimaryKey(JfMessages record);
    
    /**
	 * 查询当前数据表最大ID
	 * @param example
	 * @return
	 */
	int selectMaxIdByExample(JfMessagesExample example);
	
	/**
	 * 分页查询
	 * 
	 * @param example
	 * @param params
	 * @return
	 */
	List<JfMessages> selectWithPageByExample(@Param("example") JfMessagesExample example,@Param("params") Map<String, String> params);
    
}