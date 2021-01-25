package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Btype;

public interface BtypeServer {
	// 添加
	public int add(Btype po);

	// 修改
	public int update(Btype po);

	// 删除
	public int delete(int id);

	// 查询
	public List<Btype> getAll(Map<String, Object> map);

	// 验证
	public Btype checkUname(Map<String, Object> map);

	// 获取对象
	public Btype getById(int id);

	// 分页显示
	public List<Btype> getByPage(Map<String, Object> map);

	// 获取信息的条数
	public int getCount(Map<String, Object> map);

	// 模糊查询
	public List<Btype> select(Map<String, Object> map);
}
