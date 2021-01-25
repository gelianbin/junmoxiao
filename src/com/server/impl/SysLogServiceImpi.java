package com.server.impl;

import com.dao.SysLogMapper;
import com.entity.SysLog;
import com.server.SysLogServier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class SysLogServiceImpi implements SysLogServier {
	@Resource
    private SysLogMapper userdao;
	
	@Override
	public int add(SysLog po) {
		return userdao.insert(po);
	}
	@Override
	public int update(SysLog po) {
		return userdao.updateByPrimaryKeySelective(po);
	}
	@Override
	public int delete(int id) {
		return userdao.deleteByPrimaryKey(id);
	}
	@Override
	public List<SysLog> getAll(Map<String, Object> map) {
		return userdao.getAll(map);
	}
	@Override
	public List<SysLog> getByPage(Map<String, Object> map) {
		return userdao.getByPage(map);
	}
	@Override
	public int getCount(Map<String, Object> po) {
		return userdao.getCount(po);
	}
	@Override
	public List<SysLog> select(Map<String, Object> map) {
		return userdao.select(map);
	}
	@Override
	public SysLog getById(int id) {
		return userdao.selectByPrimaryKey(id);
	}

}
