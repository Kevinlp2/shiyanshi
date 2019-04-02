package com.entity;

public class Syssb {
    private int id;
    private int sid;
    private int sbid;
    private int snum;
    private String time;

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getSbid() {
        return sbid;
    }

    public void setSbid(int sbid) {
        this.sbid = sbid;
    }

    public int getSnum() {
        return snum;
    }

    public void setSnum(int snum) {
        this.snum = snum;
    }

    public Syssb() {
    }

    @Override
    public String toString() {
        return "Syssb{" +
                "id=" + id +
                ", sid=" + sid +
                ", sbid=" + sbid +
                ", snum=" + snum +
                ", time='" + time + '\'' +
                '}';
    }
}
