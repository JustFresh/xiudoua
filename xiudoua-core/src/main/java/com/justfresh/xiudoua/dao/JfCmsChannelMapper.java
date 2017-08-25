package com.justfresh.xiudoua.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfCmsChannel;
import com.justfresh.xiudoua.model.JfCmsChannelExample;

public interface JfCmsChannelMapper {
    int countByExample(JfCmsChannelExample example);

    int deleteByExample(JfCmsChannelExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(JfCmsChannel record);

    int insertSelective(JfCmsChannel record);

    List<JfCmsChannel> selectByExample(JfCmsChannelExample example);

    JfCmsChannel selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") JfCmsChannel record, @Param("example") JfCmsChannelExample example);

    int updateByExample(@Param("record") JfCmsChannel record, @Param("example") JfCmsChannelExample example);

    int updateByPrimaryKeySelective(JfCmsChannel record);

    int updateByPrimaryKey(JfCmsChannel record);
    
    /**
	 * 查询当前数据表最大ID
	 * @param example
	 * @return
	 */
	int selectMaxIdByExample(JfCmsChannelExample example);
	
	/**
	 * 分页查询
	 * 
	 * @param example
	 * @param params
	 * @return
	 */
	List<JfCmsChannel> selectWithPageByExample(@Param("example") JfCmsChannelExample example,@Param("params") Map<String, String> params);
	
}