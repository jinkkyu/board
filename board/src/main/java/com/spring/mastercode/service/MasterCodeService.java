package com.spring.mastercode.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.common.PagingUtil;
import com.spring.board.common.ResultUtil;
import com.spring.board.dto.BoardDto;
import com.spring.board.dto.CommonDto;
import com.spring.board.form.BoardForm;
import com.spring.board.form.CommonForm;
import com.spring.mastercode.dao.MasterCodeDao;
import com.spring.mastercode.dto.MasterCodeDto;
import com.spring.mastercode.form.MasterCodeForm;


@Service
public class MasterCodeService {
	
	@Autowired
	private MasterCodeDao mastercodeDao;
	
	/** 게시판 - 목록 조회 */
	public ResultUtil getMasterList(MasterCodeForm masterForm) throws Exception {
		
		ResultUtil resultUtil = new ResultUtil();

		List<MasterCodeDto> list = mastercodeDao.getMasterList(masterForm);

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		
		
		System.out.println(resultMap);
		resultUtil.setData(resultMap);
		resultUtil.setState("SUCCESS");

		return resultUtil;
	}
	
	
}