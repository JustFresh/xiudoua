package com.justfresh.xiudoua.model;

import java.util.ArrayList;
import java.util.List;

public class JfCmsContentExtExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public JfCmsContentExtExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andContentIdIsNull() {
            addCriterion("content_id is null");
            return (Criteria) this;
        }

        public Criteria andContentIdIsNotNull() {
            addCriterion("content_id is not null");
            return (Criteria) this;
        }

        public Criteria andContentIdEqualTo(Integer value) {
            addCriterion("content_id =", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdNotEqualTo(Integer value) {
            addCriterion("content_id <>", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdGreaterThan(Integer value) {
            addCriterion("content_id >", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("content_id >=", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdLessThan(Integer value) {
            addCriterion("content_id <", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdLessThanOrEqualTo(Integer value) {
            addCriterion("content_id <=", value, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdIn(List<Integer> values) {
            addCriterion("content_id in", values, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdNotIn(List<Integer> values) {
            addCriterion("content_id not in", values, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdBetween(Integer value1, Integer value2) {
            addCriterion("content_id between", value1, value2, "contentId");
            return (Criteria) this;
        }

        public Criteria andContentIdNotBetween(Integer value1, Integer value2) {
            addCriterion("content_id not between", value1, value2, "contentId");
            return (Criteria) this;
        }

        public Criteria andSeoKeywordsIsNull() {
            addCriterion("seo_keywords is null");
            return (Criteria) this;
        }

        public Criteria andSeoKeywordsIsNotNull() {
            addCriterion("seo_keywords is not null");
            return (Criteria) this;
        }

        public Criteria andSeoKeywordsEqualTo(String value) {
            addCriterion("seo_keywords =", value, "seoKeywords");
            return (Criteria) this;
        }

        public Criteria andSeoKeywordsNotEqualTo(String value) {
            addCriterion("seo_keywords <>", value, "seoKeywords");
            return (Criteria) this;
        }

        public Criteria andSeoKeywordsGreaterThan(String value) {
            addCriterion("seo_keywords >", value, "seoKeywords");
            return (Criteria) this;
        }

        public Criteria andSeoKeywordsGreaterThanOrEqualTo(String value) {
            addCriterion("seo_keywords >=", value, "seoKeywords");
            return (Criteria) this;
        }

        public Criteria andSeoKeywordsLessThan(String value) {
            addCriterion("seo_keywords <", value, "seoKeywords");
            return (Criteria) this;
        }

        public Criteria andSeoKeywordsLessThanOrEqualTo(String value) {
            addCriterion("seo_keywords <=", value, "seoKeywords");
            return (Criteria) this;
        }

        public Criteria andSeoKeywordsLike(String value) {
            addCriterion("seo_keywords like", value, "seoKeywords");
            return (Criteria) this;
        }

        public Criteria andSeoKeywordsNotLike(String value) {
            addCriterion("seo_keywords not like", value, "seoKeywords");
            return (Criteria) this;
        }

        public Criteria andSeoKeywordsIn(List<String> values) {
            addCriterion("seo_keywords in", values, "seoKeywords");
            return (Criteria) this;
        }

        public Criteria andSeoKeywordsNotIn(List<String> values) {
            addCriterion("seo_keywords not in", values, "seoKeywords");
            return (Criteria) this;
        }

        public Criteria andSeoKeywordsBetween(String value1, String value2) {
            addCriterion("seo_keywords between", value1, value2, "seoKeywords");
            return (Criteria) this;
        }

        public Criteria andSeoKeywordsNotBetween(String value1, String value2) {
            addCriterion("seo_keywords not between", value1, value2, "seoKeywords");
            return (Criteria) this;
        }

        public Criteria andAbstractsIsNull() {
            addCriterion("abstracts is null");
            return (Criteria) this;
        }

        public Criteria andAbstractsIsNotNull() {
            addCriterion("abstracts is not null");
            return (Criteria) this;
        }

        public Criteria andAbstractsEqualTo(String value) {
            addCriterion("abstracts =", value, "abstracts");
            return (Criteria) this;
        }

        public Criteria andAbstractsNotEqualTo(String value) {
            addCriterion("abstracts <>", value, "abstracts");
            return (Criteria) this;
        }

        public Criteria andAbstractsGreaterThan(String value) {
            addCriterion("abstracts >", value, "abstracts");
            return (Criteria) this;
        }

        public Criteria andAbstractsGreaterThanOrEqualTo(String value) {
            addCriterion("abstracts >=", value, "abstracts");
            return (Criteria) this;
        }

        public Criteria andAbstractsLessThan(String value) {
            addCriterion("abstracts <", value, "abstracts");
            return (Criteria) this;
        }

        public Criteria andAbstractsLessThanOrEqualTo(String value) {
            addCriterion("abstracts <=", value, "abstracts");
            return (Criteria) this;
        }

        public Criteria andAbstractsLike(String value) {
            addCriterion("abstracts like", value, "abstracts");
            return (Criteria) this;
        }

        public Criteria andAbstractsNotLike(String value) {
            addCriterion("abstracts not like", value, "abstracts");
            return (Criteria) this;
        }

        public Criteria andAbstractsIn(List<String> values) {
            addCriterion("abstracts in", values, "abstracts");
            return (Criteria) this;
        }

        public Criteria andAbstractsNotIn(List<String> values) {
            addCriterion("abstracts not in", values, "abstracts");
            return (Criteria) this;
        }

        public Criteria andAbstractsBetween(String value1, String value2) {
            addCriterion("abstracts between", value1, value2, "abstracts");
            return (Criteria) this;
        }

        public Criteria andAbstractsNotBetween(String value1, String value2) {
            addCriterion("abstracts not between", value1, value2, "abstracts");
            return (Criteria) this;
        }

        public Criteria andDownloadUrlIsNull() {
            addCriterion("download_url is null");
            return (Criteria) this;
        }

        public Criteria andDownloadUrlIsNotNull() {
            addCriterion("download_url is not null");
            return (Criteria) this;
        }

        public Criteria andDownloadUrlEqualTo(String value) {
            addCriterion("download_url =", value, "downloadUrl");
            return (Criteria) this;
        }

        public Criteria andDownloadUrlNotEqualTo(String value) {
            addCriterion("download_url <>", value, "downloadUrl");
            return (Criteria) this;
        }

        public Criteria andDownloadUrlGreaterThan(String value) {
            addCriterion("download_url >", value, "downloadUrl");
            return (Criteria) this;
        }

        public Criteria andDownloadUrlGreaterThanOrEqualTo(String value) {
            addCriterion("download_url >=", value, "downloadUrl");
            return (Criteria) this;
        }

        public Criteria andDownloadUrlLessThan(String value) {
            addCriterion("download_url <", value, "downloadUrl");
            return (Criteria) this;
        }

        public Criteria andDownloadUrlLessThanOrEqualTo(String value) {
            addCriterion("download_url <=", value, "downloadUrl");
            return (Criteria) this;
        }

        public Criteria andDownloadUrlLike(String value) {
            addCriterion("download_url like", value, "downloadUrl");
            return (Criteria) this;
        }

        public Criteria andDownloadUrlNotLike(String value) {
            addCriterion("download_url not like", value, "downloadUrl");
            return (Criteria) this;
        }

        public Criteria andDownloadUrlIn(List<String> values) {
            addCriterion("download_url in", values, "downloadUrl");
            return (Criteria) this;
        }

        public Criteria andDownloadUrlNotIn(List<String> values) {
            addCriterion("download_url not in", values, "downloadUrl");
            return (Criteria) this;
        }

        public Criteria andDownloadUrlBetween(String value1, String value2) {
            addCriterion("download_url between", value1, value2, "downloadUrl");
            return (Criteria) this;
        }

        public Criteria andDownloadUrlNotBetween(String value1, String value2) {
            addCriterion("download_url not between", value1, value2, "downloadUrl");
            return (Criteria) this;
        }

        public Criteria andVideoFormatIsNull() {
            addCriterion("video_format is null");
            return (Criteria) this;
        }

        public Criteria andVideoFormatIsNotNull() {
            addCriterion("video_format is not null");
            return (Criteria) this;
        }

        public Criteria andVideoFormatEqualTo(String value) {
            addCriterion("video_format =", value, "videoFormat");
            return (Criteria) this;
        }

        public Criteria andVideoFormatNotEqualTo(String value) {
            addCriterion("video_format <>", value, "videoFormat");
            return (Criteria) this;
        }

        public Criteria andVideoFormatGreaterThan(String value) {
            addCriterion("video_format >", value, "videoFormat");
            return (Criteria) this;
        }

        public Criteria andVideoFormatGreaterThanOrEqualTo(String value) {
            addCriterion("video_format >=", value, "videoFormat");
            return (Criteria) this;
        }

        public Criteria andVideoFormatLessThan(String value) {
            addCriterion("video_format <", value, "videoFormat");
            return (Criteria) this;
        }

        public Criteria andVideoFormatLessThanOrEqualTo(String value) {
            addCriterion("video_format <=", value, "videoFormat");
            return (Criteria) this;
        }

        public Criteria andVideoFormatLike(String value) {
            addCriterion("video_format like", value, "videoFormat");
            return (Criteria) this;
        }

        public Criteria andVideoFormatNotLike(String value) {
            addCriterion("video_format not like", value, "videoFormat");
            return (Criteria) this;
        }

        public Criteria andVideoFormatIn(List<String> values) {
            addCriterion("video_format in", values, "videoFormat");
            return (Criteria) this;
        }

        public Criteria andVideoFormatNotIn(List<String> values) {
            addCriterion("video_format not in", values, "videoFormat");
            return (Criteria) this;
        }

        public Criteria andVideoFormatBetween(String value1, String value2) {
            addCriterion("video_format between", value1, value2, "videoFormat");
            return (Criteria) this;
        }

        public Criteria andVideoFormatNotBetween(String value1, String value2) {
            addCriterion("video_format not between", value1, value2, "videoFormat");
            return (Criteria) this;
        }

        public Criteria andVideoRootIsNull() {
            addCriterion("video_root is null");
            return (Criteria) this;
        }

        public Criteria andVideoRootIsNotNull() {
            addCriterion("video_root is not null");
            return (Criteria) this;
        }

        public Criteria andVideoRootEqualTo(String value) {
            addCriterion("video_root =", value, "videoRoot");
            return (Criteria) this;
        }

        public Criteria andVideoRootNotEqualTo(String value) {
            addCriterion("video_root <>", value, "videoRoot");
            return (Criteria) this;
        }

        public Criteria andVideoRootGreaterThan(String value) {
            addCriterion("video_root >", value, "videoRoot");
            return (Criteria) this;
        }

        public Criteria andVideoRootGreaterThanOrEqualTo(String value) {
            addCriterion("video_root >=", value, "videoRoot");
            return (Criteria) this;
        }

        public Criteria andVideoRootLessThan(String value) {
            addCriterion("video_root <", value, "videoRoot");
            return (Criteria) this;
        }

        public Criteria andVideoRootLessThanOrEqualTo(String value) {
            addCriterion("video_root <=", value, "videoRoot");
            return (Criteria) this;
        }

        public Criteria andVideoRootLike(String value) {
            addCriterion("video_root like", value, "videoRoot");
            return (Criteria) this;
        }

        public Criteria andVideoRootNotLike(String value) {
            addCriterion("video_root not like", value, "videoRoot");
            return (Criteria) this;
        }

        public Criteria andVideoRootIn(List<String> values) {
            addCriterion("video_root in", values, "videoRoot");
            return (Criteria) this;
        }

        public Criteria andVideoRootNotIn(List<String> values) {
            addCriterion("video_root not in", values, "videoRoot");
            return (Criteria) this;
        }

        public Criteria andVideoRootBetween(String value1, String value2) {
            addCriterion("video_root between", value1, value2, "videoRoot");
            return (Criteria) this;
        }

        public Criteria andVideoRootNotBetween(String value1, String value2) {
            addCriterion("video_root not between", value1, value2, "videoRoot");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}