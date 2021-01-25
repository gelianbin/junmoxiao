package com.dao;

import com.entity.SysLog;

import java.util.List;
import java.util.Map;

public interface SysLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysLog record);

    int insertSelective(SysLog record);

    SysLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysLog record);

    int updateByPrimaryKey(SysLog record);

    //  查询所有信息
    public List<SysLog> getAll(Map<String, Object> map);
    //  获取条数
    public int getCount(Map<String, Object> po);
    //  分页
    public List<SysLog> getByPage(Map<String, Object> map);
    //  模糊查询并分页
    public List<SysLog> select(Map<String, Object> map);
}