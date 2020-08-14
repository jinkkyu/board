<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>

<%
	//String boardSeq = request.getParameter("boardSeq");
String currentPageNo = request.getParameter("currentPageNo");
String searchType = request.getParameter("searchType");
String keyword = request.getParameter("keyword");
%>

<c:set var="currentPageNo" value="<%=currentPageNo%>" />
<c:set var="searchType" value="<%=searchType%>" />
<c:set var="keyword" value="<%=keyword%>" />


<!-- 공통 CSS -->
<!-- <link rel="stylesheet" type="text/css" href="/css/common/common.css" /> -->
<%@ include file="../include/head.jsp"%>
<!-- 공통 JavaScript -->
<!-- <script type="text/javascript" src="/js/common/jquery.js"></script> -->
<script type="text/javascript">
	$(document).ready(function() {
		
		if (<%=currentPageNo%> == null){
			getBoardList();
		}else{
			getBoardList(<%=currentPageNo%>);
		}
		
	});


	/** 게시판 - 상세 페이지 이동 */
	function goBoardDetail(boardSeq, currentPageNo) {
		location.href = "/board/boardDetail?boardSeq=" + boardSeq
				+ "&currentPageNo=" + currentPageNo;
	}

	/** 게시판 - 작성 페이지 이동 */
	function goBoardWrite(currentPageNo) {
		
		<%if (session.getAttribute("userId") == null) {%>
			alert("로그인 후 이용가능합니다.");
			<%} else {%>
				location.href = "/board/boardWrite?currentPageNo=" + currentPageNo;
				<%}%>
		
	}
	
	function searchBoard(currentPageNo){
			
			/* if($('#searchType').val() == 'null' || $('#searchType').val() == ''){
				//alert('검색유형을 선택해주세요.');
			}
			if($('#keyword').val() == 'null' || $('#keyword').val() == ''){
				//alert('검색어를 입력해주세요.');
			} */
			//else{
				location.href = "/board/boardList?currentPageNo=" + currentPageNo + "&searchType=" + $('#searchType').val() + "&keyword="+ $('#keyword').val() ;		
			//}
			
			
		}

	/** 게시판 - 목록 조회  */

	function getBoardList(currentPageNo) {

		if (currentPageNo === undefined) {
			currentPageNo = "1";
		}
		//currentpageno = 현재화면에 출력되고있는 페이지번호
		$("#current_page_no").val(currentPageNo);
		$.ajax({

			url : "/board/getBoardList",
			data : $("#boardForm").serialize(),
			dataType : "JSON",
			cache : false,
			async : true,
			type : "POST",
			success : function(obj) {
				alert(obj);
				getBoardListCallback(obj);
			},
			error : function(xhr, status, error) {
			}

		});
	}

	/** 게시판 - 목록 조회  콜백 함수 */
	function getBoardListCallback(obj) {

		var state = obj.state;

		if (state == "SUCCESS") {

			var data = obj.data;
			var list = data.list;
			var listLen = list.length;
			var totalCount = data.totalCount;
			var pagination = data.pagination;

			var str = "";

			if (listLen > 0) {

				for (var a = 0; a < listLen; a++) {

					var boardSeq = list[a].board_seq;
					var boardReRef = list[a].board_re_ref;
					var boardReLev = list[a].board_re_lev;
					var boardReSeq = list[a].board_re_seq;
					var boardWriter = list[a].board_writer;
					var boardSubject = list[a].board_subject;
					var boardContent = list[a].board_content;
					var boardHits = list[a].board_hits;
					var delYn = list[a].del_yn;
					var insUserId = list[a].ins_user_id;
					var insDate = list[a].ins_date;
					var updUserId = list[a].upd_user_id;
					var updDate = list[a].upd_date;
					var fileYn = list[a].file_yn;
					var test = $("#current_page_no").val();
					var replyCnt = list[a].reply_count;
					var fileCnt = list[a].file_count;
					
					str += "<tr>";
					str += "<td>" + boardSeq + "</td>";

					str += "<td onclick='javascript:goBoardDetail(" + boardSeq
							+ "," + test +  ");' style='cursor:Pointer'>";

					if (boardReLev > 0) {
						for (var b = 0; b < boardReLev; b++) {

							str += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
						}
						str += "<img src='/resources/images/reicon.png' alt='reicon'/>&nbsp;&nbsp;";
						//str += "Re: ";
					}

					if (fileCnt >= 1) {
						//str += boardSubject +"</td>";
						if (replyCnt == 0){
							str += boardSubject + "&nbsp;&nbsp;<img class='img' src='/resources/images/disk.png' alt='disk'>"
							+ "</td>";
						}else{
							str += boardSubject + " (" +"<span class='t_red' style='color:red'>" +replyCnt + "</span>"+") "+"&nbsp;&nbsp;<img class='img' src='/resources/images/disk.png' alt='disk'>"
							+ "</td>";
						}
						//str += boardSubject
								//+ "&nbsp;&nbsp;<img class='img' src='/resources/images/disk.png' alt='disk'>"
								//+ "</td>";
					} else {
						if (replyCnt == 0){
							str += boardSubject + "</td>";
						}else{
							str += boardSubject + " (" +"<span class='t_red' style='color:red'>" +replyCnt + "</span>"+") "+ "</td>";
						}
						
				
					}

					str += "<td>" + boardHits + "</td>";
					str += "<td>" + boardWriter + "</td>";
					str += "<td>" + insDate + "</td>";
					str += "</tr>";

				}

			} else {

				str += "<tr>";
				str += "<td colspan='5'>등록된 글이 존재하지 않습니다.</td>";
				str += "<tr>";
			}
			
			var selectbox = "";
			
			
			
			if ($('#searchType').val() == "subject"){
				//selectbox += "<option value=''>-----</option>"
				//selectbox += "<option value='subject' selected>제목</option>"
				//selectbox += "<option value='content'>본문</option>"
				//selectbox += "<option value='writer'>작성자</option>"
			}
			else if ($('#searchType').val() == "content"){
				//selectbox += "<option value=''>-----</option>"
				//selectbox += "<option value='subject' >제목</option>"
				//selectbox += "<option value='content' selected>본문</option>"
				//selectbox += "<option value='writer'>작성자</option>"
			}
			else if ($('#searchType').val() == "writer"){
				//selectbox += "<option value=''>-----</option>"
				//selectbox += "<option value='subject' >제목</option>"
				//selectbox += "<option value='content'>본문</option>"
				//selectbox += "<option value='writer' selected>작성자</option>"
			}
			else{
				//selectbox += "<option value='' selected>-----</option>"
				//selectbox += "<option value='subject' >제목</option>"
				//selectbox += "<option value='content'>본문</option>"
				//selectbox += "<option value='writer'>작성자</option>"
			}
			
			$("#tbody").html(str);
			$("#total_count").text(totalCount);
			$("#pagination").html(pagination);
			$("#boardnav").html(boardnav);
			$("#selectbox").html(selectbox);
			

		} else {
			alert("관리자에게 문의하세요.");
			return;
		}
	}
	function logout(){
		location.href = "/user/logout/";
	}
	function goLogin(){				
		location.href = "/user/login";
	}
	function goSignIn(){
		location.href = "/user/signIn";
	}
</script>
</head>
<body>

	<%@ include file="../include/navigation.jsp"%>
	<div class="container">
    <div class="row">

			<%@ include file="../include/sidebar.jsp"%>
			
			<%@ include file="../include/image_slide.jsp" %>
			<div class="container">
			<div id="wrap">
		<div id="container">
			<div class="inner">
				<h2>게시글 목록</h2>
				<%
					if (session.getAttribute("userId") != null) {
				%>
				<span><%=session.getAttribute("userName")%>님 반갑습니다.</span><br>
				<span><%=session.getAttribute("userId")%> 아이디로 로그인 되었습니다.</span>
				<button type="button" class="btn btn-success"
					onclick="javascript:logout();">로그아웃</button>
				<%
					}
				%>
				<%
					if (session.getAttribute("userId") == null) {
				%>
				<button type="button" class="btn btn-success"
					onclick="javascript:goLogin();">로그인</button>
				<button type="button" class="btn btn-success"
					onclick="javascript:goSignIn();">회원가입</button>
				<%
					}
				%>
				<form id="boardForm" name="boardForm">
					<input type="hidden" id="function_name" name="function_name"
						value="getBoardList" /> <input type="hidden" id="current_page_no"
						name="current_page_no" value="1" /> <input type="hidden"
						name="searchType" id="searchType" value="${searchType}"> <input
						type="hidden" name="keyword" id="keyword" value="${keyword}">

					<div class="page_info">
						<span class="total_count" style="float:right"><strong>전체</strong> : <span
							id="total_count" class="t_red" style="color:red">0</span>개</span>
					</div>

					<table width="100%" class="table table-bordered">
						<colgroup>
							<col width="10%" />
							<col width="25%" />
							<col width="10%" />
							<col width="15%" />
							<col width="20%" />
						</colgroup>
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>조회수</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody id="tbody">

						</tbody>
					</table>
				</form>
				<form class="form-inline">
				<div class="form-group" style="float:right">

				<select class="form-control" id= "selectbox" onchange="document.getElementById('searchType').value = this.options[this.selectedIndex].value">
						<!-- <option value=''>-----</option> -->
						<option value='' >선택</option>
						<option value='subject'>제목</option>
						<option value='content'>내용</option>
						<option value='writer'>작성자</option>
						<option value='Id'>작성자ID</option>
						
					</select> 
					<input type="text"	onchange="document.getElementById('keyword').value = this.value" class="form-control" value="${keyword}">

					<button type="button" class="btn btn-success" name="btnSearch"
						id="btnSearch" onclick="javascript:searchBoard(${currentPageNo});">검색</button> 
						&nbsp;
					<button type="button" class="btn btn-success"
						onclick="javascript:goBoardWrite(${currentPageNo});">작성하기</button>

				
				</div>
				</form>
			</div>
			

			<div id="pagination"></div>

		</div>
	</div>
			
			</div>

		
	
	</div>
	</div>
	</div>


	
	
	<%@ include file="../include/footer.jsp"%>

	<%@ include file="../include/plugin_js.jsp"%>
	
	
	

	
</body>
</html>