package com.justfresh.xiudoua.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfAdmin;
import com.justfresh.xiudoua.model.JfAdminExample;

public interface JfAdminMapper {
    int countByExample(JfAdminExample example);

    int deleteByExample(JfAdminExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(JfAdmin record);

    int insertSelective(JfAdmin record);

    List<JfAdmin> selectByExample(JfAdminExample example);

    JfAdmin selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") JfAdmin record, @Param("example") JfAdminExample example);

    int updateByExample(@Param("record") JfAdmin record, @Param("example") JfAdminExample example);

    int updateByPrimaryKeySelective(JfAdmin record);

    int updateByPrimaryKey(JfAdmin record);
    
    /**
	 * 查询当前数据表最大ID
	 * @param example
	 * @return
	 */
	int selectMaxIdByExample(JfAdminExample example);
	
	/**
	 * 分页查询
	 * 
	 * @param example
	 * @param params
	 * @return
	 */
	List<JfAdmin> selectWithPageByExample(@Param("example") JfAdminExample example,@Param("params") Map<String, String> params);
	
}