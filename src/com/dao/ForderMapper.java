package com.dao;

import com.entity.Forder;
import com.entity.TongJi;

import java.util.List;
import java.util.Map;

public interface ForderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Forder record);

    int insertSelective(Forder record);

    Forder selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Forder record);

    int updateByPrimaryKey(Forder record);

    //  查询所有信息
    public List<Forder> getAll(Map<String, Object> map);
    //  获取条数
    public int getCount(Map<String, Object> po);
    //  分页
    public List<Forder> getByPage(Map<String, Object> map);
    //  模糊查询并分页
    public List<Forder> select(Map<String, Object> map);

    public List<TongJi> getTongJi(Map<String, Object> map);

    public List<TongJi> getTongJi_cp(Map<String, Object> map);
}