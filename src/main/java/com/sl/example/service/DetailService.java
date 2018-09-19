package com.sl.example.service;

import com.sl.example.pojo.Detail;
import com.sl.example.pojo.Qsn;

import java.util.List;


public interface DetailService {
    public List<Detail> findOptionList(String qsnId);

    public Detail findAskAnswer(String qsnId);

    public int insertDetail(Detail detail);

    public int deleteOptionsByQsnId(String qsnId);
}
