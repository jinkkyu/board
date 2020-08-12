package com.spring.user.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.user.dto.UserDto;
import com.spring.user.form.UserForm;

@Repository
public class UserDao {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.spring.board.userMapper";

	
	/** 아이디 중복 확인*/
	public int confirmId(String userId) {
		return sqlSession.selectOne(NAMESPACE + ".confirmId", userId);
	}
	/** 회원가입 */
	public int doSignIn(UserForm userForm) {
		return sqlSession.update(NAMESPACE + ".doSignIn", userForm);
	}
	/** 아이디 가입 확인 */
	public int idCheck(UserForm userForm) {
//		System.out.println(sqlSession.selectOne(NAMESPACE+".idCheck", userForm)); /* 아이디가 존재하면 1, 존재하지 않으면 0을 반환 */
		return sqlSession.selectOne(NAMESPACE+".idCheck", userForm);
	}
	/** 로그인 */
	public UserDto doLogin(UserForm userForm) {
		UserDto userDto = sqlSession.selectOne(NAMESPACE+".doLogin", userForm);
		userDto.setUserId(userForm.getUserId());
		return userDto;
	}
}