package com.justfresh.xiudoua.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfCmsAds;
import com.justfresh.xiudoua.model.JfCmsAdsExample;

public interface JfCmsAdsMapper {
    int countByExample(JfCmsAdsExample example);

    int deleteByExample(JfCmsAdsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(JfCmsAds record);

    int insertSelective(JfCmsAds record);

    List<JfCmsAds> selectByExample(JfCmsAdsExample example);

    JfCmsAds selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") JfCmsAds record, @Param("example") JfCmsAdsExample example);

    int updateByExample(@Param("record") JfCmsAds record, @Param("example") JfCmsAdsExample example);

    int updateByPrimaryKeySelective(JfCmsAds record);

    int updateByPrimaryKey(JfCmsAds record);
    
    /**
	 * 查询当前数据表最大ID
	 * @param example
	 * @return
	 */
	int selectMaxIdByExample(JfCmsAdsExample example);
	
	/**
	 * 分页查询
	 * 
	 * @param example
	 * @param params
	 * @return
	 */
	List<JfCmsAds> selectWithPageByExample(@Param("example") JfCmsAdsExample example,@Param("params") Map<String, String> params);
	
}