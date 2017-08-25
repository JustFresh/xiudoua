package com.justfresh.xiudoua.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfCmsContent;
import com.justfresh.xiudoua.model.JfCmsContentExample;

public interface JfCmsContentMapper {
    int countByExample(JfCmsContentExample example);

    int deleteByExample(JfCmsContentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(JfCmsContent record);

    int insertSelective(JfCmsContent record);

    List<JfCmsContent> selectByExample(JfCmsContentExample example);

    JfCmsContent selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") JfCmsContent record, @Param("example") JfCmsContentExample example);

    int updateByExample(@Param("record") JfCmsContent record, @Param("example") JfCmsContentExample example);

    int updateByPrimaryKeySelective(JfCmsContent record);

    int updateByPrimaryKey(JfCmsContent record);
    
    /**
	 * 查询当前数据表最大ID
	 * @param example
	 * @return
	 */
	int selectMaxIdByExample(JfCmsContentExample example);
	
	/**
	 * 分页查询
	 * 
	 * @param example
	 * @param params
	 * @return
	 */
	List<JfCmsContent> selectWithPageByExample(@Param("example") JfCmsContentExample example,@Param("params") Map<String, String> params);
	
}