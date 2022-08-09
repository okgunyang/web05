package com.kktshop.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kktshop.service.JumsuService;

@Controller
@RequestMapping("/ajax/")
public class AjaxController2 {
	
	@GetMapping(value="ajaxForm6.do")
	public String ajaxForm6() {
		return "ajax/ajaxForm6";
	}

	//post 방식의 json 형태로 객체를 전달받는 방식으로 jsp에서 보내온 데이터가 json임을 headers로 기재해주어야 함
	//@RequestBody EMP emp
	//@RequestParam("sno") int sno, @RequestParam("name") String name, @RequestParam("sno") String address 개별로 받기
	@ResponseBody 
	@RequestMapping(value="ajax6.do", method=RequestMethod.POST, headers="Accept=application/json")
	public EMP ajax6(@RequestBody EMP data, HttpServletRequest request, Model model) {
		System.out.println("emp : "+(data.getSno()));
		return data;
	}
	
	@GetMapping(value="ajaxForm7.do")
	public String ajaxForm7() {
		return "ajax/ajaxForm7";
	}
	
	//post 방식의 json 형태로 객체를 전달받는 방식으로 jsp에서 보내온 데이터가 json임을 headers로 기재해주어야 함 
	@ResponseBody 
	@RequestMapping(value="ajax7.do", method=RequestMethod.POST, headers="Accept=application/json")
	public UserDTO ajax7(@RequestBody UserDTO data, HttpServletRequest request, Model model) {
		System.out.println("emp : "+(data.getId()));
		//UserDTO dto = service.userLogin(data);
		//비밀번호와 일치하면, 세션 생성
		if(data.getId().equals("admin")) {
			data.setGg("관리자");
		} else {
			data.setGg("일반사용자");
		}
		return data;
	}
	
	@GetMapping(value="ajaxForm8.do")
	public String ajaxForm8() {
		return "ajax/ajaxForm8";
	}
	
	@GetMapping(value="ajaxForm9.do")
	public String ajaxForm9() {
		return "ajax/ajaxForm9";
	}

	//post 방식의 객체로 받아 처리되는 경우의 아이디 중복 체크 
	@ResponseBody 
	@RequestMapping(value="ajax8.do", method=RequestMethod.POST)
	public String ajax8(UserDTO user, Model model) {
		//UserDTO dto = service.userIdCheck(id);
		//dto가 null 이 아니면, 사용이 불가능한 아이디, null이면 사용이 가능한 아이디
		String msg = "";
		if(user.getId().equals("admin")) {
			msg = "no";
		} else {
			msg = "ok";
		}
		model.addAttribute("msg", msg);
		return msg;
	}
	
	
	//get 방식의 id만 받아 처리되는 경우의 아이디 중복 체크
	@ResponseBody 
	@RequestMapping(value="ajax9.do", method=RequestMethod.GET)
	public String ajax9(String id, Model model) {
		//UserDTO dto = service.userIdCheck(id);
		//dto가 null 이 아니면, 사용이 불가능한 아이디, null이면 사용이 가능한 아이디
		String msg = "";
		if(id.equals("admin")) {
			msg = "no";
		} else {
			msg = "ok";
		}
		model.addAttribute("msg", msg);
		return msg;
	}
	
	@GetMapping(value="ajaxForm10.do")
	public String ajaxForm10() {
		return "ajax/ajaxForm10";
	}

	//get 방식의 @RequestParam으로 받아 처리하는 경우
	@ResponseBody
	@RequestMapping(value="ajax10.do", method=RequestMethod.GET)
	public String ajax10(@RequestParam("id") String id, Model model) {
		String msg = "";
		if(id.equals("admin")) {
			msg = "no";
		} else {
			msg = "ok";
		}
		model.addAttribute("msg", msg);
		return msg;
	}
	
	@GetMapping(value="ajaxForm11.do")
	public String ajaxForm11() {
		return "ajax/ajaxForm11";
	}
	
	//post 방식의 @RequestBody 로 받아 처리
	@ResponseBody 
	@RequestMapping(value="ajax11.do", method=RequestMethod.POST)
	public String ajax11(@RequestBody UserDTO user, Model model) {
		//UserDTO dto = service.userIdCheck(id);
		//dto가 null 이 아니면, 사용이 불가능한 아이디, null이면 사용이 가능한 아이디
		String msg = "";
		if(user.getId().equals("admin")) {
			msg = "no";
		} else {
			msg = "ok";
		}
		model.addAttribute("msg", msg);
		return msg;
	}
	
	@GetMapping(value="ajaxForm12.do")
	public String ajaxForm12() {
		return "ajax/ajaxForm12";
	}
	
	@Autowired
	JumsuService jumsuService;
	
	//여러 데이터를 받아와서 처리하는 방법
	@ResponseBody 
	@PostMapping("ajax12.do")
	public void ajax12(@RequestBody List<Jumsu> jum, Model model) throws IOException {
		jum.stream().forEach(j -> {
			System.out.println(j.toString());
			try {
				jumsuService.multiInsert(j);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
		//만약, 여러 데이터를 jsp에서 받아 -> 서비스 -> DAO -> Mapper로 넘겨 복수 개의 데이터를 데이터베이스로 추가하는 경우 
		//service.multiInsert(jum);
		//서비스에서는 public void multiInsert(List<Jumsu> jum) { dao.multiInsert(jum); }
		//DAO에서는 public void multiInsert(List<Jumsu> jum) { sql.insert("jumsu.multiInsert", jum); }
	}
}
