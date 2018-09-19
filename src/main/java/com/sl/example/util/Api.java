package com.sl.example.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//code=1 success 2 fail 3 warning
public class Api {
    public Map<String,Object> returnJson(int code,String msg){
        Map map=new HashMap();
        map.put("code",code);
        map.put("msg",msg);
        return map;
    }

    public Map<String,Object> returnJson(int code, String msg, List<Map> data){
        Map map=new HashMap();
        map.put("code",code);
        map.put("msg",msg);
        map.put("data",data);
        return map;
    }

    public Map<String,Object> returnJson(int code, String msg, Map data){
        Map map=new HashMap();
        map.put("code",code);
        map.put("msg",msg);
        map.put("data",data);
        return map;
    }
}
