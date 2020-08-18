package com.spring.mastercode.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mastercode.dao.OrganizationDao;
import com.spring.mastercode.dao.TreeDao;
import com.spring.mastercode.dto.OrganizationDto;
import com.spring.mastercode.dto.TreeDto;
import com.spring.mastercode.form.OrganizationForm;
import com.spring.mastercode.form.TreeForm;

@Service
public class OrganizationService {
	@Autowired
	private OrganizationDao organizationDao;

	
	/** 목록 조회 */
	public HashMap<String, Object> getOrganizationList(OrganizationForm organizationForm) throws Exception {
		
		List<OrganizationDto> list = organizationDao.getOrganizationList(organizationForm);
		
		
		
		HashMap<String, Object> resultMap1 = new HashMap<String, Object>();
		

		resultMap1.put("organization", list);

		
		
		return resultMap1;
	}
}
