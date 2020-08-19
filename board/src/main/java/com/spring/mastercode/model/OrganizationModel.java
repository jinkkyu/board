package com.spring.mastercode.model;

public class OrganizationModel {
	
	private String parent_dept;
	private String parent_desc;
	private String dept_code;
	private String adesc;
	private String depth;
	private String dept_group;
	private String dept_order;
	private String use_yn;
	private String modified_id;
	private String modified_date;
	
	public String getParent_dept() {
		return parent_dept;
	}
	public void setParent_dept(String parent_dept) {
		
		this.parent_dept = parent_dept;
	}
	
	public String getParent_desc() {
		return parent_desc;
	}
	public void setParent_desc(String parent_desc) {
		this.parent_desc = parent_desc;
	}
	public String getDept_code() {
		return dept_code;
	}
	public void setDept_code(String dept_code) {
		
		this.dept_code = dept_code;
	}
	public String getAdesc() {
		return adesc;
	}
	public void setAdesc(String adesc) {
		
		this.adesc = adesc;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		
		this.depth = depth;
	}
	public String getDept_group() {
		return dept_group;
	}
	public void setDept_group(String dept_group) {
		this.dept_group = dept_group;
	}
	
	public String getDept_order() {
		return dept_order;
	}
	public void setDept_order(String dept_order) {
		this.dept_order = dept_order;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		
		this.use_yn = use_yn;
	}
	public String getModified_id() {
		return modified_id;
	}
	public void setModified_id(String modified_id) {
		
		this.modified_id = modified_id;
	}
	public String getModified_date() {
		return modified_date;
	}
	public void setModified_date(String modified_date) {
		
		this.modified_date = modified_date;
	}
	
	
	
}
