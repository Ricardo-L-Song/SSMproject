package com.sl.example.util;

        import java.text.DateFormat;
        import java.text.ParseException;
        import java.text.SimpleDateFormat;
        import java.util.Date;

public class String2Date {

    public Date DateChange(String dateStr){
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        try {
            //使用SimpleDateFormat的parse()方法生成Date
            date = sf.parse(dateStr);

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
}
