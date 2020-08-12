<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>

<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="/css/common/common.css"/>

<!-- 공통 JavaScript -->
<script type="text/javascript" src="/js/common/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){		
		
	});
	
	/** 게시판 - 목록 페이지 이동 */
	function goBoardList(){				
		location.href = "/board/boardList";
	}
		
	
	/** 로그인  */
	function doLogIn(){
	
		var userId = $("#userId").val();
		var userPass = $("#userPass").val();
	
		
		if (userId == ""){			
			alert("아이디는 필수 입력 사항 입니다..");
			$("#userId").focus();
			return;
		}
		
		if (userPass == ""){			
			alert("비밀번호는 필수 입력 사항 입니다.");
			$("#userPass").focus();
			return;
		}
	
			$.ajax({	
				
			    url		: "/user/doLogin",
			    data    : $("#userForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
		        async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	doLoginCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		    });
	}
	
	/** 로그인 콜백 함수 */
	function doLoginCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			var userName = obj.userName;
			var userId = obj.userId;
			var userPass = obj.userPass;
			
			if(result == "SUCCESS"){
				alert("안녕하세요 "+userName+"님 로그인 성공하였습니다 .");				
				goBoardList();				 
			} else if(result == "FAIL") {				
				alert("로그인에 실패 하였습니다.");	
				return;
			}
		}
	}
	
</script>	
</head>
<body>
	<h1>로그인 페이지</h1>
<div id="wrap">
	<div id="container">
		<div class="inner">		
			<h2>로그인</h2>
			<form id="userForm" name="userForm">
				<table width="100%" class="table02">
				<caption><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></caption>
				    <colgroup>
				        <col width="20%">
				        <col width="*">
				    </colgroup>
				    <tbody id="tbody">
						<tr>
							<th>아이디<span class="t_red">*</span></th>
							<td><input id="userId" name="userId" value="" class="tbox01"/>
							</td>
						</tr>
						<tr>
							<th>비밀번호<span class="t_red">*</span></th>
							<td><input type="password" id="userPass" name="userPass" value="" class="tbox01"/></td>
						</tr>
				    </tbody>
				</table>
			</form>
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goBoardList();">목록으로</button>
				<button type="button" class="btn black" onclick="javascript:doLogIn();">로그인</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>