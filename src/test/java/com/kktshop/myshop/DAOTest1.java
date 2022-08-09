package com.kktshop.myshop;

import static org.junit.Assert.fail;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@Repository
public class DAOTest1 {

	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void daoTest1() {
		int cnt;
		try {
			cnt = daoCall();
			System.out.println("DAO 단위 테스트가 성공적으로 처리되었음");
			System.out.println("회원수 : "+cnt);
		} catch(Exception e) {
			System.out.println("DAO 단위 테스트가 실패 되었습니다.");
			fail("DAO 단위 테스트 실패");
		}
	}
	
	public int daoCall() {
		return sqlSession.selectOne("member.memberCount");
	}
}
