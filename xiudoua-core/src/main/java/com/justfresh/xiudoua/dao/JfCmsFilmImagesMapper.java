package com.justfresh.xiudoua.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfCmsFilmImages;
import com.justfresh.xiudoua.model.JfCmsFilmImagesExample;

public interface JfCmsFilmImagesMapper {
    int countByExample(JfCmsFilmImagesExample example);

    int deleteByExample(JfCmsFilmImagesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(JfCmsFilmImages record);

    int insertSelective(JfCmsFilmImages record);

    List<JfCmsFilmImages> selectByExample(JfCmsFilmImagesExample example);

    JfCmsFilmImages selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") JfCmsFilmImages record, @Param("example") JfCmsFilmImagesExample example);

    int updateByExample(@Param("record") JfCmsFilmImages record, @Param("example") JfCmsFilmImagesExample example);

    int updateByPrimaryKeySelective(JfCmsFilmImages record);

    int updateByPrimaryKey(JfCmsFilmImages record);
    
    /**
	 * 查询当前数据表最大ID
	 * @param example
	 * @return
	 */
	int selectMaxIdByExample(JfCmsFilmImagesExample example);
	
}