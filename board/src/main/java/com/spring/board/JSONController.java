package com.spring.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class JSONController {
	@RequestMapping(value="testAPI")
	public Map<String,Object> testAPI(){
			Map<String,Object> result = new HashMap<String, Object>();
			result.put("key1", "first");
			result.put("key2", "second");
			return result;
	}
	
}
