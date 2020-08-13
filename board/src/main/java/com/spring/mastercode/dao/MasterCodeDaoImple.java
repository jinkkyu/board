package com.spring.mastercode.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.mastercode.domain.MasterCodeVO;

@Repository
public class MasterCodeDaoImple implements MasterCodeDao1 {
	
	@Inject
	private SqlSession sql;

	private static String namespace = "com.spring.board.mastercodeMapper";
	
	@Override
	public List<MasterCodeVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}

	@Override
	public void write(MasterCodeVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public MasterCodeVO view(int mcode_seq) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(MasterCodeVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int mcode_seq) throws Exception {
		// TODO Auto-generated method stub

	}

}
