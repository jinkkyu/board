package com.spring.mastercode.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.common.ResultUtil;
import com.spring.board.form.BoardForm;
import com.spring.mastercode.form.MasterCodeForm;
import com.spring.mastercode.service.MasterCodeService;
import com.spring.mastercode.service.MasterCodeService1;

@Controller
@RequestMapping(value = "/test")
public class MasterCodeController {

	private static final Logger logger = LoggerFactory.getLogger(MasterCodeController.class);

	
	 @Autowired
	 private MasterCodeService masterService;
	 

	@RequestMapping(value = "/testList")
	public String testList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "test/testList";
	}

	/*@RequestMapping(value = "/getMasterList")
	@ResponseBody
	public ResultUtil getMasterList(HttpServletRequest request, HttpServletResponse response, MasterCodeForm masterForm) throws Exception {

		ResultUtil resultUtils = masterService.getMasterList(masterForm);
		
		return resultUtils;
	}*/
	
	@RequestMapping(value = "get/MasterList", method = RequestMethod.POST, produces="text/plan;charset=UTF-8")
	@ResponseBody
	public String testList(HttpServletResponse response, @RequestParam("snum") String city) throws Exception{
		
		
		
		return city;
		
		
	}
	/*
	 * @RequestMapping(value = "/testList", method = RequestMethod.GET) public void
	 * getList(Model model) throws Exception {
	 * 
	 * List list = null; list = mastercodeservice.list();
	 * model.addAttribute("list",list); }
	 */
}
