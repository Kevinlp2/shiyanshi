package com.server;

import com.entity.Syssb;

import java.util.List;
import java.util.Map;

public interface SyssbServer {
    //  添加
     int add(Syssb po);
    //  修改
     int update(Syssb po);
    //  删除
     int delete(int id);
    //  查询
     List<Syssb> getAll(Map<String, Object> map);

    //  分页显示
    List<Syssb> getByPage(Map<String, Object> map);

}
