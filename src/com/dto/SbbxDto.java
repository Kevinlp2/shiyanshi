package com.dto;

import com.entity.Sbbx;

/**
 * @author Liupeng
 * @date 2019/5/14 8:58
 */
public class SbbxDto extends Sbbx {
    private String sysname;
    private String sbname;
    private String uname;
    private String cluname;

    public String getSysname() {
        return sysname;
    }

    public void setSysname(String sysname) {
        this.sysname = sysname;
    }

    public String getSbname() {
        return sbname;
    }

    public void setSbname(String sbname) {
        this.sbname = sbname;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getCluname() {
        return cluname;
    }

    public void setCluname(String cluname) {
        this.cluname = cluname;
    }
}
