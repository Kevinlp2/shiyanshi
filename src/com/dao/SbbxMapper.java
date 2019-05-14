package com.dao;

import com.entity.Sbbx;
import com.entity.ShiYan;

import java.util.List;
import java.util.Map;

public interface SbbxMapper {
    int deleteByPrimaryKey(Integer wid);

    int insert(Sbbx record);

    int insertSelective(Sbbx record);

    Sbbx selectByPrimaryKey(Integer wid);

    int updateByPrimaryKeySelective(Sbbx record);

    int updateByPrimaryKey(Sbbx record);

    //  查询所有信息
    public List<Sbbx> getAll();
    //  获取条数
    public int getCount(Map<String, Object> po);
    //  分页
    public List<Sbbx> getByPage(Map<String, Object> map);
    //  模糊查询并分页
    public List<Sbbx> select(Map<String, Object> map);
}