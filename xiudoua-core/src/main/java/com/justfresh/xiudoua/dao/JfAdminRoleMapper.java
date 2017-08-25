package com.justfresh.xiudoua.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfAdminRole;
import com.justfresh.xiudoua.model.JfAdminRoleExample;

public interface JfAdminRoleMapper {
    int countByExample(JfAdminRoleExample example);

    int deleteByExample(JfAdminRoleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(JfAdminRole record);

    int insertSelective(JfAdminRole record);

    List<JfAdminRole> selectByExample(JfAdminRoleExample example);

    JfAdminRole selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") JfAdminRole record, @Param("example") JfAdminRoleExample example);

    int updateByExample(@Param("record") JfAdminRole record, @Param("example") JfAdminRoleExample example);

    int updateByPrimaryKeySelective(JfAdminRole record);

    int updateByPrimaryKey(JfAdminRole record);
    
    /**
	 * 查询当前数据表最大ID
	 * @param example
	 * @return
	 */
	int selectMaxIdByExample(JfAdminRoleExample example);
	
	/**
	 * 分页查询
	 * 
	 * @param example
	 * @param params
	 * @return
	 */
	List<JfAdminRole> selectWithPageByExample(@Param("example") JfAdminRoleExample example,@Param("params") Map<String, String> params);
	
}