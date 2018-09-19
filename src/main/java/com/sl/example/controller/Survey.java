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
import com.sl.example.util.String2Date;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sun.awt.SunHints;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
import java.awt.*;
import java.io.IOException;
import java.security.Key;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;


@Controller
public class Survey {
    public static final Logger logger=LoggerFactory.getLogger(Index.class);
    @Autowired
    private ModelService modelService;

    @Autowired
    private QsnService qsnService;

    @Autowired
    private ChooseService chooseService;

    @Autowired
    private DetailService detailService;

    Api api=new Api();

    String2Date string2Date=new String2Date();

    @RequestMapping(value="Index/survey/survey_list")
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

    //查看model
    @RequestMapping(value="Index/survey/look_model")
    @ResponseBody
    public Map<String,Object> getModelAndQsn(HttpServletRequest req) throws IOException{
        String model_Id = req.getParameter("modelId");
        if (model_Id==null){
            return api.returnJson(3,"warning");
        }
        List<Qsn> chk_qsn=qsnService.findQsnList(model_Id);
        if (chk_qsn.isEmpty()){
            return api.returnJson(2,"暂无题目");
        }
        //有题目就查qsn和model表
        Model model=modelService.selectModelById(model_Id);
        List<Qsn> qsnList=qsnService.findQsnList(model_Id);
        List<Map> returnlist=new ArrayList();
        for (int i = 0; i < qsnList.size(); i++) {
            Map map=new HashMap();
            map.put("modelId",model.getModelId());
            map.put("name",model.getName());
            map.put("createName",model.getCreateName());
            map.put("time",model.getTime());
            map.put("qsnId",qsnList.get(i).getQsnId());
            map.put("content",qsnList.get(i).getContent());
            returnlist.add(map);
        }
        return api.returnJson(1,"success",returnlist);
    }

    //统计模板信息survey/count
    @RequestMapping(value="Index/survey/count")
    @ResponseBody
    public Map<String,Object> countModel(HttpServletRequest req) throws IOException{
        String model_Id = req.getParameter("modelId");
        if (model_Id==null){
            return api.returnJson(3,"warning");
        }
        List<Qsn> chk_qsn=qsnService.findQsnList(model_Id);
        if (chk_qsn.isEmpty()){
            return api.returnJson(2,"暂无题目");
        }
        //有题目就查qsn和qsn_detail
        List<Map> returnlist=new ArrayList();


        List<Qsn> qsnList=qsnService.findQsnList(model_Id);
        for (int i = 0; i <qsnList.size() ; i++) {
            Map map=new HashMap();
            if ("2".equals(qsnList.get(i).getQsnType())){
//                return api.returnJson(1,"此路不通");
                Detail ask_detail=detailService.findAskAnswer(qsnList.get(i).getQsnId());
                List<Choose> countlist=chooseService.countDataBy2Id(qsnList.get(i).getQsnId(),ask_detail.getDetailId());
                List<Map> answer=new ArrayList<>();

                for (int j = 0; j <countlist.size() ; j++) {
                    Map map1=new HashMap();
                    map1.put("choose",countlist.get(j).getChoose());
                    answer.add(map1);
                }
                map.put("content",qsnList.get(i).getContent());
                map.put("qsn_type",qsnList.get(i).getQsnType());
                map.put("answer",answer);
                returnlist.add(map);
                continue;
            }

            List<Detail> optionList=detailService.findOptionList(qsnList.get(i).getQsnId());//qsnId
            List<Map> list=new ArrayList<>();
            for (int j = 0; j <optionList.size() ; j++) {//detailId,option_num,order_num
                Map map1=new HashMap();
                List<Choose> countlist=chooseService.countDataBy2Id(qsnList.get(i).getQsnId(),optionList.get(j).getDetailId());
                int count=countlist.size();
                map1.put("count",count);
                map1.put("detailId",optionList.get(j).getDetailId());
                map1.put("optionNum",optionList.get(j).getOptionNum());
                map1.put("orderNum",optionList.get(j).getOrderNum());
                list.add(map1);
            }
            map.put("content",qsnList.get(i).getContent());
            map.put("qsn_type",qsnList.get(i).getQsnType());
            map.put("option_list",list);
            returnlist.add(map);
        }

        return api.returnJson(1,"success",returnlist);
    }

    //返回数据用responseBody
    //删除model
    @RequestMapping(value="Index/survey/del_model")
    @ResponseBody
    public Map<String,Object> delModel(HttpServletRequest req) throws IOException {
        String[] arr = req.getParameterValues("array[]");//前端传来的modelId
        int code;
        String msg;

//        if(arr!=null)
//        return api.returnJson(3,arr[0]);
        for (int i = 0; i < arr.length; i++) {
            List<Choose> is_answer=chooseService.findChooseByModelId(arr[i]);
            if (!is_answer.isEmpty()) {
                return api.returnJson(3,"抱歉，题目已经被作答，无法删除");
            }
            continue;
        }
        //如果没有 那么当前选中模板的题目都没有被答过 作级联删除 删除模板表 删除题目表 删除选项表(根据model查出Qsn 再根据qsnId删除Option)
        int is_del=modelService.deleteModelByIds(arr);//删除模板表
        for (int i = 0; i <arr.length ; i++) {
            int is_del_qsn=qsnService.deleteModel2Qsn(arr[i]);//删除题目表
            List<Qsn> qsnList=qsnService.findQsnList(arr[i]);//得到题目
            System.out.println(qsnList);
            for (int j = 0; j <qsnList.size() ; j++) {//删除选项表
                int isDelOptions=detailService.deleteOptionsByQsnId(qsnList.get(j).getQsnId());
            }
        }

        //先查询模板下的题目list 然后遍历list，根据item.id 即qsnId来删除
//        String[] is_del_option 还缺删除选项表的逻辑
        if (is_del!=0){
            code=1;
            msg="success";
        }else {
            code=2;
            msg="fail";
        }

        return api.returnJson(code,msg);
    }

    //增加model
    @RequestMapping(value="Index/survey/add_model")
    @ResponseBody
    public Map<String,Object> addModel(HttpServletRequest req) throws IOException{
        String name = req.getParameter("name");
        String createName=req.getParameter("createName");
        String strtime=req.getParameter("time");//有注解，默认转换
        if (createName==null){
            return api.returnJson(3,"warning");
        }
        UUID uuid=UUID.randomUUID();
        String modelId=uuid.toString();
        Model model=new Model();
        Date time=string2Date.DateChange(strtime);
        model.setCreateName(createName);
        model.setName(name);
        model.setTime(time);
        model.setModelId(modelId);
        int is_add=modelService.InsertModel(model);
        if (is_add!=0){
            return api.returnJson(1,"添加成功");
        }else{
            return api.returnJson(2,"添加失败");
        }
    }

    //下一题 这题答题录入 并返回下一题数据
//    modelId
//    orderNum
//    choice//数组
//    qsn_type
    @RequestMapping(value="Index/survey/next_qsn")
    @ResponseBody
    public Map<String,Object> answerRecord(HttpServletRequest req) throws IOException{
        String modelId = req.getParameter("modelId");
        String str_orderNum = req.getParameter("orderNum");
        String qsnType = req.getParameter("qsn_type");
        String[] choose = req.getParameterValues("array[]");
        Map map=new HashMap();
        short orderNum=Short.parseShort(str_orderNum);
        if(choose.length==0)
            return api.returnJson(3,"请答题");
        Qsn qsn=qsnService.findByOrderNum(orderNum,modelId);
        Choose c=new Choose();
        c.setQsnId(qsn.getQsnId());
        c.setModelId(qsn.getModelId());
        c.setFlightId(qsn.getFlightId());
        c.setQsnType(qsn.getQsnType());

        if (!qsnType.equals(2)) {
            String str_choose = StringUtils.join(choose, ",");

            List<Detail> optionList = detailService.findOptionList(qsn.getQsnId());
            for (int i = 0; i < choose.length; i++) {
                c.setDetailId(optionList.get(i).getDetailId());
                c.setChoose(choose[i]);
                UUID uuid = UUID.randomUUID();
                String psgQsnId = uuid.toString();
                c.setPsgQsnRId(psgQsnId);
                int isInsert = chooseService.InsertChoose(c);
            }
        }else{//如果是2的话 那就是整个录入进去
            String str_choose=choose[0];
            List<Detail> optionList = detailService.findOptionList(qsn.getQsnId());
            c.setDetailId(optionList.get(0).getDetailId());
            c.setChoose(str_choose);
            UUID uuid = UUID.randomUUID();
            String psgQsnId = uuid.toString();
            c.setPsgQsnRId(psgQsnId);
            int isInsert = chooseService.InsertChoose(c);
        }

        //然后我们要返回下一题的数据 这里注意orderNum+=1和orderNum=orderNum+1
        short s=1;
        orderNum=(short) (orderNum+s);
        Qsn qsnNext=qsnService.findByOrderNum(orderNum,modelId);
        boolean bool_num=false;
        if (qsnNext==null){
            return  api.returnJson(2,"恭喜您完成了答题");
        }
        if (qsnNext.getOrderNum()==qsnService.findMaxOrderNum(modelId)){
            bool_num=true;
        }


        //然后我们查询选项
        List<Detail> optionList1=detailService.findOptionList(qsnNext.getQsnId());
        if (!qsnNext.getQsnType().equals(2)){//单选/多选
            map.put("qsn_type",qsnNext.getQsnType());
            map.put("content",qsnNext.getContent());
            map.put("modelId",qsnNext.getModelId());
            map.put("orderNum",qsnNext.getOrderNum());
            map.put("qsnId",qsnNext.getQsnId());
            map.put("bool_num",bool_num);
            for (int i = 0; i <optionList1.size() ; i++) {
                map.put(i,optionList1.get(i));
            }
            return  api.returnJson(1,"success",map);

        }else {//问答题
            map.put("qsn_type", qsnNext.getQsnType());
            map.put("content", qsnNext.getContent());
            map.put("modelId", qsnNext.getModelId());
            map.put("orderNum", qsnNext.getOrderNum());
            map.put("qsnId", qsnNext.getQsnId());
            map.put("bool_num", bool_num);
            for (int i = 0; i < optionList1.size(); i++) {
                map.put(i, optionList1.get(i));
            }
            return api.returnJson(1, "success", map);
        }
    }


    //第一题答题录入
    //modelId[]数组 但是只有一个model ID

    @RequestMapping(value="Index/survey/answer_list")
    @ResponseBody
    public Map<String,Object> firstAnswer(HttpServletRequest req) throws IOException{
        String[] arr_modelId = req.getParameterValues("modelId[]");
        Map map=new HashMap();
        if (arr_modelId.length==0)
            return api.returnJson(3,"请选择模板答题");
        String modelId=arr_modelId[0];
        List<Qsn> qsnList=qsnService.findQsnList(modelId);
        if (qsnList.isEmpty()){
            return api.returnJson(2,"暂无题目");
        }
        boolean bool_num=false;
        //判断这套模板的第一道题目是否是最后一题
        if(qsnList.get(0).getOrderNum()==qsnService.findMaxOrderNum(modelId))
        bool_num=true;

        //不管是不是最后一题，都查询选项
        List<Detail> optionList=detailService.findOptionList(qsnList.get(0).getQsnId());

        if (!qsnList.get(0).getQsnType().equals(2)){//单选/多选
            map.put("qsn_type",qsnList.get(0).getQsnType());
            map.put("content",qsnList.get(0).getContent());
            map.put("modelId",qsnList.get(0).getModelId());
            map.put("orderNum",qsnList.get(0).getOrderNum());
            map.put("qsnId",qsnList.get(0).getQsnId());
            map.put("bool_num",bool_num);
            for (int i = 0; i <optionList.size() ; i++) {
                map.put(i,optionList.get(i));
            }
            return  api.returnJson(1,"success",map);

        }else{//问答题
            map.put("qsn_type",qsnList.get(0).getQsnType());
            map.put("content",qsnList.get(0).getContent());
            map.put("modelId",qsnList.get(0).getModelId());
            map.put("orderNum",qsnList.get(0).getOrderNum());
            map.put("qsnId",qsnList.get(0).getQsnId());
            map.put("bool_num",bool_num);
            for (int i = 0; i <optionList.size() ; i++) {
                map.put(i,optionList.get(i));
            }
            return  api.returnJson(1,"success",map);
//            return  api.returnJson(2,"此路不通");
        }

    }
}