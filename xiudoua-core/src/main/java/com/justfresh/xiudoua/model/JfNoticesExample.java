package com.justfresh.xiudoua.model;

import java.util.ArrayList;
import java.util.List;

public class JfNoticesExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public JfNoticesExample() {
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

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andAcceptIdsIsNull() {
            addCriterion("accept_ids is null");
            return (Criteria) this;
        }

        public Criteria andAcceptIdsIsNotNull() {
            addCriterion("accept_ids is not null");
            return (Criteria) this;
        }

        public Criteria andAcceptIdsEqualTo(String value) {
            addCriterion("accept_ids =", value, "acceptIds");
            return (Criteria) this;
        }

        public Criteria andAcceptIdsNotEqualTo(String value) {
            addCriterion("accept_ids <>", value, "acceptIds");
            return (Criteria) this;
        }

        public Criteria andAcceptIdsGreaterThan(String value) {
            addCriterion("accept_ids >", value, "acceptIds");
            return (Criteria) this;
        }

        public Criteria andAcceptIdsGreaterThanOrEqualTo(String value) {
            addCriterion("accept_ids >=", value, "acceptIds");
            return (Criteria) this;
        }

        public Criteria andAcceptIdsLessThan(String value) {
            addCriterion("accept_ids <", value, "acceptIds");
            return (Criteria) this;
        }

        public Criteria andAcceptIdsLessThanOrEqualTo(String value) {
            addCriterion("accept_ids <=", value, "acceptIds");
            return (Criteria) this;
        }

        public Criteria andAcceptIdsLike(String value) {
            addCriterion("accept_ids like", value, "acceptIds");
            return (Criteria) this;
        }

        public Criteria andAcceptIdsNotLike(String value) {
            addCriterion("accept_ids not like", value, "acceptIds");
            return (Criteria) this;
        }

        public Criteria andAcceptIdsIn(List<String> values) {
            addCriterion("accept_ids in", values, "acceptIds");
            return (Criteria) this;
        }

        public Criteria andAcceptIdsNotIn(List<String> values) {
            addCriterion("accept_ids not in", values, "acceptIds");
            return (Criteria) this;
        }

        public Criteria andAcceptIdsBetween(String value1, String value2) {
            addCriterion("accept_ids between", value1, value2, "acceptIds");
            return (Criteria) this;
        }

        public Criteria andAcceptIdsNotBetween(String value1, String value2) {
            addCriterion("accept_ids not between", value1, value2, "acceptIds");
            return (Criteria) this;
        }

        public Criteria andRefuseIdsIsNull() {
            addCriterion("refuse_ids is null");
            return (Criteria) this;
        }

        public Criteria andRefuseIdsIsNotNull() {
            addCriterion("refuse_ids is not null");
            return (Criteria) this;
        }

        public Criteria andRefuseIdsEqualTo(String value) {
            addCriterion("refuse_ids =", value, "refuseIds");
            return (Criteria) this;
        }

        public Criteria andRefuseIdsNotEqualTo(String value) {
            addCriterion("refuse_ids <>", value, "refuseIds");
            return (Criteria) this;
        }

        public Criteria andRefuseIdsGreaterThan(String value) {
            addCriterion("refuse_ids >", value, "refuseIds");
            return (Criteria) this;
        }

        public Criteria andRefuseIdsGreaterThanOrEqualTo(String value) {
            addCriterion("refuse_ids >=", value, "refuseIds");
            return (Criteria) this;
        }

        public Criteria andRefuseIdsLessThan(String value) {
            addCriterion("refuse_ids <", value, "refuseIds");
            return (Criteria) this;
        }

        public Criteria andRefuseIdsLessThanOrEqualTo(String value) {
            addCriterion("refuse_ids <=", value, "refuseIds");
            return (Criteria) this;
        }

        public Criteria andRefuseIdsLike(String value) {
            addCriterion("refuse_ids like", value, "refuseIds");
            return (Criteria) this;
        }

        public Criteria andRefuseIdsNotLike(String value) {
            addCriterion("refuse_ids not like", value, "refuseIds");
            return (Criteria) this;
        }

        public Criteria andRefuseIdsIn(List<String> values) {
            addCriterion("refuse_ids in", values, "refuseIds");
            return (Criteria) this;
        }

        public Criteria andRefuseIdsNotIn(List<String> values) {
            addCriterion("refuse_ids not in", values, "refuseIds");
            return (Criteria) this;
        }

        public Criteria andRefuseIdsBetween(String value1, String value2) {
            addCriterion("refuse_ids between", value1, value2, "refuseIds");
            return (Criteria) this;
        }

        public Criteria andRefuseIdsNotBetween(String value1, String value2) {
            addCriterion("refuse_ids not between", value1, value2, "refuseIds");
            return (Criteria) this;
        }

        public Criteria andIsSendToAllIsNull() {
            addCriterion("is_send_to_all is null");
            return (Criteria) this;
        }

        public Criteria andIsSendToAllIsNotNull() {
            addCriterion("is_send_to_all is not null");
            return (Criteria) this;
        }

        public Criteria andIsSendToAllEqualTo(Byte value) {
            addCriterion("is_send_to_all =", value, "isSendToAll");
            return (Criteria) this;
        }

        public Criteria andIsSendToAllNotEqualTo(Byte value) {
            addCriterion("is_send_to_all <>", value, "isSendToAll");
            return (Criteria) this;
        }

        public Criteria andIsSendToAllGreaterThan(Byte value) {
            addCriterion("is_send_to_all >", value, "isSendToAll");
            return (Criteria) this;
        }

        public Criteria andIsSendToAllGreaterThanOrEqualTo(Byte value) {
            addCriterion("is_send_to_all >=", value, "isSendToAll");
            return (Criteria) this;
        }

        public Criteria andIsSendToAllLessThan(Byte value) {
            addCriterion("is_send_to_all <", value, "isSendToAll");
            return (Criteria) this;
        }

        public Criteria andIsSendToAllLessThanOrEqualTo(Byte value) {
            addCriterion("is_send_to_all <=", value, "isSendToAll");
            return (Criteria) this;
        }

        public Criteria andIsSendToAllIn(List<Byte> values) {
            addCriterion("is_send_to_all in", values, "isSendToAll");
            return (Criteria) this;
        }

        public Criteria andIsSendToAllNotIn(List<Byte> values) {
            addCriterion("is_send_to_all not in", values, "isSendToAll");
            return (Criteria) this;
        }

        public Criteria andIsSendToAllBetween(Byte value1, Byte value2) {
            addCriterion("is_send_to_all between", value1, value2, "isSendToAll");
            return (Criteria) this;
        }

        public Criteria andIsSendToAllNotBetween(Byte value1, Byte value2) {
            addCriterion("is_send_to_all not between", value1, value2, "isSendToAll");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andSendTimeIsNull() {
            addCriterion("send_time is null");
            return (Criteria) this;
        }

        public Criteria andSendTimeIsNotNull() {
            addCriterion("send_time is not null");
            return (Criteria) this;
        }

        public Criteria andSendTimeEqualTo(Long value) {
            addCriterion("send_time =", value, "sendTime");
            return (Criteria) this;
        }

        public Criteria andSendTimeNotEqualTo(Long value) {
            addCriterion("send_time <>", value, "sendTime");
            return (Criteria) this;
        }

        public Criteria andSendTimeGreaterThan(Long value) {
            addCriterion("send_time >", value, "sendTime");
            return (Criteria) this;
        }

        public Criteria andSendTimeGreaterThanOrEqualTo(Long value) {
            addCriterion("send_time >=", value, "sendTime");
            return (Criteria) this;
        }

        public Criteria andSendTimeLessThan(Long value) {
            addCriterion("send_time <", value, "sendTime");
            return (Criteria) this;
        }

        public Criteria andSendTimeLessThanOrEqualTo(Long value) {
            addCriterion("send_time <=", value, "sendTime");
            return (Criteria) this;
        }

        public Criteria andSendTimeIn(List<Long> values) {
            addCriterion("send_time in", values, "sendTime");
            return (Criteria) this;
        }

        public Criteria andSendTimeNotIn(List<Long> values) {
            addCriterion("send_time not in", values, "sendTime");
            return (Criteria) this;
        }

        public Criteria andSendTimeBetween(Long value1, Long value2) {
            addCriterion("send_time between", value1, value2, "sendTime");
            return (Criteria) this;
        }

        public Criteria andSendTimeNotBetween(Long value1, Long value2) {
            addCriterion("send_time not between", value1, value2, "sendTime");
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