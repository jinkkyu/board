package com.spring.mastercode.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mastercode.dao.TreeDao;
import com.spring.mastercode.dto.MasterCodeDto;
import com.spring.mastercode.dto.TreeDto;
import com.spring.mastercode.form.MasterCodeForm;
import com.spring.mastercode.form.TreeForm;

@Service
public class TreeService {
	@Autowired
	private TreeDao treeDao;

	
	/** 목록 조회 */
	public ArrayList<HashMap<String, Object>> getTreeList(TreeForm treeForm) throws Exception {
		
		List<TreeDto> list = treeDao.getTreeList(treeForm);
		
		ArrayList<HashMap<String, Object>> test = new ArrayList<HashMap<String,Object>>(); 
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("tree_model", list);
		
		test.add(map);
		
		map = new HashMap<String, Object>();
		
		//map.put("tree_model", list);
		
		//test.add(map);
		
		
		/*
		 * HashMap<String, Object> resultMap1 = new HashMap<String, Object>();
		 * 
		 * for(int i=0; i < list.size(); i++) {
		 * 
		 * resultMap1.put("tree_model", list); System.out.println("리스트숫자는" +
		 * list.size()); }
		 */

		
		
		return test;
	}

	
	
	
}
