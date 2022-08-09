package com.kktshop.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/ajax/")
public class AjaxController {
	
	//REST 방식의 Ajax 구현
	
	@ResponseBody
	@RequestMapping(value="/ajax0.do", produces="text/plain; charset=UTF-8") //String 반환
	public String ajax0() {
		log.info("MIME TYPE :" + MediaType.TEXT_PLAIN_VALUE);
		return "<h2>안녕하세요~! AJAX~!</h2>";
	}
	
	@ResponseBody
	@GetMapping(value="/ajax1.do", produces={MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE}) //DTO를 xml로 반환 
	public EMP ajax1() {
		return new EMP(1004, "김기태", "화정동");
	}
	
	@ResponseBody
	@GetMapping(value="/ajax2.do") //컬렉션 List 타입으로 반환
	public List<EMP> ajax2() {
		return IntStream.range(1, 10).mapToObj(i -> new EMP(i, "name"+i, "addr"+i))
				.collect(Collectors.toList());
	}

	@ResponseBody
	@GetMapping(value="/ajax3.do") //컬렉션 Map 타입으로 반환
	public Map<String, EMP> ajax3() {
		Map<String, EMP> map = new HashMap<>();
		map.put("first", new EMP(1004, "김기태", "화정동"));
		map.put("second", new EMP(7979, "조재영", "주엽동"));
		return map;
	}
	
	//ajax/ajax4.do?name=kim&address=화정동
	@ResponseBody
	@GetMapping(value="/ajax4.do", params={"name","address"}) //매개변수로 데이터 값 처리하여 반환
	public ResponseEntity<EMP> ajax4(String name, String address) {
		EMP dto = new EMP(1004, name, address);
		ResponseEntity<EMP> result = null;
		if(name.equals("kim")) { //kim이 아니면 상태코드 502를 같이 반환
			result = ResponseEntity.status(HttpStatus.OK).body(dto);
		} else {
			result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(dto);
		}
		return result;
	}
	
	//ajax/ajax5.do/kim/화정동
	@ResponseBody
	@GetMapping(value="/ajax5.do/{name}/{address}") //@PathVariable을 활용하여 매개변수로 데이터 값 처리하여 반환
	public String[] ajax5(@PathVariable("name") String name,
			@PathVariable("address") String address) {
			return new String[] {"name:"+name,"address:"+address};
	}
	    
}