package com.justfresh.xiudoua.model;

import java.util.List;

import com.justfresh.xiudoua.entity.CommonFormParam;

public class JfCmsFilmCategory extends CommonFormParam {
    private Integer id;

    private String name;

    private Integer parentId;

    private String fullName;

    private Byte filmType;

    private String thumb;

    private Long createTime;

    private Byte status;

    private Integer reorder;

    private Integer level;

    private String description;
    
    private List<JfCmsFilmCategory> children;

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

    public Byte getFilmType() {
        return filmType;
    }

    public void setFilmType(Byte filmType) {
        this.filmType = filmType;
    }

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb == null ? null : thumb.trim();
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

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

	public List<JfCmsFilmCategory> getChildren() {
		return children;
	}

	public void setChildren(List<JfCmsFilmCategory> children) {
		this.children = children;
	}
    
}