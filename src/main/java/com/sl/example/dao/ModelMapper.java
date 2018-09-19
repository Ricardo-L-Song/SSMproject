package com.sl.example.dao;

import com.sl.example.pojo.Model;

import java.util.List;

public interface ModelMapper {
    int deleteByPrimaryKey(String modelId);

    int deleteByIds(String[] list);

    int insert(Model record);

    int insertSelective(Model record);

    Model selectByPrimaryKey(String modelId);

    List<Model> selectAllModel();

    int updateByPrimaryKeySelective(Model record);

    int updateByPrimaryKey(Model record);
}