package com.spring.mastercode.dto;

public class TreeDto {
	String id;
	String group_id;
	String up_id;
	String depth;
	String text;
	boolean checked = false;
	boolean leaf = false;
	int sub_cnt = 0;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public boolean isLeaf() {
		return leaf;
	}
	public void setLeaf(int sub_cnt) {
		if(sub_cnt>0) {
			this.leaf = false;
		}else {
			this.leaf = false;
		}
	}
	public void setSub_cnt(int sub_cnt) {
		this.sub_cnt = sub_cnt;
		setLeaf(sub_cnt);
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getUp_id() {
		return up_id;
	}
	public void setUp_id(String up_id) {
		this.up_id = up_id;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getSub_cnt() {
		// TODO Auto-generated method stub
		return sub_cnt;
	}
	
}
