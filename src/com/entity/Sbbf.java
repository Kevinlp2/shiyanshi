package com.entity;

public class Sbbf {
    private Integer bid;

    private Integer sysid;

    private Integer sbid;

    private Integer bfsnum;

    private String bftime;

    private String bfyy;

    private Integer uid;

    private String status;

    private Integer cluid;

    private String cltime;

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
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

    public Integer getBfsnum() {
        return bfsnum;
    }

    public void setBfsnum(Integer bfsnum) {
        this.bfsnum = bfsnum;
    }

    public String getBftime() {
        return bftime;
    }

    public void setBftime(String bftime) {
        this.bftime = bftime == null ? null : bftime.trim();
    }

    public String getBfyy() {
        return bfyy;
    }

    public void setBfyy(String bfyy) {
        this.bfyy = bfyy == null ? null : bfyy.trim();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
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