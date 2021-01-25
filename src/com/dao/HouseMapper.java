package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.House;

public interface HouseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(House record);

    int insertSelective(House record);

    House selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(House record);

    int updateByPrimaryKeyWithBLOBs(House record);

    int updateByPrimaryKey(House record);
    
    
    public House checkUname(Map<String, Object> uname);
//  查询所有信息
  public List<House> getAll(Map<String, Object> map);
//  获取条数
  public int getCount(Map<String, Object> po); 
//  分页
  public List<House> getByPage(Map<String, Object> map);
  //排行榜
  public List<House> getByPage2(Map<String, Object> map);
//  模糊查询并分页
  public List<House> select(Map<String, Object> map);
  
  public List<House> getTop10(Map<String, Object> map);
}