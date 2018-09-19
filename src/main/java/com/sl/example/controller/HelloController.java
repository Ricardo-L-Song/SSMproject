package com.sl.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sun.awt.SunHints;

import java.security.Key;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class HelloController {
    public static final Logger logger=LoggerFactory.getLogger(HelloController.class);
    @RequestMapping(value = "/customer/list.action")
    public ModelAndView hello(){
    logger.info("Hello world was canceled");
    ModelAndView modelAndView=new ModelAndView();
    modelAndView.setViewName("/welcome.jsp");
    modelAndView.addObject("message","this is my first spring mvc");//请求给渲染的页面传参
    return modelAndView;
    }

    @RequestMapping(value="/nav_left")
    @ResponseBody
    public Map<String,Object> getList(){
        List<Map<String,Object>> mapList=new ArrayList();
        Map m2=new HashMap();
        m2.put("text","问卷调查");
        m2.put("icon","&#xe621;");
        m2.put("href","Index/survey");
        Map m3=new HashMap();
        m3.put("text","问卷管理");
        m3.put("icon","&#xe621;");
        m3.put("href","Index/manager");
        mapList.add(m2);
        mapList.add(m3);
        Map m1 = new HashMap();
        m1.put("text", "基础菜单");
        m1.put("icon","&#xe620;");
        m1.put("subset",mapList);
        Map data=new HashMap();
        data.put("data",m1);
       return data;
    }
}