package com.entity;

public class Sbbx {
    private Integer wid;

    private Integer sysid;

    private Integer sbid;

    private String bxyy;

    private Integer uid;

    private String bxtime;

    private String bstatus;

    private Integer bxnum;

    private Integer cluid;

    private String cltime;

    public Integer getWid() {
        return wid;
    }

    public void setWid(Integer wid) {
        this.wid = wid;
    }

    public Integer getSysid() {
        return sysid;
    }

    public void setSysid(Integer sysid) {
        this.sysid = sysid;
    }

    public Integer getSbid() {
        return sbid;
    }

    public void setSbid(Integer sbid) {
        this.sbid = sbid;
    }

    public String getBxyy() {
        return bxyy;
    }

    public void setBxyy(String bxyy) {
        this.bxyy = bxyy == null ? null : bxyy.trim();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getBxtime() {
        return bxtime;
    }

    public void setBxtime(String bxtime) {
        this.bxtime = bxtime == null ? null : bxtime.trim();
    }

    public String getBstatus() {
        return bstatus;
    }

    public void setBstatus(String bstatus) {
        this.bstatus = bstatus == null ? null : bstatus.trim();
    }

    public Integer getBxnum() {
        return bxnum;
    }

    public void setBxnum(Integer bxnum) {
        this.bxnum = bxnum;
    }

    public Integer getCluid() {
        return cluid;
    }

    public void setCluid(Integer cluid) {
        this.cluid = cluid;
    }

    public String getCltime() {
        return cltime;
    }

    public void setCltime(String cltime) {
        this.cltime = cltime == null ? null : cltime.trim();
    }
}