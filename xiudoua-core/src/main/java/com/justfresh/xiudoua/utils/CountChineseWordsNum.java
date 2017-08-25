package com.justfresh.xiudoua.utils;

public class CountChineseWordsNum {
	public static int count(String str) {
		String Reg = "^[\u4e00-\u9fa5]{1}$";// 正则
		int result = 0;
		for (int i = 0; i < str.length(); i++) {
			String b = Character.toString(str.charAt(i));
			if (b.matches(Reg))
				result++;
		}
		return result;
	}

	public static void main(String[] args) {
		
	}
}
