package com.spring.mastercode.model;

import java.util.ArrayList;
import java.util.List;

public class GroupTreeModel {
	String id= null;
	String group_id = null;
	String up_id = null;
	int depth;
	
	String text = null;
	
	boolean leaf = false;
	String cls = null;
	// boolean checked = false;
	
	List<GroupTreeModel> tree_model = new ArrayList<GroupTreeModel>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
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

	public void setLeaf(String leaf) {
		if( leaf.equals( "1" ) ) {
			this.leaf = true;
		} else {
			this.leaf = false;
		}
	}

	public String getCls() {
		return cls;
	}

	public void setCls(String cls) {
		this.cls = cls;
	}
	/*
	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	*/
	public List<GroupTreeModel> getTree_model() {
		return tree_model;
	}

	public void setTree_model(List<GroupTreeModel> tree_model) {
		this.tree_model = tree_model;
	}
}
