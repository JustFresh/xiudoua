package com.justfresh.xiudoua.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.justfresh.xiudoua.model.JfNotices;
import com.justfresh.xiudoua.model.JfNoticesExample;

public interface JfNoticesMapper {
    int countByExample(JfNoticesExample example);

    int deleteByExample(JfNoticesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(JfNotices record);

    int insertSelective(JfNotices record);

    List<JfNotices> selectByExampleWithBLOBs(JfNoticesExample example);

    List<JfNotices> selectByExample(JfNoticesExample example);

    JfNotices selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") JfNotices record, @Param("example") JfNoticesExample example);

    int updateByExampleWithBLOBs(@Param("record") JfNotices record, @Param("example") JfNoticesExample example);

    int updateByExample(@Param("record") JfNotices record, @Param("example") JfNoticesExample example);

    int updateByPrimaryKeySelective(JfNotices record);

    int updateByPrimaryKeyWithBLOBs(JfNotices record);

    int updateByPrimaryKey(JfNotices record);
    
    /**
	 * 查询当前数据表最大ID
	 * @param example
	 * @return
	 */
	int selectMaxIdByExample(JfNoticesExample example);
	
	/**
	 * 分页查询
	 * 
	 * @param example
	 * @param params
	 * @return
	 */
	List<JfNotices> selectWithPageByExample(@Param("example") JfNoticesExample example,@Param("params") Map<String, String> params);
	
}