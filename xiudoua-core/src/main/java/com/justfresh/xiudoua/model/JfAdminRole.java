package com.justfresh.xiudoua.model;

import com.justfresh.xiudoua.entity.CommonFormParam;

public class JfAdminRole extends CommonFormParam{
    private Integer id;

    private String roleName;

    private String menuSerial;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getMenuSerial() {
        return menuSerial;
    }

    public void setMenuSerial(String menuSerial) {
        this.menuSerial = menuSerial == null ? null : menuSerial.trim();
    }
}