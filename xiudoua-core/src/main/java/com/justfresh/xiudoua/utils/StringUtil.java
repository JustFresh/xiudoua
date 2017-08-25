package com.justfresh.xiudoua.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {
	
	public static String camelToUnderline(String param)
	  {
	    if ((param == null) || (param.equals(""))) {
	      return "";
	    }
	    Pattern p = Pattern.compile("[A-Z]");
	    StringBuilder builder = new StringBuilder(param);
	    Matcher mc = p.matcher(param);
	    int i = 0;
	    while (mc.find())
	    {
	      builder.replace(mc.start() + i, mc.end() + i, "_" + 
	        mc.group().toLowerCase());
	      i++;
	    }
	    if ('_' == builder.charAt(0)) {
	      builder.deleteCharAt(0);
	    }
	    return builder.toString();
	  }
	  
	  public static String underlineToCamelFirstUpper(String param)
	  {
	    if ((param == null) || (param.equals(""))) {
	      return "";
	    }
	    StringBuilder builder = new StringBuilder();
	    for (String p : param.split("_")) {
	      if (p.length() > 0)
	      {
	        p = p.toLowerCase();
	        char first = p.charAt(0);
	        p = (char)(first - ' ') + p.substring(1);
	        builder.append(p);
	      }
	    }
	    return builder.toString();
	  }
	  
	  public static String underlineToCamelFirstLower(String param)
	  {
	    if ((param == null) || (param.equals(""))) {
	      return "";
	    }
	    StringBuilder builder = new StringBuilder();
	    String[] params = param.split("_");
	    for (int i = 0; i < params.length; i++) {
	      if (params[i].length() > 0)
	      {
	        String p = params[i].toLowerCase();
	        char first = p.charAt(0);
	        if (i != 0) {
	          p = (char)(first - ' ') + p.substring(1);
	        }
	        builder.append(p);
	      }
	    }
	    return builder.toString();
	  }
	  
	  public static String[] split(String str, String seperators)
	  {
	    StringTokenizer tokenlizer = new StringTokenizer(str, seperators);
	    List result = new ArrayList();
	    while (tokenlizer.hasMoreElements())
	    {
	      Object s = tokenlizer.nextElement();
	      result.add(s);
	    }
	    return (String[])result.toArray(new String[result.size()]);
	  }
	  
	  public static int getDay(char type, int day)
	  {
	    int i = 1;
	    switch (type)
	    {
	    case 'D': 
	      i = day;
	      break;
	    case 'W': 
	      i = day * 7;
	      break;
	    case 'M': 
	      i = day * 30;
	      break;
	    case 'J': 
	      i = day * 90;
	      break;
	    case 'B': 
	      i = day * 182;
	      break;
	    case 'Y': 
	      i = day * 365;
	      break;
	    default: 
	      i = 0;
	    }
	    return i;
	  }
	  
	  public static List<String> getIdsToList(String ids)
	  {
	    List<String> listId = new ArrayList();
	    if ((ids != null) && (!"".equals(ids)))
	    {
	      String[] _ids = ids.split(",");
	      for (String string : _ids) {
	        if ((string != null) && (!"".equals(string))) {
	          listId.add(string);
	        }
	      }
	    }
	    return listId;
	  }
	  
	  public static String getListToIds(List<String> list)
	  {
	    String ids = null;
	    if ((list != null) && (list.size() > 0))
	    {
	      StringBuilder sbd = new StringBuilder();
	      for (int i = 0; i < list.size(); i++)
	      {
	        sbd.append((String)list.get(i));
	        sbd.append(",");
	      }
	      ids = sbd.toString();
	      ids = ids.substring(0, ids.length() - 1);
	    }
	    return ids;
	  }
	  
	  public static List<String> getPageIds(String str, int page)
	  {
	    List<String> listid = new ArrayList();
	    String[] ids = str.split(",");
	    int len = ids.length;
	    if (len > page)
	    {
	      int j = 0;
	      String sid = "";
	      for (int i = 0; i < len; i++)
	      {
	        if (j == page)
	        {
	          sid = sid.substring(0, sid.length() - 1);
	          listid.add(sid);
	          j = 0;
	          sid = "";
	        }
	        sid = sid + ids[i] + ",";
	        j++;
	        if (i + 1 == len)
	        {
	          sid = sid.substring(0, sid.length() - 1);
	          listid.add(sid);
	        }
	      }
	    }
	    else
	    {
	      listid.add(str);
	    }
	    return listid;
	  }
}
