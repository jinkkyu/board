package com.spring.mastercode.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mastercode.dao.OrganizationDao;
import com.spring.mastercode.dto.OrganizationDto;
import com.spring.mastercode.dto.TreeDto;
import com.spring.mastercode.form.OrganizationForm;
import com.spring.mastercode.form.TreeForm;
import com.spring.mastercode.model.GroupTreeModel;
import com.spring.mastercode.model.OrganizationModel;
import com.spring.mastercode.model.parseGroupTree;

@Service
public class OrganizationService {
	@Autowired
	private OrganizationDao organizationDao;
	private parseGroupTree parse_tree = new parseGroupTree();
	
	public List<GroupTreeModel> getOrganizationTree(OrganizationModel param) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("리스트" + param.getDept_code());
		
		return parse_tree.generateGroupTree(organizationDao.getOrganizationTree(param));
	}
	
	
	/*
	public List<OrganizationModel> getOrganizationList(OrganizationModel param) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("리스트" + param.getDept_code());
		
		return organizationDao.getOrganizationList(param);
	}*/
	
	/** 목록 조회 */
	public ArrayList<HashMap<String, Object>> getTreeList(OrganizationModel param)	  throws Exception {
				  
				  List<GroupTreeModel> list = organizationDao.getOrganizationTree(param);
				  
				  
				  ArrayList<HashMap<String, Object>> test = new
				  ArrayList<HashMap<String,Object>>();
				  
				  HashMap<String, Object> map = new HashMap<String, Object>();
				  map.put("tree_model", list);
				  
				  test.add(map);
				  
				  map = new HashMap<String, Object>();
				  
				  //map.put("tree_model", list);
				  
				  //test.add(map);
				  
				  
				  
				  HashMap<String, Object> resultMap1 = new HashMap<String, Object>();
				  
				  for(int i=0; i < list.size(); i++) {
				  
				  resultMap1.put("tree_model", list); System.out.println("리스트숫자는" +
				  list.size()); }
				  
				  
				  
				  
				  return test; }
				 

	/** 목록 조회 */
		 public HashMap<String, Object> getOrganizationList(OrganizationModel param) throws Exception {
		
		 List<OrganizationModel> list = organizationDao.getOrganizationList(param);
		 HashMap<String, Object> resultMap1 = new HashMap<String, Object>();
		 resultMap1.put("organization", list);
		 
		 return resultMap1; 
		 }

}
