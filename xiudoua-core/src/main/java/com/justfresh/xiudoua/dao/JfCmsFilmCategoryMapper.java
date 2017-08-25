package com.justfresh.xiudoua.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfCmsFilmCategory;
import com.justfresh.xiudoua.model.JfCmsFilmCategoryExample;

public interface JfCmsFilmCategoryMapper {
    int countByExample(JfCmsFilmCategoryExample example);

    int deleteByExample(JfCmsFilmCategoryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(JfCmsFilmCategory record);

    int insertSelective(JfCmsFilmCategory record);

    List<JfCmsFilmCategory> selectByExample(JfCmsFilmCategoryExample example);

    JfCmsFilmCategory selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") JfCmsFilmCategory record, @Param("example") JfCmsFilmCategoryExample example);

    int updateByExample(@Param("record") JfCmsFilmCategory record, @Param("example") JfCmsFilmCategoryExample example);

    int updateByPrimaryKeySelective(JfCmsFilmCategory record);

    int updateByPrimaryKey(JfCmsFilmCategory record);
    
    /**
	 * 查询当前数据表最大ID
	 * @param example
	 * @return
	 */
	int selectMaxIdByExample(JfCmsFilmCategoryExample example);
	
	/**
	 * 分页查询
	 * 
	 * @param example
	 * @param params
	 * @return
	 */
	List<JfCmsFilmCategory> selectWithPageByExample(@Param("example") JfCmsFilmCategoryExample example,@Param("params") Map<String, String> params);
	
}