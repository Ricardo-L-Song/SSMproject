package com.sl.example.dao;

import com.sl.example.pojo.Choose;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ChooseMapper {
    int deleteByPrimaryKey(String psgQsnRId);

    int insert(Choose record);

    int insertSelective(Choose record);

    Choose selectByPrimaryKey(String psgQsnRId);

    List<Choose> selectByModelId(String modelId);

    List<Choose> selectByQsnIdDetailId(@Param("qsnId")String qsnId, @Param("detailId")String detailId);

    int updateByPrimaryKeySelective(Choose record);

    int updateByPrimaryKey(Choose record);

    List<Choose> selectByQsnId(String qsnId);
}