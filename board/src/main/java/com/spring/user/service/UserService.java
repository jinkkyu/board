package com.spring.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.user.dao.UserDao;
import com.spring.user.dto.UserDto;
import com.spring.user.form.UserForm;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	/** 회원가입 */
	public UserDto doSignIn(UserForm userForm) throws Exception {
		
		UserDto userDto = new UserDto();	
		
		int doSignInCnt = userDao.doSignIn(userForm);
		
		if(doSignInCnt > 0) {
			userDto.setResult("SUCCESS");
			return userDto;
		}else {
			userDto.setResult("FAIL");
			return userDto;
		}
	}
	
	/** 아이디 확인*/
	public UserDto confirmId(String userId)throws Exception{
		
		UserDto userDto = new UserDto();
		
		int confirmId = userDao.confirmId(userId); 
		
		if(confirmId == 0) {
			userDto.setResult("SUCCESS");;
			return userDto;			
		}else{
			userDto.setResult("DUPLICATE");
			return userDto;
		}	
	}
	
	/** 로그인 */
	public UserDto doLogin(UserForm userForm, HttpServletRequest request) {
		
		UserDto userDto = new UserDto();
		int checkCnt = userDao.idCheck(userForm);

		if(checkCnt != 0 ){
			userDto = userDao.doLogin(userForm);
			String loginCnt = (String)userDto.getUserPass();
//			System.out.println("데이터 베이스 값 "+loginCnt+"  유저입력값 = " + request.getParameter("userPass"));
			
			if(loginCnt.equals(request.getParameter("userPass"))) {
				userDto.setResult("SUCCESS");
				HttpSession session = request.getSession();
				session.setAttribute("userId", userDto.getUserId());
				session.setAttribute("userName", userDto.getUserName());
			}else {
				userDto.setResult("FAIL");
			}
			return userDto;			
		}else {
			userDto.setResult("FAIL");
			return userDto;
		}
	}
}