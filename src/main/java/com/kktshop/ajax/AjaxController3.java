package com.kktshop.ajax;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/ajax/")
public class AjaxController3 {
	
	@ResponseBody 
	@RequestMapping(value="ajax13.do", method=RequestMethod.GET)
	public Map<String, String> ajax13() { //Map 활용
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "성공");
		return map;
	}
	
	@GetMapping(value="ajaxForm14.do")
	public String ajaxForm9() {
		return "ajax/ajaxForm14";
	}
	
	@ResponseBody 
	@RequestMapping(value="ajax14.do", method=RequestMethod.GET)
	public JSONObject ajax14() {   //JSONObject 활용
		JSONObject ob = new JSONObject();
		ob.put("id", "kim");
		ob.put("name", "김");
		return ob;
	}
	
	@ResponseBody 
	@RequestMapping(value="ajax15.do", method=RequestMethod.GET)
	public JSONArray ajax15() {	//JSONArray 활용
		JSONObject ob = new JSONObject();
		ob.put("id", "kim");
		ob.put("name", "김");
		
		JSONObject ob2 = new JSONObject();
		ob.put("id", "lee");
		ob.put("name", "이");
		
		JSONArray arr = new JSONArray();
		arr.put(ob);
		arr.put(ob2);
		return arr;
	}
	
}
