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
import com.spring.board.form.BoardFileForm;
import com.spring.board.form.BoardForm;
import com.spring.board.form.CommonForm;
import com.spring.mastercode.dao.MasterCodeDao;
import com.spring.mastercode.dto.MasterCodeDto;
import com.spring.mastercode.form.MasterCodeForm;


@Service
public class MasterCodeService {
	
	@Autowired
	private MasterCodeDao mastercodeDao;
	

	/** 목록 조회 */
	public HashMap<String, Object> getMasterList(MasterCodeForm masterForm) throws Exception {
		System.out.println(masterForm.getMcode());
		List<MasterCodeDto> list = mastercodeDao.getMasterList(masterForm);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("commonCode", list);
		
		System.out.println(resultMap);
		
		return resultMap;
	}
	
	/** 게시판 - 상세 조회 */
	public MasterCodeDto getMasterDetail(MasterCodeForm masterForm) throws Exception {

		MasterCodeDto mastercodeDto = new MasterCodeDto();

		mastercodeDto = mastercodeDao.getMasterDetail(masterForm);


		return mastercodeDto;
	}
	
	/** 게시판 - 상세 조회 
	public HashMap<String, Object> getMasterDetail(MasterCodeForm masterForm) throws Exception {

		MasterCodeDto list = mastercodeDao.getMasterDetail(masterForm);

		HashMap<String, Object> test = new HashMap<String, Object>();
		test.put("commonCode", list);
		
		return test;
	}
	
	/** 게시판 - 등록 */
	public MasterCodeDto insertMaster(MasterCodeForm masterForm) throws Exception {

		MasterCodeDto masterDto = new MasterCodeDto();

		int insertCnt = 0;

		insertCnt = mastercodeDao.insertMaster(masterForm);


		return masterDto;
	}
	
	/** 게시판 - 수정 */
	public MasterCodeDto updateMaster(MasterCodeForm masterForm) throws Exception{
		MasterCodeDto masterDto = new MasterCodeDto();
		
		int updateCnt = 0;
		
		updateCnt = mastercodeDao.updateMaster(masterForm);
		
		return masterDto;
	}
	
	/** 게시판 - 삭제 */
	public MasterCodeDto deleteMaster(MasterCodeForm masterForm) throws Exception{
		MasterCodeDto masterDto = new MasterCodeDto();
		
		int deleteCnt = 0;
		
		deleteCnt = mastercodeDao.deleteMaster(masterForm);
		
		return masterDto;
	}
	
	
}