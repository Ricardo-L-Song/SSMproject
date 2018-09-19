package com.sl.example.dao;

import com.sl.example.pojo.Model;
import com.sl.example.pojo.Qsn;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QsnMapper {
    int deleteByPrimaryKey(String qsnId);

    int insert(Qsn record);

    int insertSelective(Qsn record);

    Qsn selectByPrimaryKey(String qsnId);

    Qsn selectByOrderNum(@Param("orderNum")short orderNum,@Param("modelId")String modelId);

    Qsn selectByContent(String content);

    List<Qsn> selectQsnList(String modelId);

    short selectMaxOrderNum(String modelId);

    int deleteByModelId(String modelId);

    int updateByPrimaryKeySelective(Qsn record);

    int updateByPrimaryKey(Qsn record);
}