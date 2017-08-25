package com.justfresh.xiudoua.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfLinks;
import com.justfresh.xiudoua.model.JfLinksExample;

public interface JfLinksMapper {
    int countByExample(JfLinksExample example);

    int deleteByExample(JfLinksExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(JfLinks record);

    int insertSelective(JfLinks record);

    List<JfLinks> selectByExample(JfLinksExample example);

    JfLinks selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") JfLinks record, @Param("example") JfLinksExample example);

    int updateByExample(@Param("record") JfLinks record, @Param("example") JfLinksExample example);

    int updateByPrimaryKeySelective(JfLinks record);

    int updateByPrimaryKey(JfLinks record);
    
    /**
	 * 查询当前数据表最大ID
	 * @param example
	 * @return
	 */
	int selectMaxIdByExample(JfLinksExample example);
	
	/**
	 * 分页查询
	 * 
	 * @param example
	 * @param params
	 * @return
	 */
	List<JfLinks> selectWithPageByExample(@Param("example") JfLinksExample example,@Param("params") Map<String, String> params);
	
}