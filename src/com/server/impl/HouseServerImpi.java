package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.HouseMapper;
import com.entity.House;
import com.server.HouseServer;
@Service
public class HouseServerImpi implements HouseServer {
   @Resource
   private HouseMapper gdao;
	@Override
	public int add(House po) {
		return gdao.insert(po);
	}

	@Override
	public int update(House po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<House> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}

	@Override
	public House checkUname(String account) {
		return null;
	}

	@Override
	public List<House> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<House> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public House getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

	@Override
	public List<House> getByPage2(Map<String, Object> map) {
		return gdao.getByPage2(map);
	}

	@Override
	public List<House> getTop10(Map<String, Object> map) {
		return gdao.getTop10(map);
	}


}
