package com.sl.example.service;

import com.sl.example.dao.ModelMapper;
import com.sl.example.dao.QsnMapper;
import com.sl.example.pojo.Model;
import com.sl.example.pojo.Qsn;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("qsnService")
@Transactional
public class QsnServiceImpl implements QsnService{

    @Resource
    private QsnMapper qsnMapper;
    @Override
    public List<Qsn> findQsnList(String modelId) {
        return qsnMapper.selectQsnList(modelId);
    }

    @Override
    public int deleteModel2Qsn(String modelId) {
        return qsnMapper.deleteByModelId(modelId);
    }

    @Override
    public short findMaxOrderNum(String modelId) {
        return qsnMapper.selectMaxOrderNum(modelId);
    }

    @Override
    public Qsn findByOrderNum(short orderNum, String modelId) {
        return qsnMapper.selectByOrderNum(orderNum,modelId);
    }

    @Override
    public Qsn findByContent(String content) {
        return qsnMapper.selectByContent(content);
    }

    @Override
    public int InsertQsn(Qsn qsn) {
        return qsnMapper.insertSelective(qsn);
    }

    @Override
    public int deleteByQsnId(String qsnId) {
        return qsnMapper.deleteByPrimaryKey(qsnId);
    }
}
