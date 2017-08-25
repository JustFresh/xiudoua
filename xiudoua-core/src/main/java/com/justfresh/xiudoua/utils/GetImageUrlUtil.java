package com.justfresh.xiudoua.utils;

public class GetImageUrlUtil {
	public static String getImageUrl(String content){
		String img = getImg(content);
		return getFinalUrl(img);
	}
	private static String getImg(String content){
		if(content==null||content.equals("")){
			return null;
		}
		int beginIndex = content.indexOf("<img");
		if(beginIndex > -1) {
			int endIndex = content.indexOf("/>", beginIndex);
			return content.substring(beginIndex, endIndex);
		} else {
			return null;
		}
	}
	private static String getFinalUrl(String img){
		if(img==null||img.equals("")){
			return "";
		}
		int beginIndex = img.indexOf("upload");
		int endIndex = img.indexOf("\"", beginIndex+1);
		if(beginIndex <=0 || endIndex <= 0){
			return "";
		}
		return img.substring(beginIndex, endIndex);
	}
	
	/*public static void main(String[] args) {
		String img = GetImageUrlUtil.getImageUrl("fadfasg<img src=\"upload/image/201408/1409203284780048210.jpg\" title=\"1409203284780048210.jpg\" alt=\"Koala.jpg\"/>");
		System.out.println("图片路径截取为："+img);
	}*/
}
