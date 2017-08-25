package com.justfresh.xiudoua.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfCmsFilm;
import com.justfresh.xiudoua.model.JfCmsFilmExample;

public interface JfCmsFilmMapper {
    int countByExample(JfCmsFilmExample example);

    int deleteByExample(JfCmsFilmExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(JfCmsFilm record);

    int insertSelective(JfCmsFilm record);

    List<JfCmsFilm> selectByExampleWithBLOBs(JfCmsFilmExample example);

    List<JfCmsFilm> selectByExample(JfCmsFilmExample example);

    JfCmsFilm selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") JfCmsFilm record, @Param("example") JfCmsFilmExample example);

    int updateByExampleWithBLOBs(@Param("record") JfCmsFilm record, @Param("example") JfCmsFilmExample example);

    int updateByExample(@Param("record") JfCmsFilm record, @Param("example") JfCmsFilmExample example);

    int updateByPrimaryKeySelective(JfCmsFilm record);

    int updateByPrimaryKeyWithBLOBs(JfCmsFilm record);

    int updateByPrimaryKey(JfCmsFilm record);
    
    /**
	 * 查询当前数据表最大ID
	 * @param example
	 * @return
	 */
	int selectMaxIdByExample(JfCmsFilmExample example);
	
	/**
	 * 分页查询
	 * 
	 * @param example
	 * @param params
	 * @return
	 */
	List<JfCmsFilm> selectWithPageByExample(@Param("example") JfCmsFilmExample example,@Param("params") Map<String, String> params);
	
}