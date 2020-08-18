package com.spring.mastercode.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.mastercode.dto.TreeDto;
import com.spring.mastercode.form.TreeForm;

@Repository
public class TreeDao {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.spring.board.treeMapper";
	
	public List<TreeDto>getTreeList(TreeForm treeFrom) throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getTreeList", treeFrom);
	}
}
