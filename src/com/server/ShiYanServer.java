package com.server;

import java.util.List;

import java.util.Map;

import com.entity.ShiYan;

public interface ShiYanServer {
//  添加
  public int add(ShiYan po);
//  修改
  public int update(ShiYan po);
//  删除
  public int delete(int id);
//  查询
  public List<ShiYan> getAll(Map<String, Object> map);
//  验证
  public ShiYan checkUname(String account);
//  获取对象
  public ShiYan getById( int id);
//  分页显示
  public List<ShiYan> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> map);
//  模糊查询
  public List<ShiYan> select(Map<String, Object> map);
}
