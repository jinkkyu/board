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

	/*
		*//** 게시판 - 상세 조회 */
	/*
	 * public BoardDto getBoardDetail(BoardForm boardForm) throws Exception {
	 * 
	 * return sqlSession.selectOne(NAMESPACE + ".getBoardDetail", boardForm); }
	 * 
	 * 
	 *//** 게시판 - 등록 */
	/*
	 * public int insertBoard(BoardForm boardForm) throws Exception { return
	 * sqlSession.insert(NAMESPACE + ".insertBoard", boardForm); }
	 * 
	 *//** 게시판 - 등록 실패(트랜잭션 테스트) */
	/*
	 * public int insertBoardFail(BoardForm boardForm) throws Exception { return
	 * sqlSession.insert(NAMESPACE + ".insertBoardFail", boardForm); }
	 * 
	 *//** 게시판 - 삭제 */
	/*
	 * public int deleteBoard(BoardForm boardForm) throws Exception {
	 * 
	 * return sqlSession.delete(NAMESPACE + ".deleteBoard", boardForm); }
	 * 
	 * 
	 *//** 게시판 - 수정 *//*
						 * public int updateBoard(BoardForm boardForm) throws Exception {
						 * 
						 * return sqlSession.update(NAMESPACE + ".updateBoard", boardForm); }
						 */

}