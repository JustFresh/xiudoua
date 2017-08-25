package com.justfresh.xiudoua.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfCmsAdsPlace;
import com.justfresh.xiudoua.model.JfCmsAdsPlaceExample;

public interface JfCmsAdsPlaceMapper {
    int countByExample(JfCmsAdsPlaceExample example);

    int deleteByExample(JfCmsAdsPlaceExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(JfCmsAdsPlace record);

    int insertSelective(JfCmsAdsPlace record);

    List<JfCmsAdsPlace> selectByExample(JfCmsAdsPlaceExample example);

    JfCmsAdsPlace selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") JfCmsAdsPlace record, @Param("example") JfCmsAdsPlaceExample example);

    int updateByExample(@Param("record") JfCmsAdsPlace record, @Param("example") JfCmsAdsPlaceExample example);

    int updateByPrimaryKeySelective(JfCmsAdsPlace record);

    int updateByPrimaryKey(JfCmsAdsPlace record);
    
    /**
	 * 查询当前数据表最大ID
	 * @param example
	 * @return
	 */
	int selectMaxIdByExample(JfCmsAdsPlaceExample example);
	
	/**
	 * 分页查询
	 * 
	 * @param example
	 * @param params
	 * @return
	 */
	List<JfCmsAdsPlace> selectWithPageByExample(@Param("example") JfCmsAdsPlaceExample example,@Param("params") Map<String, String> params);
	
}