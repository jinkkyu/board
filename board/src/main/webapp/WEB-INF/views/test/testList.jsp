<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko">

<!-- header -->
<%@ include file="../include/head2.jsp"%>

<body>

	<%@ include file="../include/navigation.jsp"%>

	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<br><br><br><br><br><br><br><br><br><br><br><br>

			<%@ include file="../include/sidebar.jsp"%>
			
			<%@ include file="../include/image_slide.jsp" %>
			<div class="container">
			
			<h2>공통 마스터 코드</h2>
	
	<form id="frm_code">
		<input type="hidden" name="mcode">
		<input type="hidden" name="mdesc">
		<input type="hidden" name="remarks">
		<input type="hidden" name="use_yn">
		<input type="hidden" name="search_field" value=""${search_field}">
		<input type="hidden" name="search_words" value="${search_words}">
	</form>
	
	<div class="search">
		<select name="search_field" id="search_field">
			<option value="1">주코드</option>
			<option value="2">주코드명</option>
		</select>
		<input type="text" id="search_words"/>&nbsp;
		<span class="myButton" onclick="onCodeSearch();">검색</span>
	</div>
	
	<div id="cont-left50">
		<div id="common_grid"></div>
	</div>
	
	<div id="cont-right50">
		<table class="table">
			<tr>
				<th>마스터 코드</th>
				<td>
					<input type="text" id="txt_code_id" name="txt_code_id">
				</td>
			</tr>
			<tr>
				<th>코드명</th>
				<td>
					<input type="text" id="txt_code_name" name="txt_code_name">
				</td>
			</tr>
			<tr>
				<th>비고</th>
				<td>
					<input type="text" id="txt_code_remarks" name="txt_code_remarks">
				</td>
			</tr>
			<tr>
				<th>사용여부</th>
				<td>
					<input type="radio" id="use_y" name="rg_use_yn" class="input_noborder" value="Y" checked="checked">사용</input>
					<input type="radio" id="use_n" name="rg_use_yn" class="input_noborder" value="N">사용안함</input>
				</td>
			</tr>
		</table>
		
		<div id="btn">
			<span class="btn btn-success" id="btn_insert" onclick="onInsert();">저장</span>
			<span class="btn btn-success" id="btn_update" onclick="onUpdate();" style="display:none;">수정</span>
			<span class="btn btn-success" id="btn_delete" onclick="onDelete();" style="display:none">삭제</span>
			<span class="btn btn-success" id="btn_init" onclick="onInit();">초기화</span>
		</div>
	</div>

			</div>
			
			
	</div>
	</div>
	
	</div>

	<!-- /.container -->
	




	<%@ include file="../include/footer.jsp"%>

	<%@ include file="../include/plugin_js.jsp"%>

</body>

</html>

