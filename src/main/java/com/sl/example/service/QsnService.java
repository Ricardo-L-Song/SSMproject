package com.sl.example.service;

import com.sl.example.pojo.Model;
import com.sl.example.pojo.Qsn;

import java.util.List;

public interface QsnService {
    public List<Qsn> findQsnList(String modelId);

    public int deleteModel2Qsn(String modelId);

    public short findMaxOrderNum(String modelId);

    public Qsn findByOrderNum(short orderNum,String modelId);

    public Qsn findByContent(String content);

    public int InsertQsn(Qsn qsn);

    public int deleteByQsnId(String qsnId);
}
