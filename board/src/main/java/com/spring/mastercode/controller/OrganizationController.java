package com.spring.mastercode.controller;

import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.spring.mastercode.form.MasterCodeForm;
import com.spring.mastercode.form.OrganizationForm;
import com.spring.mastercode.form.TreeForm;
import com.spring.mastercode.model.GroupTreeModel;
import com.spring.mastercode.model.OrganizationModel;
import com.spring.mastercode.service.MasterCodeService;
import com.spring.mastercode.service.OrganizationService;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@Controller
@RequestMapping(value="/test")
public class OrganizationController {
	
	private static final Logger logger = LoggerFactory.getLogger(MasterCodeController.class);

	
	 
	 @Autowired
	 private OrganizationService organizationService;
	 
	
	 @RequestMapping(value = "/organization")
		public String organization(HttpServletRequest request, HttpServletResponse response) throws Exception {

			return "test/organization";
	 }
	 
	 @RequestMapping(value = "/getTreeList",method=RequestMethod.GET)
		@ResponseBody
		public Model getOrganizationTree(HttpServletRequest request, Model model)throws Exception{
			OrganizationModel param = new OrganizationModel();
			
			model.addAttribute("tree_model", organizationService.getOrganizationTree(param));
			System.out.println(model);
			return model;
	 }
	 
	/*리스트 불러오기*/
	 @RequestMapping(value = "/getTreeList")
		@ResponseBody
		public ArrayList<HashMap<String, Object>> getTreeList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		 OrganizationModel param = new OrganizationModel();
			ArrayList<HashMap<String, Object>> resultMap = organizationService.getTreeList(param);
			
			return resultMap;
		}
	 
	 @RequestMapping(value = "/getOrganizationList")
	  
	  @ResponseBody public HashMap<String, Object> getOrganizationList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		 OrganizationModel param = new OrganizationModel();
	  HashMap<String, Object> resultMap = organizationService.getOrganizationList(param);
	  
	  return resultMap; 
	  }
	 

	

	 @RequestMapping(value = "/TreeList.do" , method = RequestMethod.GET)
		@ResponseBody
		public void TreeList(HttpServletResponse response, HttpServletRequest request) {
		 	String click_node = request.getParameter("node");

			
			System.out.print(click_node + "123");
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			String list_sql = "";

		
		try{
			JSONObject jsonObject = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			JSONObject subObject =  null;
			
			//String click_node = request.getParameter("node");
			//System.out.print(click_node);

			
			/**
			*	JDBC 정보 설정 (MySQL)
			*/
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=Asia/Seoul&useSSL=false";
			String id = "root";
			String pwd = "1234";                             
			
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection(url,id,pwd);
			stmt = (Statement) conn.createStatement();
			
			/**
			*	추가
			*/

			   list_sql = " SELECT a.parent_dept, a.adesc, a.dept_code, (SELECT COUNT(*) "; 
			   list_sql += "					    FROM board.organization  b "; 
			   list_sql += "					   WHERE b.parent_dept  = a.dept_code) count "; 
			   list_sql += "  FROM board.organization  a ";
			   list_sql += " WHERE a.parent_dept  = '" + click_node + "';";
		
			   rs = stmt.executeQuery(list_sql);
			

			  
				
				while(rs.next()){
					subObject = new JSONObject();
					subObject.put("id", rs.getString("dept_code"));
					subObject.put("text", rs.getString("adesc"));
					subObject.put("group_id", rs.getString("parent_dept"));	
					subObject.put("count", rs.getInt("count"));	
					//child node presence
					if(rs.getInt("count") > 0) {
						subObject.put("expanded", false);
					//child node does not presence
					} else {
						subObject.put("leaf", true);
					}
					jsonArray.add(subObject);
				}
				
				jsonObject.put("success", true);
				jsonObject.put("tree_model", jsonArray);
				
				response.setContentType("application/json; charset=UTF-8");
				PrintWriter pw = response.getWriter();

				pw.print(jsonObject);
				pw.flush();
				pw.close();
				
				
				
			}catch(Exception e){
				e.printStackTrace();
			}
		
		}
		@RequestMapping(value = "/list.do" , method = RequestMethod.GET)
		@ResponseBody
		public void list(HttpServletResponse response, HttpServletRequest request) {
			
			String parent_dept = request.getParameter("parent_dept");
			
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			String list_sql= "";
			
			if (parent_dept == null) {
				parent_dept = "";
			}
			
		
		try{
			JSONObject jsonObject = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			JSONObject subObject =  null;

			/**
			*	JDBC 정보 설정 (MySQL)
			*/
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=Asia/Seoul&useSSL=false";
			String id = "root";
			String pwd = "1234";                             
			
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection(url,id,pwd);
			stmt = (Statement) conn.createStatement();
			
			/**
			*	추가
			*/
			
			if (parent_dept.equals("R000000001")) {
				list_sql = " SELECT parent_dept, dept_code , adesc, use_yn from board.organization;";
			}
			else if (parent_dept.equals("")) {
				list_sql = " SELECT parent_dept, dept_code , adesc, use_yn from board.organization;";
			}
			else {
			list_sql = " SELECT parent_dept, dept_code , adesc, use_yn from board.organization"; 
			   list_sql += " WHERE parent_dept  = '" + parent_dept + "';";
			}

			   rs = stmt.executeQuery(list_sql);
				
				while(rs.next()){
					subObject = new JSONObject();
					subObject.put("dept_code", rs.getString("dept_code"));
					subObject.put("adesc", rs.getString("adesc"));
					subObject.put("parent_dept", rs.getString("parent_dept"));	
					subObject.put("use_yn", rs.getString("use_yn"));	
					
					jsonArray.add(subObject);
				}
				
				jsonObject.put("success", true);
				jsonObject.put("organization", jsonArray);
				
				response.setContentType("application/json; charset=UTF-8");
				PrintWriter pw = response.getWriter();

				pw.print(jsonObject);
				pw.flush();
				pw.close();
				
				
				
			}catch(Exception e){
				e.printStackTrace();
			}
		
		}
		
		
		@RequestMapping(value = "/OrganizationUpdate.do" , method = RequestMethod.POST)
		public void OrganizationUpdate(HttpServletResponse response, HttpServletRequest request) {
		Connection conn = null;
		Statement stmt = null;
		//ResultSet rs = null;
		try{
			JSONObject jsonObject = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			JSONObject subObject =  null;
			
			String parent_dept = request.getParameter("parent_dept");
			String dept_code = request.getParameter("dept_code");
			String adesc = request.getParameter("adesc");
			String use_yn = request.getParameter("use_yn");
			
			/**
			*	JDBC 정보 설정 (MySQL)
			*/
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=Asia/Seoul&useSSL=false";
			String id = "root";
			String pwd = "1234";                             
			
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection(url,id,pwd);
			stmt = (Statement) conn.createStatement();
			
			/**
			*	추가
			*/
			String list_sql = "UPDATE board.organization SET parent_dept = '" +  parent_dept + "', adesc = '" + adesc + "', USE_YN = '" + use_yn +
					"' WHERE dept_code = '" + dept_code + "';";
			System.out.print(list_sql);
			int rs = stmt.executeUpdate(list_sql);
			System.out.print(rs);
			response.setContentType("application/json; charset=UTF-8");
			PrintWriter pw = response.getWriter();

			pw.print(rs);
			pw.flush();
			pw.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		@RequestMapping(value = "/DetailInfo.do" , method = RequestMethod.POST)
		@ResponseBody
		public void DetailInfo(HttpServletResponse response, HttpServletRequest request) {
			
			String dept_code = request.getParameter("dept_code");
			String parent_dept = request.getParameter("parent_dept");
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			String list_sql= "";
			
		
		try{
			JSONObject jsonObject = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			JSONObject subObject =  null;

			/**
			*	JDBC 정보 설정 (MySQL)
			*/
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=Asia/Seoul&useSSL=false";
			String id = "root";
			String pwd = "1234";                             
			
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection(url,id,pwd);
			stmt = (Statement) conn.createStatement();
			
			/**
			*	추가
			*/


			list_sql = " SELECT parent_dept, parent_desc, dept_code , adesc, use_yn from board.organization"; 
			list_sql += " WHERE dept_code  = '" + dept_code + "';";

			   rs = stmt.executeQuery(list_sql);
				
				while(rs.next()){
					subObject = new JSONObject();
					subObject.put("parent_dept", rs.getString("parent_dept"));
					subObject.put("parent_desc", rs.getString("parent_desc"));
					subObject.put("dept_code", rs.getString("dept_code"));	
					subObject.put("adesc", rs.getString("adesc"));	
					subObject.put("use_yn", rs.getString("use_yn"));
					
					jsonArray.add(subObject);
				}
				
				jsonObject.put("success", true);
				jsonObject.put("organization", jsonArray);
				
				response.setContentType("application/json; charset=UTF-8");
				PrintWriter pw = response.getWriter();

				pw.print(jsonObject);
				pw.flush();
				pw.close();
				
				
				
			}catch(Exception e){
				e.printStackTrace();
			}
		
		}
		@RequestMapping(value = "/OrganizationInsert.do" , method = RequestMethod.POST)
		public void OrganizationInsert(HttpServletResponse response, HttpServletRequest request) {
		Connection conn = null;
		Statement stmt = null;
		//ResultSet rs = null;
		try{
			JSONObject jsonObject = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			JSONObject subObject =  null;
			
			String parent_dept = request.getParameter("parent_dept");
			String dept_code = request.getParameter("dept_code");
			String adesc = request.getParameter("adesc");
			String use_yn = request.getParameter("use_yn");
			
			/**
			*	JDBC 정보 설정 (MySQL)
			*/
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=Asia/Seoul&useSSL=false";
			String id = "root";
			String pwd = "1234";                             
			
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection(url,id,pwd);
			stmt = (Statement) conn.createStatement();
			
			/**
			*	추가
			*/
			String list_sql = "INSERT INTO board.organization (parent_dept, dept_code, adesc, use_yn) VALUE ('";
					list_sql += parent_dept + "', '" +   dept_code  + "', '" + adesc  + "', '" +  use_yn + "');";
					
			System.out.print (list_sql);

			int rs = stmt.executeUpdate(list_sql);
			
			response.setContentType("application/json; charset=UTF-8");
			PrintWriter pw = response.getWriter();

			pw.print(rs);
			pw.flush();
			pw.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		@RequestMapping(value = "/OrganizationDelete.do" , method = RequestMethod.POST)
		public void OrganizationDelete(HttpServletResponse response, HttpServletRequest request) {
		Connection conn = null;
		Statement stmt = null;
		//ResultSet rs = null;
		try{
			JSONObject jsonObject = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			JSONObject subObject =  null;
			
			String dept_code = request.getParameter("dept_code");
			/**
			*	JDBC 정보 설정 (MySQL)
			*/
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=Asia/Seoul&useSSL=false";
			String id = "root";
			String pwd = "1234";                             
			
			Class.forName("com.mysql.jdbc.Driver");
			conn=(Connection) DriverManager.getConnection(url,id,pwd);
			stmt = (Statement) conn.createStatement();
			
			/**
			*	추가
			*/
			String list_sql = "DELETE FROM board.organization WHERE dept_code = '" + dept_code + "';"; 
			System.out.print(list_sql);
			int rs = stmt.executeUpdate(list_sql);
			
			response.setContentType("application/json; charset=UTF-8");
			PrintWriter pw = response.getWriter();

			pw.print(rs);
			pw.flush();
			pw.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		
		
	
	
	



}

	 	
		
