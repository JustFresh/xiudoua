package com.justfresh.xiudoua.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

public class DateStampUtil {
	
	/* 
     * 将时间转换为时间戳
     */    
    public static Long dateToStamp(String s) throws ParseException{
    	if(s == null || s == ""){
    		return 0L;
    	}
        String res = "";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date;
		try {
			date = simpleDateFormat.parse(s);
			long ts = date.getTime();
	        res = String.valueOf(ts);
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
        return Long.parseLong(res);
    }
    
    /**
     * 将时间戳转换为时间
     */
    public static String stampToDate(String s){
    	if(s == null || s == ""){
    		return "";
    	}
        String res;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long lt = new Long(s);
        Date date = new Date(lt);
        res = simpleDateFormat.format(date);
        return res;
    }
    
    /**
     * 获取当前时间年月日时分秒字符串，例如20170327160508
     */
    public static String getNowStr(){
    	String result = "";
    	Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
    	result += c.get(Calendar.YEAR);
    	int month = c.get(Calendar.MONTH) + 1;
    	result += month < 10 ? "0" + month : "" + month;
    	int date = c.get(Calendar.DATE);
    	result += date < 10 ? "0" + date : "" + date;
    	int hour = c.get(Calendar.HOUR_OF_DAY);
    	result += hour < 10 ? "0" + hour : "" + hour;
    	int minute = c.get(Calendar.MINUTE);
    	result += minute < 10 ? "0" + minute : "" + minute;
    	int second = c.get(Calendar.SECOND);
    	result += second < 10 ? "0" + second : "" + second;
    	return result;
    }
}
