package com.sl.example.service;

import com.sl.example.pojo.Choose;

import java.util.List;

public interface ChooseService {
    public List<Choose> findChooseByModelId(String modelId);

    List<Choose> countDataBy2Id(String qsnId,String detailId);

    public int InsertChoose(Choose record);

    List<Choose> findByQsnId(String qsnId);
}
