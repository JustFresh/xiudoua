package com.justfresh.xiudoua.model;

public class JfCmsContentExt {
    private Integer contentId;

    private String seoKeywords;

    private String abstracts;

    private String downloadUrl;

    private String videoFormat;

    private String videoRoot;

    private String content;

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }

    public String getSeoKeywords() {
        return seoKeywords;
    }

    public void setSeoKeywords(String seoKeywords) {
        this.seoKeywords = seoKeywords == null ? null : seoKeywords.trim();
    }

    public String getAbstracts() {
        return abstracts;
    }

    public void setAbstracts(String abstracts) {
        this.abstracts = abstracts == null ? null : abstracts.trim();
    }

    public String getDownloadUrl() {
        return downloadUrl;
    }

    public void setDownloadUrl(String downloadUrl) {
        this.downloadUrl = downloadUrl == null ? null : downloadUrl.trim();
    }

    public String getVideoFormat() {
        return videoFormat;
    }

    public void setVideoFormat(String videoFormat) {
        this.videoFormat = videoFormat == null ? null : videoFormat.trim();
    }

    public String getVideoRoot() {
        return videoRoot;
    }

    public void setVideoRoot(String videoRoot) {
        this.videoRoot = videoRoot == null ? null : videoRoot.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}