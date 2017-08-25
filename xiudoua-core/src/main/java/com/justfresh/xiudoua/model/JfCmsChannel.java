package com.justfresh.xiudoua.model;

import java.util.List;

import com.justfresh.xiudoua.entity.CommonFormParam;

public class JfCmsChannel extends CommonFormParam{
    private Integer id;

    private String name;

    private Integer parentId;

    private String fullName;

    private String introduce;

    private String thumb;

    private Byte cType;

    private Byte isNav;

    private Byte isBlank;

    private Long createTime;

    private Byte status;

    private Integer reorder;

    private Byte level;

    private String description;
    
    private List<JfCmsChannel> children;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName == null ? null : fullName.trim();
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb == null ? null : thumb.trim();
    }

    public Byte getcType() {
        return cType;
    }

    public void setcType(Byte cType) {
        this.cType = cType;
    }

    public Byte getIsNav() {
        return isNav;
    }

    public void setIsNav(Byte isNav) {
        this.isNav = isNav;
    }

    public Byte getIsBlank() {
        return isBlank;
    }

    public void setIsBlank(Byte isBlank) {
        this.isBlank = isBlank;
    }

    public Long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Integer getReorder() {
        return reorder;
    }

    public void setReorder(Integer reorder) {
        this.reorder = reorder;
    }

    public Byte getLevel() {
        return level;
    }

    public void setLevel(Byte level) {
        this.level = level;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

	public List<JfCmsChannel> getChildren() {
		return children;
	}

	public void setChildren(List<JfCmsChannel> children) {
		this.children = children;
	}
    
}