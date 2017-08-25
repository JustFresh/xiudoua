package com.justfresh.xiudoua.dao;

import com.justfresh.xiudoua.model.JfCmsContentExt;
import com.justfresh.xiudoua.model.JfCmsContentExtExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface JfCmsContentExtMapper {
    int countByExample(JfCmsContentExtExample example);

    int deleteByExample(JfCmsContentExtExample example);

    int deleteByPrimaryKey(Integer contentId);

    int insert(JfCmsContentExt record);

    int insertSelective(JfCmsContentExt record);

    List<JfCmsContentExt> selectByExampleWithBLOBs(JfCmsContentExtExample example);

    List<JfCmsContentExt> selectByExample(JfCmsContentExtExample example);

    JfCmsContentExt selectByPrimaryKey(Integer contentId);

    int updateByExampleSelective(@Param("record") JfCmsContentExt record, @Param("example") JfCmsContentExtExample example);

    int updateByExampleWithBLOBs(@Param("record") JfCmsContentExt record, @Param("example") JfCmsContentExtExample example);

    int updateByExample(@Param("record") JfCmsContentExt record, @Param("example") JfCmsContentExtExample example);

    int updateByPrimaryKeySelective(JfCmsContentExt record);

    int updateByPrimaryKeyWithBLOBs(JfCmsContentExt record);

    int updateByPrimaryKey(JfCmsContentExt record);
}