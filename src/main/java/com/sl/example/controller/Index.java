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
public class Index {
    public static final Logger logger=LoggerFactory.getLogger(Index.class);
    @RequestMapping(value = "Index/survey")
    public ModelAndView hello(){
        logger.info("Hello world was canceled");
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("/survey.jsp");
        modelAndView.addObject("message","this is my first spring mvc");//请求给渲染的页面传参
        return modelAndView;
    }

    @RequestMapping(value="Index/manager")
    public ModelAndView hello2(){
        logger.info("Hello world was canceled");
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("/manager.jsp");
        modelAndView.addObject("message","this is my first spring mvc");//请求给渲染的页面传参
        return modelAndView;
    }
}