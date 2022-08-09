package com.kktshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kktshop.ajax.Jumsu;
import com.kktshop.dao.JumsuDAO;

@Service
public class JumsuServiceImpl implements JumsuService {

	@Autowired
	JumsuDAO jumsuDAO;
	
	@Override
	public void multiInsert(Jumsu jumsu) throws Exception {
		jumsuDAO.multiInsert(jumsu);		
	}
}