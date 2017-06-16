package com.dt.mini.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dt.mini.mapper.TChangeMapper;
import com.dt.mini.model.TChange;
import com.dt.mini.service.ChangeService;

@Service("service")
public class ChangeServiceImpl implements ChangeService{
	@Autowired
	TChangeMapper mapper;
	
	@Override
	public void addChangeRecord(TChange change) {
		mapper.insert(change);
	}

	@Override
	public TChange getUserLeastChange(String user) {
		return mapper.selectLeastOneByUser(user);
	}

}
