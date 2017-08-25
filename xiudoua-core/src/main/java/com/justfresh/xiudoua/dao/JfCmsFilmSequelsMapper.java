package com.justfresh.xiudoua.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfCmsFilmSequels;
import com.justfresh.xiudoua.model.JfCmsFilmSequelsExample;

public interface JfCmsFilmSequelsMapper {
    int countByExample(JfCmsFilmSequelsExample example);

    int deleteByExample(JfCmsFilmSequelsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(JfCmsFilmSequels record);

    int insertSelective(JfCmsFilmSequels record);

    List<JfCmsFilmSequels> selectByExample(JfCmsFilmSequelsExample example);

    JfCmsFilmSequels selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") JfCmsFilmSequels record, @Param("example") JfCmsFilmSequelsExample example);

    int updateByExample(@Param("record") JfCmsFilmSequels record, @Param("example") JfCmsFilmSequelsExample example);

    int updateByPrimaryKeySelective(JfCmsFilmSequels record);

    int updateByPrimaryKey(JfCmsFilmSequels record);
    
    /**
   	 * 查询当前数据表最大ID
   	 * @param example
   	 * @return
   	 */
   	int selectMaxIdByExample(JfCmsFilmSequelsExample example);
   	
}