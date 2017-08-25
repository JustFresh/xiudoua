package com.justfresh.xiudoua.entity;

/**
 * @description：站点设置类——接收页面传递的关于站点设置的参数
 * 	例如：站点名称	站点LOGO		站点微信		站点联系电话
 * @author：JustFresh
 * @time：2017-07-29 10:04
 */
public class SiteConfig {

	private String siteName;
	
	private String logo;
	
	//备案号
	private String recordNumber;
	
	private String siteNumber;
	
	private String siteEmail;
	
	//第三方统计代码
	private String thirdStatistics;
	
	//站点坐标——经度
	private String longitude;
	
	//站点坐标——纬度
	private String latitude;
	
	private String weixin;

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getRecordNumber() {
		return recordNumber;
	}

	public void setRecordNumber(String recordNumber) {
		this.recordNumber = recordNumber;
	}

	public String getSiteNumber() {
		return siteNumber;
	}

	public void setSiteNumber(String siteNumber) {
		this.siteNumber = siteNumber;
	}

	public String getSiteEmail() {
		return siteEmail;
	}

	public void setSiteEmail(String siteEmail) {
		this.siteEmail = siteEmail;
	}

	public String getThirdStatistics() {
		return thirdStatistics;
	}

	public void setThirdStatistics(String thirdStatistics) {
		this.thirdStatistics = thirdStatistics;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getWeixin() {
		return weixin;
	}

	public void setWeixin(String weixin) {
		this.weixin = weixin;
	}
	
}
