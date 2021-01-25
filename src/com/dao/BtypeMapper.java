package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Btype;

public interface BtypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Btype record);

    int insertSelective(Btype record);

    Btype selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Btype record);

    int updateByPrimaryKey(Btype record);
    
    public Btype checkUname(Map<String, Object> map);
//  查询所有信息
  public List<Btype> getAll(Map<String, Object> map);
//  获取条数
  public int getCount(Map<String, Object> po); 
//  分页
  public List<Btype> getByPage(Map<String, Object> map);
//  模糊查询并分页
  public List<Btype> select(Map<String, Object> map);
}