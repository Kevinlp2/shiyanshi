package com.entity;

public class ShiYan {
    private Integer id;


    private String name;

    private String address;

    private String pubtime;

    private String isdel;

    private String uid;
    private String stime;

    public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	private String ftype;

    private String mstatus;

    private Integer snum;

    private String miaoshu;

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPubtime() {
        return pubtime;
    }

    public void setPubtime(String pubtime) {
        this.pubtime = pubtime == null ? null : pubtime.trim();
    }

    public String getIsdel() {
        return isdel;
    }

    public void setIsdel(String isdel) {
        this.isdel = isdel == null ? null : isdel.trim();
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }



    public String getFtype() {
        return ftype;
    }

    public void setFtype(String ftype) {
        this.ftype = ftype == null ? null : ftype.trim();
    }

    public String getMstatus() {
        return mstatus;
    }

    public void setMstatus(String mstatus) {
        this.mstatus = mstatus == null ? null : mstatus.trim();
    }

    public Integer getSnum() {
        return snum;
    }

    public void setSnum(Integer snum) {
        this.snum = snum;
    }

    public String getMiaoshu() {
        return miaoshu;
    }

    public void setMiaoshu(String miaoshu) {
        this.miaoshu = miaoshu == null ? null : miaoshu.trim();
    }

	@Override
	public String toString() {
		return "ShiYan [id=" + id + ", name=" + name + ", address=" + address
				+ ", pubtime=" + pubtime + ", isdel=" + isdel + ", uid=" + uid
				+ ", ftype=" + ftype + ", mstatus=" + mstatus + ", snum="
				+ snum + ", miaoshu=" + miaoshu + "]";
	}
    
}