package com.justfresh.xiudoua.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfSeo;
import com.justfresh.xiudoua.model.JfSeoExample;

public interface JfSeoMapper {
    int countByExample(JfSeoExample example);

    int deleteByExample(JfSeoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(JfSeo record);

    int insertSelective(JfSeo record);

    List<JfSeo> selectByExampleWithBLOBs(JfSeoExample example);

    List<JfSeo> selectByExample(JfSeoExample example);

    JfSeo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") JfSeo record, @Param("example") JfSeoExample example);

    int updateByExampleWithBLOBs(@Param("record") JfSeo record, @Param("example") JfSeoExample example);

    int updateByExample(@Param("record") JfSeo record, @Param("example") JfSeoExample example);

    int updateByPrimaryKeySelective(JfSeo record);

    int updateByPrimaryKeyWithBLOBs(JfSeo record);

    int updateByPrimaryKey(JfSeo record);
    
    /**
	 * 查询当前数据表最大ID
	 * @param example
	 * @return
	 */
	int selectMaxIdByExample(JfSeoExample example);
	
	/**
	 * 分页查询
	 * 
	 * @param example
	 * @param params
	 * @return
	 */
	List<JfSeo> selectWithPageByExample(@Param("example") JfSeoExample example,@Param("params") Map<String, String> params);
	
}