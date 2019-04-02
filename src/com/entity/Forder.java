package com.entity;

public class Forder {
    private Integer kid;

    private Integer uid;

    private Integer fid;
    private Integer sid;

    private String status;

    private String pj;

    private String stime;

    private String etime;

    private String ftype;

    private String isdel;

    private String pubtime;

    private Integer snum;

    public Integer getKid() {
        return kid;
    }

    public void setKid(Integer kid) {
        this.kid = kid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getPj() {
        return pj;
    }

    public void setPj(String pj) {
        this.pj = pj == null ? null : pj.trim();
    }

    public String getStime() {
        return stime;
    }

    public void setStime(String stime) {
        this.stime = stime == null ? null : stime.trim();
    }

    public String getEtime() {
        return etime;
    }

    public void setEtime(String etime) {
        this.etime = etime == null ? null : etime.trim();
    }

    public String getFtype() {
        return ftype;
    }

    public void setFtype(String ftype) {
        this.ftype = ftype;
    }

    public String getIsdel() {
        return isdel;
    }

    public void setIsdel(String isdel) {
        this.isdel = isdel == null ? null : isdel.trim();
    }

    public String getPubtime() {
        return pubtime;
    }

    public void setPubtime(String pubtime) {
        this.pubtime = pubtime == null ? null : pubtime.trim();
    }

    public Integer getSnum() {
        return snum;
    }

    public void setSnum(Integer snum) {
        this.snum = snum;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    @Override
    public String toString() {
        return "Forder{" +
                "kid=" + kid +
                ", uid=" + uid +
                ", fid=" + fid +
                ", sid=" + sid +
                ", status='" + status + '\'' +
                ", pj='" + pj + '\'' +
                ", stime='" + stime + '\'' +
                ", etime='" + etime + '\'' +
                ", ftype='" + ftype + '\'' +
                ", isdel='" + isdel + '\'' +
                ", pubtime='" + pubtime + '\'' +
                ", snum=" + snum +
                '}';
    }
}