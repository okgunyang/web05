package com.kktshop.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kktshop.dto.MemberDTO;

@Controller
public class ControllerTest2 {

	@Autowired
	ServiceTest2 serviceTest;
		
	@Test
	public void test() {
		System.out.println("Controller Test~!");
	}
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String test2(MemberDTO sample, Model model) {
		int count = serviceTest.sampleCount();
		model.addAttribute("cnt", count);
		List<MemberDTO> sampleList = serviceTest.sampleList();
		model.addAttribute("sampleList", sampleList);
		return "test";
	}
}