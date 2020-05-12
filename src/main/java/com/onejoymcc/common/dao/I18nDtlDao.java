package com.onejoymcc.common.dao;

import com.onejoymcc.common.model.I18nDtl;

import java.util.HashMap;

public interface I18nDtlDao {
	
	public I18nDtl selectById(HashMap<String, Object> hMap);
}
