package com.justfresh.xiudoua.model;

import com.justfresh.xiudoua.entity.CommonFormParam;

public class JfNotices extends CommonFormParam{
    private Integer id;

    private String acceptIds;

    private String refuseIds;

    private Byte isSendToAll;

    private String title;

    private Long sendTime;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAcceptIds() {
        return acceptIds;
    }

    public void setAcceptIds(String acceptIds) {
        this.acceptIds = acceptIds == null ? null : acceptIds.trim();
    }

    public String getRefuseIds() {
        return refuseIds;
    }

    public void setRefuseIds(String refuseIds) {
        this.refuseIds = refuseIds == null ? null : refuseIds.trim();
    }

    public Byte getIsSendToAll() {
        return isSendToAll;
    }

    public void setIsSendToAll(Byte isSendToAll) {
        this.isSendToAll = isSendToAll;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Long getSendTime() {
        return sendTime;
    }

    public void setSendTime(Long sendTime) {
        this.sendTime = sendTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}