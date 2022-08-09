package com.kktshop.test2;

import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;

import com.kktshop.dto.MemberDTO;
import com.kktshop.service.MemberService;

@Controller
public class LoginControllerTest {

	@Autowired
	MemberService memberService;
	
	@Autowired
	HttpSession session;
	
	@Test
	public void test() throws Exception {  //로그인 테스트
		System.out.println("Controller Test~!");
		MemberDTO member = new MemberDTO();
		member.setId("admin");
		member.setPwd("1234");
		System.out.println("Controller id : "+member.getId());
		boolean login = memberService.loginMemberTest(member);
		if(login==true) {
			System.out.println("로그인 성공");
		} else {
			System.out.println("로그인 실패");
		}
	}
}