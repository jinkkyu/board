package com.spring.mastercode.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
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
import com.spring.board.dto.BoardDto;
import com.spring.board.dto.BoardReplyDto;
import com.spring.board.form.BoardForm;
import com.spring.board.form.BoardReplyForm;
import com.spring.mastercode.dto.MasterCodeDto;
import com.spring.mastercode.form.MasterCodeForm;
import com.spring.mastercode.service.MasterCodeService;
import com.spring.mastercode.service.MasterCodeService1;

@Controller
@RequestMapping(value = "/test")
public class MasterCodeController {

	private static final Logger logger = LoggerFactory.getLogger(MasterCodeController.class);

	
	 @Autowired
	 private MasterCodeService masterService;
	 
	
	 @RequestMapping(value = "/organization")
		public String organization(HttpServletRequest request, HttpServletResponse response) throws Exception {

			return "test/organization";
		}
	 
	@RequestMapping(value = "/testList")
	public String testList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "test/testList";
	}
	
	
	//리스트 불러오기
	@RequestMapping(value = "/getMasterList")
	@ResponseBody
	public HashMap<String, Object> getMasterList(HttpServletRequest request, HttpServletResponse response, MasterCodeForm masterForm) throws Exception {
		
		HashMap<String, Object> resultMap = masterService.getMasterList(masterForm);
		
		return resultMap;
	}
	
	// 게시판 - 상세 조회 
	@RequestMapping(value = "/getMasterDetail")
	@ResponseBody
	public MasterCodeDto getMasterDetail(HttpServletRequest request, HttpServletResponse response, MasterCodeForm masterForm) throws Exception {

		MasterCodeDto masterDto = masterService.getMasterDetail(masterForm);
	
		masterForm.setMcode(request.getParameter("mcode"));
		System.out.println( "마스터코드 : " + masterDto.getMcode());
		System.out.println( "코드명 : " + masterDto.getMdesc());
		System.out.println( "비고 : " + masterDto.getRemarks());
		System.out.println( "사용여부 : " + masterDto.getUse_yn());

		return masterDto;
	}
	
	/* 게시판 - 상세 조회 
		@RequestMapping(value = "/getMasterDetail")
		@ResponseBody
		public HashMap<String, Object> getMasterDetail(HttpServletRequest request, HttpServletResponse response, MasterCodeForm masterForm) throws Exception {

			HashMap<String, Object> test = masterService.getMasterDetail(masterForm);
			
			masterForm.setMcode(request.getParameter("mcode"));
			masterForm.setMdesc(request.getParameter("mdsec"));
			masterForm.setRemarks(request.getParameter("remarks"));
			masterForm.setUse_yn(request.getParameter("use_yn"));


			return test;
		}*/
	

	/** 게시판 - 등록 */
	@RequestMapping(value = "/insertMaster")
	@ResponseBody
	public MasterCodeDto insertMaster(HttpServletRequest request, HttpServletResponse response, MasterCodeForm masterForm) throws Exception {

		MasterCodeDto masterDto = masterService.insertMaster(masterForm);

		return masterDto;
	} 

	/** 게시판 - 삭제 */
	@RequestMapping(value = "/deleteMaster")
	@ResponseBody
	public MasterCodeDto deleteMaster(HttpServletRequest request, HttpServletResponse response, MasterCodeForm masterForm) throws Exception {

		MasterCodeDto masterDto = masterService.deleteMaster(masterForm);

		return masterDto;
	}
	

	/** 게시판 - 수정 */
	@RequestMapping(value = "/updateMaster")
	@ResponseBody
	public MasterCodeDto updateMaster(HttpServletRequest request, HttpServletResponse response, MasterCodeForm masterForm) throws Exception {

		MasterCodeDto masterDto = masterService.updateMaster(masterForm);
		
		return masterDto;
	}
	
	
	
}
