package com.justfresh.xiudoua.model;

import java.util.List;

import com.justfresh.xiudoua.entity.CommonFormParam;

public class JfCmsFilm extends CommonFormParam{
    private Integer id;

    private Integer categoryId;

    private String categoryName;

    private String thumb;

    private String title;

    private String stars;

    private String country;

    private String definition;

    private String releaseTime;

    private String abstracts;

    private String source;

    private String douban;

    private String wangpan;

    private String xunlei;

    private Long createTime;

    private Long lastUpdateTime;

    private Integer reorder;

    private Byte status;

    private String content;
    
    private List<JfCmsFilmImages> images;
    
    private List<JfCmsFilmSequels> sequels;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb == null ? null : thumb.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getStars() {
        return stars;
    }

    public void setStars(String stars) {
        this.stars = stars == null ? null : stars.trim();
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country == null ? null : country.trim();
    }

    public String getDefinition() {
        return definition;
    }

    public void setDefinition(String definition) {
        this.definition = definition == null ? null : definition.trim();
    }

    public String getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(String releaseTime) {
        this.releaseTime = releaseTime == null ? null : releaseTime.trim();
    }

    public String getAbstracts() {
        return abstracts;
    }

    public void setAbstracts(String abstracts) {
        this.abstracts = abstracts == null ? null : abstracts.trim();
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source == null ? null : source.trim();
    }

    public String getDouban() {
        return douban;
    }

    public void setDouban(String douban) {
        this.douban = douban == null ? null : douban.trim();
    }

    public String getWangpan() {
        return wangpan;
    }

    public void setWangpan(String wangpan) {
        this.wangpan = wangpan == null ? null : wangpan.trim();
    }

    public String getXunlei() {
        return xunlei;
    }

    public void setXunlei(String xunlei) {
        this.xunlei = xunlei == null ? null : xunlei.trim();
    }

    public Long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }

    public Long getLastUpdateTime() {
        return lastUpdateTime;
    }

    public void setLastUpdateTime(Long lastUpdateTime) {
        this.lastUpdateTime = lastUpdateTime;
    }

    public Integer getReorder() {
        return reorder;
    }

    public void setReorder(Integer reorder) {
        this.reorder = reorder;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

	public List<JfCmsFilmImages> getImages() {
		return images;
	}

	public void setImages(List<JfCmsFilmImages> images) {
		this.images = images;
	}

	public List<JfCmsFilmSequels> getSequels() {
		return sequels;
	}

	public void setSequels(List<JfCmsFilmSequels> sequels) {
		this.sequels = sequels;
	}
    
}