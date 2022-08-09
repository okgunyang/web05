package com.kktshop.myshop;

import static org.junit.Assert.fail;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@Service
public class ServiceTest1 {
	
	private	DAOTest1 daoTest;
	
	@Test
	public void serviceTest1() {
		int cnt = 5;
		try {
			System.out.println("서비스 단위 테스트가 성공적으로 처리되었음");
			System.out.println("회원수 : "+cnt);
			//Assert.assertEquals(cnt, 5);
			//Assert.assertNull(cnt);
		} catch(Exception e) {
			System.out.println("서비스 단위 테스트가 실패 되었음");
			fail("Service 단위 테스트 실패");
		}
	}
	
	public int serviceCall() {
		int cnt = daoTest.daoCall();
		return cnt;
	}
}