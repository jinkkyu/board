package com.spring.mastercode.dto;

public class MasterCodeDto {
	int mcode_seq;
	String mcode;
	String mdesc;
	String remarks;
	String use_yn;
	String modify_id;
	String modify_date;
	String search_field;
	String search_words;
	public String getSearch_field() {
		return search_field;
	}
	public void setSearch_field(String search_field) {
		this.search_field = search_field;
	}
	public String getSearch_words() {
		return search_words;
	}
	public void setSearch_words(String search_words) {
		this.search_words = search_words;
	}
	public int getMcode_seq() {
		return mcode_seq;
	}
	public void setMcode_seq(int mcode_seq) {
		this.mcode_seq = mcode_seq;
	}
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	public String getMdesc() {
		return mdesc;
	}
	public void setMdesc(String mdesc) {
		this.mdesc = mdesc;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getModify_id() {
		return modify_id;
	}
	public void setModify_id(String modify_id) {
		this.modify_id = modify_id;
	}
	public String getModify_date() {
		return modify_date;
	}
	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	} 
}
