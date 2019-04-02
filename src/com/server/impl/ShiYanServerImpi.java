package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.ShiYanMapper;
import com.entity.ShiYan;
import com.server.ShiYanServer;
@Service
public class ShiYanServerImpi implements ShiYanServer {
   @Resource
   private ShiYanMapper gdao;
	@Override
	public int add(ShiYan po) {
		return gdao.insert(po);
	}

	@Override
	public int update(ShiYan po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<ShiYan> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}

	@Override
	public ShiYan checkUname(String account) {
		return null;
	}

	@Override
	public List<ShiYan> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<ShiYan> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public ShiYan getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}
