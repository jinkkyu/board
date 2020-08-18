<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko">

<!-- header -->
<%@ include file="../include/head3.jsp"%>

<body>

	<%@ include file="../include/navigation.jsp"%>

	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<br><br><br><br><br><br><br><br><br><br><br><br>

			<%@ include file="../include/sidebar.jsp"%>
			
			<%@ include file="../include/image_slide.jsp" %>
			<div class="container">
			
			<h2>조직도</h2>

	<form id="frm">
		<input type="hidden" name="parent_dept">
		<input type="hidden" name="dept_code">
		<input type="hidden" name="adesc">
		<input type="hidden" name="depth">
		<input type="hidden" name="dept_order">
		<input type="hidden" name="dept_group">
		<input type="hidden" name="use_yn">
	</form>
	<div id="cont-left">
		<div id="list01">
			<div id="organization_tree"></div>
		</div>
	</div>
	
	<div id="cont-right">
		<div id="list">
			<div id="organization_grid" style="display:block" ></div>
			<span class="myButton" id="btn_top" onclick="onDisplay('top');">최상위 추가</span>
			<span class="myButton" id="btn_add" onclick="onDisplay('add');" style="margin-top:20px;">추가</span>
			
		</div>
	</div>
	
	<div id="cont-right50">
		<div id="detail" style="display:none;">
			<table class="table" style="width:100%;">
				<tr>
					<th>상위부서코드</th>
					<td><input type="text" id="txt_parent_dept" name="txt_parent_dept" maxlength="12"></td>
				</tr>
				<tr>
					<th>상위부서코드명</th>
					<td><input type="text" id="txt_parent_desc" name="txt_parent_desc" maxlength="30"></td>
				</tr>
				<tr>
					<th>부서코드</th>
					<td><input type="text" id="txt_dept_code" name="txt_dept_code" maxlength="12"></td>
				</tr>
				<tr>
					<th>부서명</th>
					<td><input type="text" id="txt_adesc" name="txt_adesc"></td>
				</tr>
				<tr>
					<th>사용여부</th>
					<td colspan="3">
						<input type="radio" id="use_y" name="rg_use_yn" class="input-noborder" value="Y" checked="checked">사용</input>
						<input type="radio" id="use_n" name="rg_use_yn" class="input-noborder" value="N">미사용</input>
					</td>
				</tr>
			</table>
			<div id="btn">
				<span class="myButton" id="btn_insert" onclick="onInsert();">저장</span>
				<span class="myButton" id="btn_update" onclick="onUpdate();">수정</span>
				<span class="myButton" id="btn_delete" onclick="onDelete();">삭제</span>
				<span class="myButton" id="btn_init" onclick="onDisplay('list');">취소</span>
			</div>
		</div>
	</div>
	
	<div id = tree></div>
		

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

