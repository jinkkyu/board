package com.spring.mastercode.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.mastercode.dto.OrganizationDto;
import com.spring.mastercode.form.OrganizationForm;
import com.spring.mastercode.model.GroupTreeModel;
import com.spring.mastercode.model.OrganizationModel;

@Repository
public class OrganizationDao {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.spring.board.organizationMapper";
	
	/*public List<OrganizationDto> getOrganizationList(OrganizationForm organizationForm) throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getOrganizationList", organizationForm);
		
	}*/
	
	public List<GroupTreeModel> getOrganizationTree( OrganizationModel param ) throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getOrganizationTree", param);
	};
	public List<OrganizationModel> getOrganizationList( OrganizationModel param ) throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getOrganizationList", param);
	};
}
