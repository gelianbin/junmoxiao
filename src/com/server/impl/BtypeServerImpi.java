package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BtypeMapper;
import com.entity.Btype;
import com.server.BtypeServer;
@Service
public class BtypeServerImpi implements BtypeServer {
   @Resource
   private BtypeMapper gdao;
	@Override
	public int add(Btype po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Btype po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Btype> getAll(Map<String, Object> map) {
		return gdao.getAll(map );
	}

	@Override
	public Btype checkUname(Map<String, Object> map) {
		return gdao.checkUname(map);
	}

	@Override
	public List<Btype> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Btype> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Btype getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}
