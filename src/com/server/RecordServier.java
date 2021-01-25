package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Record;



public interface RecordServier {
//  添加用户
  public int add(Record po);
//  获取单个用户信息
  public Record getById(int id);
//  修改用户
  public int update(Record po);
//  删除用户
  public int delete(int id);
//  查询用户
  public List<Record> getAll(Map<String, Object> map);
//  分页显示
  public List<Record> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> po);
//模糊查询并分页
public List<Record> select(Map<String, Object> map);

}
