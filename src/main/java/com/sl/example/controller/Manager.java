package com.sl.example.controller;

import com.sl.example.pojo.Choose;
import com.sl.example.pojo.Detail;
import com.sl.example.pojo.Model;
import com.sl.example.pojo.Qsn;
import com.sl.example.service.ChooseService;
import com.sl.example.service.DetailService;
import com.sl.example.service.ModelService;
import com.sl.example.service.QsnService;
import com.sl.example.util.Api;
import org.apache.ibatis.binding.BindingException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sun.awt.SunHints;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
import java.io.IOException;
import java.security.Key;
import java.sql.SQLException;
import java.util.*;


@Controller
public class Manager {
    public static final Logger logger=LoggerFactory.getLogger(Manager.class);
    @Autowired
    private ModelService modelService;

    @Autowired
    private QsnService qsnService;

    @Autowired
    private ChooseService chooseService;

    @Autowired
    private DetailService detailService;

    Api api=new Api();

    @RequestMapping(value="Index/manager/survey_list")
    @ResponseBody
    public Map<String,Object> getModelList(){
        int code;
        List<Model> modelList=modelService.findAllModel();
        if (modelList!=null){
            code=0;
        }else {
            code=1;
        }


        Map m2=new HashMap();
        m2.put("code",code);
        m2.put("count",3);
        m2.put("data",modelList);
        m2.put("msg","success");
        return m2;
    }

    @RequestMapping(value="Index/manager/qsn_list")
    @ResponseBody
    public Map<String,Object> getQsnList(String modelId){
        int code;
        List<Qsn> qsnList=qsnService.findQsnList(modelId);
        if (qsnList!=null){
            code=0;
        }else {
            code=1;
        }


        Map m2=new HashMap();
        m2.put("code",code);
        m2.put("count",7);
        m2.put("data",qsnList);
        m2.put("msg","success");
        return m2;
    }


    @RequestMapping(value="Index/manager/del_model")
    @ResponseBody
    public Map<String,Object> delModel(String modelId){
        int code;
        String msg;
        Api api=new Api();
        List<Choose> is_answer=chooseService.findChooseByModelId(modelId);
        if (is_answer !=null) {
            return api.returnJson(3,"抱歉，这份题已经被答过了，无法删除");
        }
        int is_del=modelService.deleteModelById(modelId);//删除模板表
        int is_del_qsn=qsnService.deleteModel2Qsn(modelId);//删除题目表
        //先查询模板下的题目list 然后遍历list，根据item.id 即qsnId来删除
//        String[] is_del_option
        if (is_del!=0){
            code=1;
            msg="success";
        }else {
            code=2;
            msg="fail";
        }

        return api.returnJson(code,msg);
    }



//    modelId //模板id用来生成qsnId
//    content //用来存储问题内容
//    modelName
//    a数组用来存储所有问题
//    qsn_type
    //添加题目和选项
    @RequestMapping(value="Index/manager/add_qsn")
    @ResponseBody
    public Map<String,Object> addQsnAndOption(HttpServletRequest req) throws IOException {
        String modelId = req.getParameter("modelId");
        String content=req.getParameter("content");
        String modelName=req.getParameter("modelName");//有注解，默认转换
        String qsnType=req.getParameter("qsn_type");
        String[] arr = req.getParameterValues("a[]");
        UUID uuid=UUID.randomUUID();
        String qsnId=uuid.toString();
        UUID uuid1=UUID.randomUUID();
        String flightId=uuid1.toString();
        if (qsnType.equals(2)) {//问答题只需要插入题目以及一条选项
            //有题目了 根据modelId查出qsn的maxordernum
            short orderNum = qsnService.findMaxOrderNum(modelId);
            orderNum+=1;
            Qsn qsn=new Qsn();
            qsn.setOrderNum(orderNum);
            qsn.setModelName(modelName);
            qsn.setModelId(modelId);
            qsn.setModelName(modelName);
            qsn.setContent(content);
            qsn.setQsnType(qsnType);
            qsn.setQsnId(qsnId);
            //查询题目内容是否重复
            Qsn isHasContent=qsnService.findByContent(content);
            if (isHasContent==null){
                short s1=0;
                int isInsertQsn=qsnService.InsertQsn(qsn);
                Detail detail=new Detail();
                detail.setQsnId(qsnId);
                detail.setOptionNum("0");
                detail.setOrderNum(s1);
                UUID uuid2=UUID.randomUUID();
                String detailId=uuid2.toString();
                detail.setDetailId(detailId);
                int isInsertDetail=detailService.insertDetail(detail);
                return api.returnJson(1,"添加成功");
            }
        }//否则单选多选还需要插入多条选项
        short orderNum=0;
        try {
            orderNum = qsnService.findMaxOrderNum(modelId);
        }catch(BindingException e){
            e.printStackTrace();
        }
        orderNum+=1;
        Qsn qsn=new Qsn();
        qsn.setOrderNum(orderNum);
        qsn.setModelName(modelName);
        qsn.setModelId(modelId);
        qsn.setModelName(modelName);
        qsn.setContent(content);
        qsn.setQsnType(qsnType);
        qsn.setQsnId(qsnId);
        //查询题目内容是否重复
        Qsn isHasContent=qsnService.findByContent(content);
        if (isHasContent==null){
            short s1=0;
            int isInsertQsn=qsnService.InsertQsn(qsn);
            for (int i = 0; i <arr.length ; i++) {
                short j=(short)(i+1);
                Detail detail=new Detail();
                detail.setQsnId(qsnId);
                detail.setType("0");
                UUID uuid2=UUID.randomUUID();
                String detailId=uuid2.toString();
                detail.setDetailId(detailId);
                detail.setOptionNum(arr[i]);
                detail.setOrderNum(j);
                int isInsertDetail=detailService.insertDetail(detail);
            }
            return api.returnJson(1,"添加成功");


        }else {
            return api.returnJson(3,"该问题已存在");
        }
    }


    //qsnId数组
    @RequestMapping(value="Index/manager/del_option")
    @ResponseBody
    public Map<String,Object> delOptions(HttpServletRequest req) throws IOException {
        String[] arr = req.getParameterValues("qsnId[]");//前端传来的modelId
        //根据qsnId查询出用户选择的答案
        for (int i = 0; i < arr.length; i++) {
            List<Choose> is_answer=chooseService.findByQsnId(arr[i]);
            if (!is_answer.isEmpty()) {
                return api.returnJson(3,"抱歉，题目已经被作答，无法删除");
            }
            continue;
        }
        //如果没有 那么当前选中模板的题目都没有被答过 作级联删除 删除题目表 删除选项表(根据model查出Qsn 再根据qsnId删除Option)
        for (int i = 0; i <arr.length ; i++) {
            int is_del_qsn=qsnService.deleteByQsnId(arr[i]);//删除题目表
            int isDelOptions=detailService.deleteOptionsByQsnId(arr[i]);
            if (is_del_qsn!=0){
                return api.returnJson(1,"删除成功");
            }
        }
        return api.returnJson(2,"error");
        }




}