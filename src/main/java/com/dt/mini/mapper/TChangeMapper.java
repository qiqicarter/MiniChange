package com.dt.mini.mapper;

import org.springframework.stereotype.Repository;

import com.dt.mini.model.TChange;

@Repository
public interface TChangeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TChange record);

    int insertSelective(TChange record);

    TChange selectByPrimaryKey(Integer id);
    
    TChange selectLeastOneByUser(String user);

    int updateByPrimaryKeySelective(TChange record);

    int updateByPrimaryKey(TChange record);
}