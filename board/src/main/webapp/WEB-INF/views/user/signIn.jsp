<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

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
	
	function goLogin(){
		location.href="/user/login";
	}
	/** 아이디 중복확인 */
	function confirmId(){
		var userId = $("#userId").val();
		
		if(userId == ""){
			alert("아이디를 입력하세요!");
			$("#userId").focus();
			return;
		}
		/* var yn = confirm("아이디를 확인 하시겠습니까?");		
		if(yn){ */
			
			$.ajax({	
				
			    url		: "/user/confirmId",
			    data    : $("#userForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
		        async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	confirmIdCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		    });
		/* } */
	}
	/** 아이디 중복확인 콜백 함수*/
	function confirmIdCallback(obj){
		if(obj != null){		
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("아이디 사용이 가능합니다.");				
				return;		 
			}else if(result == "DUPLICATE"){
				alert("아이디가 이미 존재합니다.")
				return;
			}
		}
	}		
	
	/** 회원가입  */
	function doSignIn(){
	
		var userId = $("#userId").val();
		var userPass = $("#userPass").val();
		var userName = $("#userName").val();
		var userGender = $("#userGender").val();
		var userEmail = $("#userEmail").val();
		
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
		
		if (userName == ""){			
			alert("아름은  필수 입력 사항 입니다.");
			$("#userName").focus();
			return;
		}
		if (userEmail == ""){			
			alert("이메일은 필수 입력 사항 입니다.");
			$("#userEmail").focus();
			return;
		}
		
		var yn = confirm("회원가입 하시겠습니까?");		
		if(yn){
				
			$.ajax({	
				
			    url		: "/user/doSignIn",
			    data    : $("#userForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
		        async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	doSignInCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		    });
		}
	}
	
	/** 회원가입 콜백 함수 */
	function doSignInCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("회원가입에 성공하였습니다 .");				
				goLogin();				 
			} else if(result == "FAIL") {				
				alert("회원가입에 실패 하였습니다.");	
				return;
			}
		}
	}
	
</script>	
</head>
<body>

	<h1>회원가입 페이지</h1>
<div id="wrap">
	<div id="container">
		<div class="inner">		
			<h2>회원가입</h2>
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
							<button type="button" class="btn black" onclick="javascript:confirmId();">중복확인</button>							
							</td>
						</tr>
						<tr>
							<th>비밀번호<span class="t_red">*</span></th>
							<td><input type="password" id="userPass" name="userPass" value="" class="tbox01"/></td>
						</tr>
						<tr>
							<th>이름<span class="t_red">*</span></th>
							<td><input id="userName" name="userName" value="" class="tbox01"></td>
						</tr>
						<tr>
							<th>성별<span class="t_red">*</span></th>
							<td>
								<input type="radio" id="userGender" name="userGender" value="남자" checked>남자
								<input type="radio" id="userGender" name="userGender" value="여자">여자
							</td>							
						</tr>
						<tr>
							<th>이메일<span class="t_red">*</span></th>
							<td><input id="userEmail" name="userEmail" value="" class="tbox01"></td>
						</tr>
				    </tbody>
				</table>
			</form>
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goBoardList();">목록으로</button>
				<button type="button" class="btn black" onclick="javascript:doSignIn();">회원가입</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>