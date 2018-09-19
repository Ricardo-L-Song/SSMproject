package com.sl.example.service;

import com.sl.example.dao.ChooseMapper;
import com.sl.example.dao.ModelMapper;
import com.sl.example.pojo.Choose;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("chooseService")
@Transactional
public class ChooseServiceImpl implements ChooseService{

    @Resource
    private ChooseMapper chooseMapper;
    @Override
    public List<Choose> findChooseByModelId(String modelId) {
        return chooseMapper.selectByModelId(modelId);
    }

    @Override
    public List<Choose> countDataBy2Id(String qsnId, String detailId) {
        return chooseMapper.selectByQsnIdDetailId(qsnId,detailId);
    }

    @Override
    public int InsertChoose(Choose record) {
        return chooseMapper.insertSelective(record);
    }

    @Override
    public List<Choose> findByQsnId(String qsnId) {
        return chooseMapper.selectByQsnId(qsnId);
    }
}
