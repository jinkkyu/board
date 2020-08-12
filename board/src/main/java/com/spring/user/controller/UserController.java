package com.spring.user.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.user.dto.UserDto;
import com.spring.user.form.UserForm;
import com.spring.user.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private UserService userService;
	
	/** 로그인 페이지로 이동*/
	@RequestMapping(value ="/login")
	public String doLogin(HttpServletRequest request, HttpServletResponse reponse, UserForm userForm) throws Exception {
		
		return "user/login";
	}
	
	/** 로그인 */
	@RequestMapping(value = "/doLogin")
	@ResponseBody
	public UserDto Login(HttpServletRequest request, HttpServletResponse reponse, UserForm userForm) throws Exception {

		UserDto userDto = userService.doLogin(userForm, request);
		
		return userDto;
	}
	
	/** 회원가입 페이지로 이동 */
	@RequestMapping(value="/signIn")
	public String signIn(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		
		return "user/signIn";
	}
	
	/** 회원가입 */
	@RequestMapping(value="doSignIn")
	@ResponseBody
	public UserDto doSignIn(HttpServletRequest request, HttpServletResponse reponse, UserForm userForm) throws Exception {
		
		UserDto userDto = userService.doSignIn(userForm);
		
		return userDto;
	}
	
	/** 아이디 중복 확인 */
	@RequestMapping(value="/confirmId")
	@ResponseBody
	public UserDto confirmId(HttpServletRequest request, HttpServletResponse reponse, UserForm userForm) throws Exception{
		
		String userId = (String)request.getParameter("userId");
		UserDto userDto = userService.confirmId(userId);
		
		return userDto;
	}
	
	/** 로그아웃 */
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "board/boardList";
	}
}