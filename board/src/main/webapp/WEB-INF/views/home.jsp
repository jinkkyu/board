<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">

<!-- header -->
<%@ include file="include/head.jsp"%>


<script type="text/javascript">
	function goLogin(){				
		location.href = "/user/login";
	}
	
	function goSignIn(){
		location.href = "/user/signIn";
	}
</script>

<body>

	<%@ include file="include/navigation.jsp"%>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			
			<%@ include file="include/sidebar.jsp"%>
			<%@ include file="include/image_slide.jsp"%>
			
			
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goLogin();">로그인</button>
				<button type="button" class="btn black" onclick="javascript:goSignIn();">회원가입</button>
			</div>
			
			<div style="float:left;">
			<img class="d-block img-fluid" src=/resources/images/image_6.PNG alt="Second slide" style="float:left;">
			<iframe width="560" height="315" src="https://www.youtube.com/embed/-wHBZRXyG0I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			 <img src="/resources/images/image_7.png" style="float:left;">
			 </div>
			
			<img src="/resources/images/news.PNG" />
			 <img src="/resources/images/check.PNG" />
			
			

		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.row -->

	</div>

	
	<%@ include file="include/footer.jsp"%>

	<%@ include file="include/plugin_js.jsp"%>

</body>

</html>

