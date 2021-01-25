package com.server.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.dao.RecordMapper;
import com.entity.Record;
import com.server.RecordServier;
@Service
public class RecordServiceImpi implements RecordServier {
	@Resource
    private RecordMapper userdao;
	
	@Override
	public int add(Record po) {
		return userdao.insert(po);
	}
	@Override
	public int update(Record po) {
		return userdao.updateByPrimaryKeySelective(po);
	}
	@Override
	public int delete(int id) {
		return userdao.deleteByPrimaryKey(id);
	}
	@Override
	public List<Record> getAll(Map<String, Object> map) {
		return userdao.getAll(map);
	}
	@Override
	public List<Record> getByPage(Map<String, Object> map) {
		return userdao.getByPage(map);
	}
	@Override
	public int getCount(Map<String, Object> po) {
		return userdao.getCount(po);
	}
	@Override
	public List<Record> select(Map<String, Object> map) {
		return userdao.select(map);
	}
	@Override
	public Record getById(int id) {
		return userdao.selectByPrimaryKey(id);
	}

}
