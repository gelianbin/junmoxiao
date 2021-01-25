package com.server;

import java.util.List;

import java.util.Map;

import com.entity.House;

public interface HouseServer {
//  添加
  public int add(House po);
//  修改
  public int update(House po);
//  删除
  public int delete(int id);
//  查询
  public List<House> getAll(Map<String, Object> map);
//  验证
  public House checkUname(String account);
//  获取对象
  public House getById( int id);
//  分页显示
  public List<House> getByPage(Map<String, Object> map);
  //排行榜
  public List<House> getByPage2(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> map);
//  模糊查询
  public List<House> select(Map<String, Object> map);
  
  public List<House> getTop10(Map<String, Object> map);
}
