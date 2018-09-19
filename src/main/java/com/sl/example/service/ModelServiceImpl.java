package com.sl.example.service;

import com.sl.example.dao.ModelMapper;
import com.sl.example.pojo.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("modelService")
@Transactional
public class ModelServiceImpl implements ModelService{

    @Resource
    private ModelMapper modelMapper;

    @Override
    public List<Model> findAllModel() {
        return modelMapper.selectAllModel();
    }

    @Override
    public int deleteModelById(String modelId) {
        return modelMapper.deleteByPrimaryKey(modelId);
    }

    @Override
    public int deleteModelByIds(String[] arr) {
        return modelMapper.deleteByIds(arr);
    }

    @Override
    public int InsertModel(Model model) {
        return modelMapper.insertSelective(model);
    }

    @Override
    public Model selectModelById(String modelId) {
        return modelMapper.selectByPrimaryKey(modelId);
    }
}
