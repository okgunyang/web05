package com.kktshop.test;

import static org.junit.Assert.fail;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kktshop.dto.MemberDTO;

@Repository
public class DAOTest2 {

	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void test() {
		System.out.println("DAO Test~!");
	}

	public List<MemberDTO> sampleList(){
		return sqlSession.selectList("sample.sampleList");
	}
	
	public int sampleCount(){
		return sqlSession.selectOne("sample.sampleCount");
	}
}
