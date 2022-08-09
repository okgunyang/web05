package com.kktshop.myshop;

import org.junit.Test;
import org.junit.Assert;
import com.kktshop.dto.MemberDTO;

public class DTOTest1 {
	
	@Test
	public void test() {
		System.out.println("DTO Test~!");
		MemberDTO member = new MemberDTO();
		member.setUname("관리자");
		member.setId("admin");
		member.setEmail("admin@kktshop.com");
		member.setPhone("010-1234-5678");
		member.setBirth("2022-06-28");
		DTOTest(member);
	}
	/*
	   	assertEquals([message], expected, actual) : 두 값이 같은 지 비교
		assertSame([message], expceted, actual), assertNotSame([message], expceted, actual) : 두 객체가 동일한 객체인지 비교
		assertTrue([message], expceted), assertFalse([message], expceted) : 참/거짓 판별
		assertNull([message], expceted), assertNotNull([message], expceted) : null여부 판단
		fail([message]) : 테스트 실패로 판단
	 */
	public void DTOTest(MemberDTO mem) {
		try {
			Assert.assertNotNull(mem);	//값이 비어있는지 테스트
			Assert.assertEquals(mem.getUname(), "관리자"); //특정 속성값의 일치 비교 테스트
		} catch(Exception e) {
			Assert.fail("해당 DTO가 비정상적임");
		}
	}
}