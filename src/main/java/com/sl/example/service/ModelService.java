package com.sl.example.service;


import com.sl.example.pojo.Model;

import java.util.List;

public interface ModelService {
    public List<Model> findAllModel();

    public int deleteModelById(String modelId);

    public int deleteModelByIds(String[] arr);

    public int InsertModel(Model model);

    public Model selectModelById(String modelId);
}
