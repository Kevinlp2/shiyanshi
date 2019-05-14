package com.dao;

import com.entity.Sbbf;

import java.util.List;

public interface SbbfMapper {
    int deleteByPrimaryKey(Integer bid);

    int insert(Sbbf record);

    int insertSelective(Sbbf record);

    Sbbf selectByPrimaryKey(Integer bid);

    int updateByPrimaryKeySelective(Sbbf record);

    int updateByPrimaryKey(Sbbf record);

    //  查询所有信息
    List<Sbbf> getAll();
}