package com.kktshop.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kktshop.dto.MemberDTO;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	//servlet-context.xml에서 해당 인터셉터를 등록
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		//로그인을 하지 않았을 경우 로그인 페이지로 이동
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		if(member == null) {
			response.sendRedirect("../member/loginForm.do");
			return false;
		}
		//관리자 등급이 아닌 사용자일 경우 메인 페이지로 이동
		if(member.getGrade() != 9) {
			response.sendRedirect("/");
			return false;
		}
		return true;
	}
}
