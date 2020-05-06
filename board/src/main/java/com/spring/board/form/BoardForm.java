package com.spring.board.form;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardForm extends CommonForm {

	List<MultipartFile> files;
	int board_seq;
	int board_parent_seq;
	int board_re_ref;
	int board_re_lev;
	int board_re_seq;
	String board_writer;
	String board_subject;
	String board_content;
	int board_hits;
	int board_num;
	private String searchType;
	private String keyword;
	String file_yn;
	String del_yn;
	String ins_user_id;
	Date ins_date;
	String upd_user_id;
	Date upd_date;
	String search_type;
	String board_file;
	String delete_file;
	int reply_count;
	int file_count;
	
	
	
	
	public int getFile_count() {
		return file_count;
	}
	public void setFile_count(int file_count) {
		this.file_count = file_count;
	}
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	private MultipartFile Filedata;
	private String callback;
	private String callback_func;
	
	
	public MultipartFile getFiledata() {
		return Filedata;
	}
	public void setFiledata(MultipartFile filedata) {
		Filedata = filedata;
	}
	public String getCallback() {
		return callback;
	}
	public void setCallback(String callback) {
		this.callback = callback;
	}
	public String getCallback_func() {
		return callback_func;
	}
	public void setCallback_func(String callback_func) {
		this.callback_func = callback_func;
	}
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	
	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public int getBoard_parent_seq() {
		return board_parent_seq;
	}

	public void setBoard_parent_seq(int board_parent_seq) {
		this.board_parent_seq = board_parent_seq;
	}

	public int getBoard_re_ref() {
		return board_re_ref;
	}

	public void setBoard_re_ref(int board_re_ref) {
		this.board_re_ref = board_re_ref;
	}

	public int getBoard_re_lev() {
		return board_re_lev;
	}

	public void setBoard_re_lev(int board_re_lev) {
		this.board_re_lev = board_re_lev;
	}

	public int getBoard_re_seq() {
		return board_re_seq;
	}

	public void setBoard_re_seq(int board_re_seq) {
		this.board_re_seq = board_re_seq;
	}

	public String getBoard_writer() {
		return board_writer;
	}

	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}

	public String getBoard_subject() {
		return board_subject;
	}

	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_hits() {
		return board_hits;
	}

	public void setBoard_hits(int board_hits) {
		this.board_hits = board_hits;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getIns_user_id() {
		return ins_user_id;
	}

	public void setIns_user_id(String ins_user_id) {
		this.ins_user_id = ins_user_id;
	}

	public Date getIns_date() {
		return ins_date;
	}

	public void setIns_date(Date ins_date) {
		this.ins_date = ins_date;
	}

	public String getUpd_user_id() {
		return upd_user_id;
	}

	public void setUpd_user_id(String upd_user_id) {
		this.upd_user_id = upd_user_id;
	}

	public Date getUpd_date() {
		return upd_date;
	}

	public void setUpd_date(Date upd_date) {
		this.upd_date = upd_date;
	}


	public String getBoard_file() {
		return board_file;
	}

	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}

	public String getDelete_file() {
		return delete_file;
	}

	public void setDelete_file(String delete_file) {
		this.delete_file = delete_file;
	}
	
	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	
	public String getFile_yn() {
		return file_yn;
	}

	public void setFile_yn(String file_yn) {
		this.file_yn = file_yn;
	}
	
	public String getSearch_type() {
		return search_type;
	}

	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}

}
