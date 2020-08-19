package com.spring.mastercode.model;

import java.util.ArrayList;
import java.util.List;

public class TreeModel {
	String id= null;
	String text = null;
	boolean leaf = true;
	String cls = null;
	boolean checked = false;
	String up_id = null;
	int sub_cnt = 0;
	
	List<TreeModel> message = new ArrayList<TreeModel>();
	public String getId() {
		return id;
	}
	public void setId(String id) {
		
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		
		this.text = text;
	}
	public boolean isLeaf() {
		return leaf;
	}
	public void setLeaf(int sub_cnt) {
		if(sub_cnt>0){
			this.leaf = false;
		}else{
			this.leaf = true;
		}
		
	}
	public String getCls() {
		return cls;
	}
	public void setCls(String cls) {
		
		this.cls = cls;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		
		this.checked = checked;
	}
	public String getUp_id() {
		return up_id;
	}
	public void setUp_id(String up_id) {
		
		this.up_id = up_id;
	}
	public int getSub_cnt() {
		return sub_cnt;
	}
	public void setSub_cnt(int sub_cnt) {
		
		this.sub_cnt = sub_cnt;
		setLeaf( sub_cnt );
	}
	public List<TreeModel> getMessage() {
		return message;
	}
	public void setMessage(List<TreeModel> message) {
		this.message = message;
	}
	
	
}
