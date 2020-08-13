package com.spring.mastercode.dao;

import java.util.List;

import com.spring.mastercode.domain.MasterCodeVO;


public interface MasterCodeDao1 {
	// 게시물 목록
		public List<MasterCodeVO> list() throws Exception;
		
		// 게시물 작성
		public void write(MasterCodeVO vo) throws Exception;
		
		// 게시물 조회
		public MasterCodeVO view(int mcode_seq) throws Exception;
		
		// 게시물 수정
		public void modify(MasterCodeVO vo) throws Exception;
		
		// 게시물 삭제
		public void delete(int mcode_seq) throws Exception;
}
