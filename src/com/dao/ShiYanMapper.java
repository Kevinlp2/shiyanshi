package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.ShiYan;

public interface ShiYanMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ShiYan record);

    int insertSelective(ShiYan record);

    ShiYan selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ShiYan record);

    int updateByPrimaryKeyWithBLOBs(ShiYan record);

    int updateByPrimaryKey(ShiYan record);
    
    public ShiYan checkUname(Map<String, Object> uname);
//  查询所有信息
  public List<ShiYan> getAll(Map<String, Object> map);
//  获取条数
  public int getCount(Map<String, Object> po); 
//  分页
  public List<ShiYan> getByPage(Map<String, Object> map);
//  模糊查询并分页
  public List<ShiYan> select(Map<String, Object> map);
}