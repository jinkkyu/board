package com.spring.mastercode.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.mastercode.form.MasterCodeForm;
import com.spring.mastercode.form.OrganizationForm;
import com.spring.mastercode.form.TreeForm;
import com.spring.mastercode.service.MasterCodeService;
import com.spring.mastercode.service.OrganizationService;
import com.spring.mastercode.service.TreeService;

@Controller
@RequestMapping(value="/test")
public class OrganizationController {
	
	private static final Logger logger = LoggerFactory.getLogger(MasterCodeController.class);

	
	 @Autowired
	 private TreeService treeService;
	 
	 @Autowired
	 private OrganizationService organizationService;
	 
	
	 @RequestMapping(value = "/organization")
		public String organization(HttpServletRequest request, HttpServletResponse response) throws Exception {

			return "test/organization";
	 }
	 
	//리스트 불러오기
		@RequestMapping(value = "/getTreeList")
		@ResponseBody
		public ArrayList<HashMap<String, Object>> getTreeList(HttpServletRequest request, HttpServletResponse response, TreeForm treeForm) throws Exception {
			
			ArrayList<HashMap<String, Object>> resultMap = treeService.getTreeList(treeForm);
			
			return resultMap;
		}
		
		
		
		  @RequestMapping(value = "/getOrganizationList")
		  
		  @ResponseBody public HashMap<String, Object>
		  getOrganizationList(HttpServletRequest request, HttpServletResponse response,
		  OrganizationForm organizationForm) throws Exception {
		  
		  HashMap<String, Object> resultMap = organizationService.getOrganizationList(organizationForm);
		  
		  return resultMap; }
		 
		
		

}
