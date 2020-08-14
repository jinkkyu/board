package com.spring.mastercode.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.dto.BoardDto;
import com.spring.board.dto.BoardFileDto;
import com.spring.board.dto.BoardReplyDto;
import com.spring.board.form.BoardFileForm;
import com.spring.board.form.BoardForm;
import com.spring.board.form.BoardReplyForm;
import com.spring.mastercode.dto.MasterCodeDto;
import com.spring.mastercode.form.MasterCodeForm;

@Repository
public class MasterCodeDao {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.spring.board.mastercodeMapper";

	/** 게시판 - 목록 조회 */
	public List<MasterCodeDto> getMasterList(MasterCodeForm masterForm) throws Exception {

		return sqlSession.selectList(NAMESPACE + ".getMasterList", masterForm);
	}

	/** 게시판 - 상세 조회 */
	public MasterCodeDto getMasterDetail(MasterCodeForm masterForm) throws Exception {
	 
		return sqlSession.selectOne(NAMESPACE + ".getMasterDetail", masterForm); 
	
	}
	
	/** 게시판 - 등록 */
	
	public int insertMaster(MasterCodeForm masterForm) throws Exception {
		
		return sqlSession.insert(NAMESPACE + ".insertMaster", masterForm);
	}
	
	/** 게시판 - 수정 */
	public int updateMaster(MasterCodeForm masterFrom) throws Exception{
		return sqlSession.update(NAMESPACE + ".updateMaster", masterFrom);
	}
	
	/** 게시판 - 삭제 */
	public int deleteMaster(MasterCodeForm masterForm) throws Exception{
		return sqlSession.delete(NAMESPACE + ".deleteMaster", masterForm);
	}

}