package com.server;

import com.entity.SysLog;

import java.util.List;
import java.util.Map;


public interface SysLogServier {
//  添加用户
  public int add(SysLog po);
//  获取单个用户信息
  public SysLog getById(int id);
//  修改用户
  public int update(SysLog po);
//  删除用户
  public int delete(int id);
//  查询用户
  public List<SysLog> getAll(Map<String, Object> map);
//  分页显示
  public List<SysLog> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> po);
//模糊查询并分页
public List<SysLog> select(Map<String, Object> map);

}
