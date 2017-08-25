package com.justfresh.xiudoua.model;

import com.justfresh.xiudoua.entity.CommonFormParam;

public class JfCmsFilmSequels extends CommonFormParam {
    private Integer id;

    private Integer filmId;

    private String name;

    private String title;

    private Integer reorder;

    private String wangpan;

    private String xunlei;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFilmId() {
        return filmId;
    }

    public void setFilmId(Integer filmId) {
        this.filmId = filmId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getReorder() {
        return reorder;
    }

    public void setReorder(Integer reorder) {
        this.reorder = reorder;
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
}