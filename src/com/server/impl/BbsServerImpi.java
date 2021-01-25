package com.server.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BbsMapper;
import com.entity.BbsWithBLOBs;
import com.server.BbsServer;
@Service
public class BbsServerImpi implements BbsServer {
    @Resource
    private BbsMapper ndao;
	@Override
	public int add(BbsWithBLOBs po) {
		return ndao.insert(po);
	}

	@Override
	public int update(BbsWithBLOBs po) {
		return ndao.updateByPrimaryKeySelective(po);
	}

	@Override
	public int delete(int id) {
		return ndao.deleteByPrimaryKey(id);
	}

	@Override
	public List<BbsWithBLOBs> getAll(Map<String, Object> map) {
		return ndao.getAll(map);
	}


	@Override
	public List<BbsWithBLOBs> getByPage(Map<String, Object> map) {
		return ndao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return ndao.getCount(map);
	}


	@Override
	public BbsWithBLOBs getById(int id) {
		return ndao.selectByPrimaryKey(id);
	}

	

}
