package com.dt.mini.service;

import com.dt.mini.model.TChange;

public interface ChangeService {
	void addChangeRecord(TChange change);
	TChange getUserLeastChange(String user);
}
