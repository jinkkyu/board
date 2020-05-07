<%@page import="org.springframework.web.bind.annotation.SessionAttribute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 상세</title>
<%
	String boardSeq = request.getParameter("boardSeq");
	String currentPageNo = request.getParameter("currentPageNo");
	//String userIdtest = (String)session.getAttribute("userName");
	String insUserId = request.getParameter("insUserId");
	String userId = (String)session.getAttribute("userId");
	//SessionAttribute("ID",userId);
	
%>

<c:set var="boardSeq" value="<%=boardSeq%>" />
<!-- 게시글 번호 -->
<c:set var="currentPageNo" value="<%=currentPageNo%>" />

<c:set var="userId" value="<%=userId%>" />
<c:set var="insUserId" value="<%=insUserId%>" />

<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="/css/common/common.css" />

<!-- 공통 JavaScript -->
<script type="text/javascript" src="/js/common/jquery.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){		
		getBoardDetail();	
		getBoardReply();

	});
	
	/** 게시판 - 목록 페이지 이동 */
	function goBoardList(currentPageNo){				
		location.href = "/board/boardList?currentPageNo=" + currentPageNo;
	}
	
	/** 게시판 - 수정 페이지 이동 */
	function goBoardUpdate(currentPageNo){
		
		var boardSeq = $("#board_seq").val();
		
		location.href = "/board/boardUpdate?boardSeq="+ boardSeq + "&currentPageNo=" + currentPageNo;
	}
	
	/** 게시판 - 답글 페이지 이동 */
	function goBoardReply(currentPageNo){
			
			var boardSeq = $("#board_seq").val();
			
			location.href = "/board/boardReply?boardSeq="+ boardSeq + "&currentPageNo=" + currentPageNo;
		}


	
	/** 게시판 - 첨부파일 다운로드 */
	function fileDownload(fileNameKey, fileName, filePath){
			
		location.href = "/board/fileDownload?fileNameKey="+fileNameKey+"&fileName="+fileName+"&filePath="+filePath;
	}
	
	/** 게시판 - 상세 조회  */
	function getBoardDetail(boardSeq){
		
		var boardSeq = $("#board_seq").val();

		if(boardSeq != ""){
			
			$.ajax({	
				
			    url		: "/board/getBoardDetail",
			    data    : $("#boardForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	getBoardDetailCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
		} else {
			alert("오류가 발생했습니다.\n관리자에게 문의하세요.");
		}			
	}
	
	/** 게시판 - 상세 조회  콜백 함수 */
	function getBoardDetailCallback(obj){
		
		var str = "";
		var userId = "<%= session.getAttribute("userId")%>";
		if(obj != null){								
							
			var boardSeq		= obj.board_seq; 
			var boardReRef 		= obj.board_re_ref; 
			var boardReLev 		= obj.board_re_lev; 
			var boardReSeq 		= obj.board_re_seq; 
			var boardWriter 	= obj.board_writer; 
			var boardSubject 	= obj.board_subject; 
			var boardContent 	= obj.board_content; 
			var boardHits 		= obj.board_hits;
			var delYn 			= obj.del_yn; 
			var insUserId 		= obj.ins_user_id;
			var insDate 		= obj.ins_date; 
			var updUserId 		= obj.upd_user_id;
			var updDate 		= obj.upd_date;
			var files			= obj.files;		
			var filesLen		= files.length;
			var idid			= insUserId;
			//document.getElementById('test').innerHTML=idid;
				
			
			 
			str += "<tr>";
			str += "<th>글번호</th>";
			str += "<td>"+ boardSeq +"</td>";
			str += "<th>조회수</th>";
			str += "<td>"+ boardHits +"</td>";
			str += "</tr>";	
			
			
			str += "<tr>";
			str += "<th>제목</th>";
			str += "<td>"+ boardSubject +"</td>";
			str += "<th>작성자 ID</th>";
			str += "<td>"+ insUserId +"</td>";
			str += "</tr>";		
			str += "<tr>";
			str += "<th>작성자</th>";
			str += "<td>"+ boardWriter +"</td>";
			str += "<th>작성일시</th>";
			str += "<td>"+ insDate +"</td>";
			str += "</tr>";	
						
				
			str += "<tr>";
			str += "<th>내용</th>";
			str += "<td colspan='3'>"+ boardContent +"</td>";
			str += "</tr>";
			str += ""
			
				if(userId == insUserId){
					//alert("작성자와 동일");
					if(filesLen > 0){
						
						for(var a=0; a<filesLen; a++){
							
							var boardSeq	= files[a].board_seq;
							var fileNo 		= files[a].file_no;
							var fileNameKey = files[a].file_name_key;
							var fileName 	= files[a].file_name;
							var filePath 	= files[a].file_path;
							var fileSize 	= files[a].file_size;
							var remark 		= files[a].remark;
							var delYn 		= files[a].del_yn;
							var insUserId 	= files[a].ins_user_id;
							var insDate 	= files[a].ins_date;
							var updUserId 	= files[a].upd_user_id;
							var updDate 	= files[a].upd_date;
							
							
							
							
							str += "<th>첨부파일</th>";
							//str += "<td onclick='javascript:fileDownload(\"" + fileNameKey + "\", \"" + fileName + "\", \"" + filePath + "\");' style='cursor:Pointer'>"+ fileName +"</td>";
							str += "<td colspan='3'><a href='/board/fileDownload?fileNameKey="+encodeURI(fileNameKey)+"&fileName="+encodeURI(fileName)+"&filePath="+encodeURI(filePath)+"'>" + fileName + "</a></td>";
							str += "</tr>";
							
						}	
					}		
					//str += "<tr>";
					//str += "<th>테스트</th>";
					str += "<td colspan='5'><button type='button' class='btn black mr5' onclick='javascript:goBoardList(${currentPageNo});'>목록으로</button><button type='button' class='btn black mr5' onclick='javascript:goBoardReply(${currentPageNo});'>답글쓰기</button><button type='button' class='btn black mr5' onclick='javascript:deleteBoard();'>삭제하기</button><button type='button' class='btn black mr5' onclick='javascript:goBoardUpdate(${currentPageNo});'>수정하기</button></td>";
					//str += "</tr>";
					
						
						
						
						
				}else{
					if(filesLen > 0){
						
						for(var a=0; a<filesLen; a++){
							
							var boardSeq	= files[a].board_seq;
							var fileNo 		= files[a].file_no;
							var fileNameKey = files[a].file_name_key;
							var fileName 	= files[a].file_name;
							var filePath 	= files[a].file_path;
							var fileSize 	= files[a].file_size;
							var remark 		= files[a].remark;
							var delYn 		= files[a].del_yn;
							var insUserId 	= files[a].ins_user_id;
							var insDate 	= files[a].ins_date;
							var updUserId 	= files[a].upd_user_id;
							var updDate 	= files[a].upd_date;
							
							
							
							
							str += "<th>첨부파일</th>";
							//str += "<td onclick='javascript:fileDownload(\"" + fileNameKey + "\", \"" + fileName + "\", \"" + filePath + "\");' style='cursor:Pointer'>"+ fileName +"</td>";
							str += "<td colspan='3'><a href='/board/fileDownload?fileNameKey="+encodeURI(fileNameKey)+"&fileName="+encodeURI(fileName)+"&filePath="+encodeURI(filePath)+"'>" + fileName + "</a></td>";
							str += "</tr>";
							
						}	
					}		
					//str += "<tr>";
					//str += "<th>테스트</th>";
					str += "<td colspan='5'><button type='button' class='btn black mr5' onclick='javascript:goBoardList(${currentPageNo});'>목록으로</button><button type='button' class='btn black mr5' onclick='javascript:goBoardReply(${currentPageNo});'>답글쓰기</button></td>";
					//str += "</tr>";
				}
			 
			
			/* if(filesLen > 0){
			
				for(var a=0; a<filesLen; a++){
					
					var boardSeq	= files[a].board_seq;
					var fileNo 		= files[a].file_no;
					var fileNameKey = files[a].file_name_key;
					var fileName 	= files[a].file_name;
					var filePath 	= files[a].file_path;
					var fileSize 	= files[a].file_size;
					var remark 		= files[a].remark;
					var delYn 		= files[a].del_yn;
					var insUserId 	= files[a].ins_user_id;
					var insDate 	= files[a].ins_date;
					var updUserId 	= files[a].upd_user_id;
					var updDate 	= files[a].upd_date;
					
					
					
					
					str += "<th>첨부파일</th>";
					//str += "<td onclick='javascript:fileDownload(\"" + fileNameKey + "\", \"" + fileName + "\", \"" + filePath + "\");' style='cursor:Pointer'>"+ fileName +"</td>";
					str += "<td colspan='3'><a href='/board/fileDownload?fileNameKey="+encodeURI(fileNameKey)+"&fileName="+encodeURI(fileName)+"&filePath="+encodeURI(filePath)+"'>" + fileName + "</a></td>";
					str += "</tr>";
					
				}	
			}		 */
			
			
			//str += "<a>gdgdgddg</a>";
			
		} else {
			
			alert("등록된 글이 존재하지 않습니다.");
			return;
		}		
		
		$("#tbody").html(str);
		$("#btn").html(st);
	}
	
	/** 게시판 - 삭제  */
	function deleteBoard(){

		var boardSeq = $("#board_seq").val();
		
		var yn = confirm("게시글을 삭제하시겠습니까?");		
		if(yn){
			
			$.ajax({	
				
			    url		: "/board/deleteBoard",
			    data    : $("#boardForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	deleteBoardCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
		}		
	}
	
	/** 게시판 - 삭제 콜백 함수 */
	function deleteBoardCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("게시글 삭제를 성공하였습니다.");				
				//goBoardList();
				document.location.replace("boardList");
			} else {				
				alert("게시글 삭제를 실패하였습니다.");	
				return;
			}
		}
	}
	
	
	//////////////////////////////////////////////////////////////
	
	function getBoardReply(currentPageNo,boardSeq){
		var boardSeq = $("#board_seq").val();		
		if(currentPageNo === undefined){
			currentPageNo = "1";
		}
		
		$("#current_page_no").val(currentPageNo);

		$.ajax({	
				
			    url		: "/board/getBoardReply",
			    data    : $("#boardReplyForm2").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	getBoardReplyCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
	}
	
	function getBoardReplyCallback(obj){

		var state = obj.state;
		
		if(state == "SUCCESS"){
			
			var data = obj.data;			
			var list = data.list;
			var listLen = list.length;		
			var totalCount = data.totalCount;
			var pagination = data.pagination;
			document.getElementById('totalCount').innerHTML=totalCount
			var userId = "<%= session.getAttribute("userId")%>";

			var str = "";
			
			if(listLen >  0){
				for(var a=0; a<listLen; a++){		
					var replyWriter		= list[a].reply_writer;
					var replyContent	= list[a].reply_content; 
					var insDate			= list[a].ins_date;
					var replyNo			= list[a].reply_no;
					var replyId 		= list[a].reply_id;
					
					var subDate = insDate.split(':');

			str += "<div class='OneReply'>";
			str += "<table boder='1'>"
			if (userId == replyId){
				str += "<tr><td>"  +"작성자ID : " + replyId + "&nbsp&nbsp | &nbsp&nbsp작성자 : " + replyWriter + "&nbsp&nbsp<span class='date'>&nbsp&nbsp | &nbsp&nbsp&nbsp&nbsp" + subDate[0] + ":" + subDate[1] + "</span> &nbsp&nbsp&nbsp&nbsp <button type='button' class='white'	onclick='javascript:deleteReply(" + replyNo + ");'>삭제</button></td></tr>";
			}else{
				str += "<tr><td>"  +"작성자ID : " + replyId + "&nbsp&nbsp | &nbsp&nbsp작성자 : " + replyWriter + "&nbsp&nbsp<span class='date'>&nbsp&nbsp | &nbsp&nbsp&nbsp&nbsp" + subDate[0] + ":" + subDate[1] + "</span> &nbsp&nbsp&nbsp&nbsp </tr>";
			}
			
			str += "<tr><td>" + "내용 : " + replyContent + "</td></tr>";
			str += "<div class='delbutton'>";			
		//	str += "<button type='button' class='white'	onclick='javascript:showRereply(" + replyNo + ");'>답글</button>";
		//	str += "<span>\|</span>";
			
			//str += "<tr><td><button type='button' class='white'	onclick='javascript:deleteReply(" + replyNo + ");'>삭제</button>";
			//str += "<button type='button' class='white'>수정</button></tr></td>";
			str += "</br>"
			str	+= "<hr>"
			str += "</table>"
			
			str += "</div>";
			str += "</div>";
			

				}
			
				} else {
				

				str += "<span>등록된 댓글이 없습니다.</span>";

				
		} 	
			$("#tbody_reply").html(str);
			$("#pagination").html(pagination);
			
	}
		else {
			alert("관리자에게 문의하세요.");
			return;
		}	
	}
	
	function insertRereply(){
		/*
		var replyWriter = $("#reply_writer").val();
		var replyCotent = $("#reply_content").val();
		
		if (replyWriter == ""){			
			alert("작성자를 입력해주세요.");
			$("#reply_subject").focus();
			return;
		}
		
		if (replyCotent == ""){			
			alert("내용을 입력해주세요.");
			$("#reply_content").focus();
			return;
		}
		*/
		var yn = confirm("댓글을 등록하시겠습니까?");		
		if(yn){
			$.ajax({
				url : "/board/insertRereply",
				data : $("#boardReplyForm").serialize(),
				dataType : "JSON",
				cache : false,
				async : true,
				type : "POST",
				success : function(obj) {
					insertRereplyCallback(obj);
				},
				error : function(xhr, status, error) {
				}
			});
		}
	}
	function insertRereplyCallback(){

		if(obj != null){		
			
			var result = obj.result;
			
			var currentPageNo = $("current_page_no").val();
		
			if(result == "SUCCESS"){				
				alert("게시글 등록을 성공하였습니다.");				
				history.go(0);
				
			} else {				
				alert("게시글 등록을 실패하였습니다.");	
				return;
			}
		}
	}
	

	function deleteReply(replyNo){
		
		$("#reply_no").val(replyNo);
		console.log
		
		var yn = confirm("댓글을 삭제하시겠습니까?");
		if (yn) {

			$.ajax({

				url : "/board/deleteReply",
				data : $("#boardReplyForm3").serialize(),
				dataType : "JSON",
				cache : false,
				async : true,
				type : "POST",
				success : function(obj) {
					deleteReplyCallback(obj);
				},
				error : function(xhr, status, error) {
				}

			});
		}
	}
	
	
	function deleteReplyCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){		
				history.go(0);				
			} else {				
				alert("게시글 삭제를 실패하였습니다.");	
				return;
			}
		}
	}
	
function insertReply(){
		
		var replyWriter = $("#reply_subject").val();
		var replyCotent = $("#reply_content").val();
		
		if (replyWriter == ""){			
			alert("작성자를 입력해주세요.");
			$("#reply_subject").focus();
			return;
		}
		
		if (replyCotent == ""){			
			alert("내용을 입력해주세요.");
			$("#reply_content").focus();
			return;
		}
		
		var yn = confirm("댓글을 등록하시겠습니까?");		
		if(yn){
			$.ajax({
				url : "/board/insertReply",
				data : $("#boardReplyForm").serialize(),
				dataType : "JSON",
				cache : false,
				async : true,
				type : "POST",
				success : function(obj) {
					insertReplyCallback(obj);
				},
				error : function(xhr, status, error) {
				}
			});
		}
	}
	function insertReplyCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			var currentPageNo = $("current_page_no").val();
		
			if(result == "SUCCESS"){				
				//alert("게시글 등록을 성공하였습니다.");				
				history.go(0);
				
			} else {				
				alert("댓글 등록을 실패하였습니다.");	
				return;
			}
		}
	}
	function showReply(){
	    var con = document.getElementById("reply");
	    if(con.style.display=='none'){
	        con.style.display = 'block';
	        $("#replyhide").html("보기>");
	    }else{
	        con.style.display = 'none';
	        $("#replyhide").html("접기>");
	    }
	}
	function showRereply(replyNo){
	    var con = document.getElementById(replyNo);
	    if(con.style.display=='none'){
	        con.style.display = 'block';	       
	    }else{
	        con.style.display = 'none';	        
	    }
	}
	
</script>
</head>
<body>
	<div id="wrap">
		<div id="container">
			<div class="inner">
				<h2>게시글 상세</h2>

				<form id="boardForm" name="boardForm">
					<table width="100%" class="table01">
						<colgroup>
							<col width="15%">
							<col width="35%">
							<col width="15%">
							<col width="*">
						</colgroup>
						<tbody id="tbody">

						</tbody>
					</table>
					<input type="hidden" id="board_seq" name="board_seq"
						value="${boardSeq}" /> <input type="hidden" id="board_seq"
						name="board_seq" value="${boardSeq}" /> <input type="hidden"
						id="insUserId" name="insUserId" value="${insUserId}" />

					<!-- 게시글 번호 -->
					<input type="hidden" id="search_type" name="search_type" value="S" />
					<!-- 조회 타입 - 상세(S)/수정(U) -->
					
					<!-- <p type="hidden" id="test" name="test">작성자 아이디</p> -->
					<div id="btn" class="btn_right mt15">

					<%-- <button type='button' class='btn black mr5' onclick='javascript:goBoardList(${currentPageNo});'>목록으로</button>;
					<button type='button' class='btn black mr5' onclick='javascript:goBoardReply(${currentPageNo});'>답글쓰기  </button>;
					<button type='button' class='btn black' onclick='javascript:deleteBoard();'>삭제하기</button>";
					<button type='button' class='btn black' onclick='javascript:goBoardUpdate(${currentPageNo});'> 수정하기  </button>; --%>
						
					</div>
				</form>

				<%
					if (session.getAttribute("userId") != null) {
				%>
				<form id="boardReplyForm" name="boardReplyForm">
				
					<table width="100%" class="table01">
						<h3>댓글 (<span class="t_red" id="totalCount">*</span>) </h3>
						
						<colgroup>
							<col width="15%">
							<col width="*">
						</colgroup>
						<!-- <input type="hidden" id="function_name" name="function_name" value="getBoardList" />
						<input type="hidden" id="current_page_no" name="current_page_no" value="1" /> -->
						<input id="reply_id" name="reply_id" value="<%=session.getAttribute("userId")%>" type="hidden" />
						<input id="reply_writer" name="reply_writer" value="<%=session.getAttribute("userName")%>" type="hidden" />
					<%-- 	<tr>
							<th>작성자<span class="t_red">*</span></th>
							<td class='leftsub'><input id="reply_writer"
								name="reply_writer"
								value="<%=session.getAttribute("userName")%>" class="tbox01" /></td>
						</tr> --%>
						<tr>
							<th>내용<span class="t_red">*</span></th>
							<td class='leftsub'><textarea id="reply_content"
									name="reply_content" value="" class="tbox01" rows="5" cols="80"></textarea></td>
						</tr>
					</table>
					<div class="btn_right">
						<button type="button" class="btn black "
							onclick="javascript:insertReply(${boardSeq},${currentPageNo});">댓글달기</button>
					</div>
					<!-- <div class="showreply">
						<h3>
							댓글<a href="#" onClick="javascript:showReply();" class="reply"
								id="replyhide">보기></a>
						</h3>
					</div> -->
					<div id="reply" name="reply" style="display: block">
						<div id="tbody_reply"></div>
					</div>

					<input type="hidden" id="board_seq" name="board_seq"
						value="${boardSeq}" />
				</form>
				<form id="boardReplyForm2" name="boardReplyForm2">
				<input type="hidden" id="function_name" name="function_name" value="getBoardReply" />
					<input type="hidden" id="board_seq" name="board_seq"
						value="${boardSeq}" /> <input type="hidden" id="current_page_no"
						name="current_page_no" value="1" />
				</form>

				<form id="boardReplyForm3" name="boardReplyForm3">
					<input type="hidden" id="board_seq" name="board_seq"
						value="${boardSeq}" /> <input type="hidden" id="reply_no"
						name="reply_no" value="" />
				</form>
				<div id="pagination"></div>
				<%
					}
				if (session.getAttribute("userId") == null) {
				%>
				<h3>
							댓글작성은 로그인후 사용 가능합니다.
				</h3>
				<form id="boardReplyForm" name="boardReplyForm">
					<!-- <table width="100%" class="table01"> -->
					
						<h3>댓글 (<span class="t_red" id="totalCount">*</span>) </h3>
						
					<div id="reply" name="reply" style="display: block">
						<div id="tbody_reply"></div>
					</div>

					<input type="hidden" id="board_seq" name="board_seq"
						value="${boardSeq}" />
				</form>
				<form id="boardReplyForm2" name="boardReplyForm2">
				<input type="hidden" id="function_name" name="function_name" value="getBoardReply" />
					<input type="hidden" id="board_seq" name="board_seq"
						value="${boardSeq}" /> <input type="hidden" id="current_page_no"
						name="current_page_no" value="1" />
				</form>

				<form id="boardReplyForm3" name="boardReplyForm3">
					<input type="hidden" id="board_seq" name="board_seq"
						value="${boardSeq}" /> <input type="hidden" id="reply_no"
						name="reply_no" value="" />
				</form>
				<div id="pagination"></div>
				<%
					}
				%>

			</div>
		</div>
	</div>
</body>
</html>