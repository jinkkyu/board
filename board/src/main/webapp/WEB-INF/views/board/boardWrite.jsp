<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 작성</title>

<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="/css/common/common.css"/>

<!-- 공통 JavaScript -->
<script type="text/javascript" src="/js/common/jquery.js"></script>
<script type="text/javascript" src="/js/common/jquery.form.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){		
		
	});
		
	/** 게시판 - 목록 페이지 이동 */
	function goBoardList(){				
		location.href = "/board/boardList";
	}
	
	/** 게시판 - 작성  */
	function insertBoard(){
		var boardSubject = $("#board_subject").val();
		var boardContent = $("#board_content").val();
			
		if (boardSubject == ""){			
			alert("제목을 입력해주세요.");
			$("#board_subject").focus();
			return;
		}
		
		if (boardContent == ""){			
			alert("내용을 입력해주세요.");
			$("#board_content").focus();
			return;
		}
			
		var yn = confirm("게시글을 등록하시겠습니까?");		
		if(yn){
				
			var filesChk = $("input[name='files[0]']").val();
			
			if (filesChk == "") {
				$("input[name='files[0]']").remove();
				
						var boardContent = $("#board_content").val();
				console.log(boardContent);
				$("#boardForm").ajaxForm({	
					
				    url		: "/board/insertBoard",
				    enctype : "multipart/form-data",
			        cache   : false,
			        async   : true,
					type	: "POST",	
			        success : function(obj) {
			        	insertBoardCallback(obj);				
			        },	       
			        error 	: function(xhr, status, error) {}
			        
			    }).submit();
				
			}else{
				
				var fileSize = document.getElementById("files[0]").files[0].size;
				var maxSize = 30 * 1024 * 1024;//30MB
				
				if(fileSize > maxSize){
					alert("첨부파일 사이즈는 30MB 이내로 등록 가능합니다. ");
				       return;
				}else{
				
					$("#boardForm").ajaxForm({
				    
						url		: "/board/insertBoard",
						enctype	: "multipart/form-data",
						cache   : false,
				        async   : true,
						type	: "POST",					 	
						success : function(obj) {
					    	insertBoardCallback(obj);				
					    },	       
					    error 	: function(xhr, status, error) {}
					    
				    }).submit();
				}	
			}
				 
		}
	}
	
	/** 게시판 - 작성 콜백 함수 */
	function insertBoardCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("게시글 등록을 성공하였습니다.");				
				goBoardList();				 
			} else {				
				alert("게시글 등록을 실패하였습니다.");	
				return;
			}
		}
	}
	
</script>
</head>
<body>
<div id="wrap">
	<div id="container">
		<div class="inner">		
			<h2>게시글 작성</h2>
			<form id="boardForm" name="boardForm" action="/board/insertBoard" enctype="multipart/form-data" method="post" onsubmit="return false;">
				<input type="hidden" id="ins_user_id" name="ins_user_id" value="<%= session.getAttribute("userId") %>" class="tbox01"/>
				<table width="100%" class="table02">
				<caption><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></caption>
				    <colgroup>
				        <col width="20%">
				        <col width="*">
				    </colgroup>
				    <tbody id="tbody">
						<tr>
							<th>제목<span class="t_red">*</span></th>
							<td><input id="board_subject" name="board_subject" value="" class="tbox01"/></td>
						</tr>

						<tr>
							<th>작성자<span class="t_red">*</span></th>
							<td><input id="board_writer" name="board_writer" value="<%= session.getAttribute("userName") %>" class="tbox01"/></td>
						</tr>
						<tr>
							<th>내용<span class="t_red">*</span></th>
							<td><textarea id="board_content" name="board_content" cols="10" rows="5" class="textarea01"></textarea></td>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td><input type="file" id="files[0]" name="files[0]" value=""></td>
						</tr>
				    </tbody>
				</table>
			</form>
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goBoardList();">목록으로</button>
				<button type="button" class="btn black" onclick="javascript:insertBoard();">등록하기</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>