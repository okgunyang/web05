package com.kktshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kktshop.dto.DatabankDTO;

@Repository
public class FileDAOImpl implements FileDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void databankInsert(DatabankDTO databank) throws Exception {
		sqlSession.insert("databank.databankInsert", databank);	
	}

	@Override
	public List<DatabankDTO> databankList() throws Exception {
		return sqlSession.selectList("databank.databankList");
	}
}
