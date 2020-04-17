<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">

<!-- header -->
<%@ include file="include/head.jsp"%>

<body>

	<%@ include file="include/navigation.jsp"%>

	<!-- Page Content -->
	<div class="container center">

		<div class="row">

			<%@ include file="include/sidebar.jsp"%>

			<%@ include file="include/image_slide.jsp"%>


			<div id="content" class="content">
				<div>


					<!-- s: content -->

					<h4 class="s_title_1">국민 행동수칙 준수</h4>
					<div class="box_image">
						<img src="/resources/images/baroview_poster.png" alt="국민 행동수칙 포스터">
						<a href="/resources/images/baroview_poster.png"
							title="국민 행동수칙 포스터 새창열기" target="_blank"><em class="hdn">원본이미지보기</em></a>
					</div>

					<h4 class="s_title_1">국민안심병원 이용</h4>
					<p class="s_descript">일반 환자의 의료이용을 보장하고 감염 위험을 막기 위해 비호흡기 질환자와
						호흡기 질환자를 분리하여 진료하는 ‘국민안심병원’ 을 운영 중입니다.</p>
					<p class="s_descript">안심병원은 일반환자와 호흡기환자 외래 구역을 구분하여 운영하는 유형(유형
						A)과 호흡기 외래와 더불어 검채채취 가능한 선별진료소, 호흡기환자 전용 입원실까지 함께 운영하는 유형(유형 B)이
						있습니다.</p>
					<p class="s_descript">안심병원 외에도, 일반 환자는 의료기관에 방문하지 않아도 전화 상담 ·
						처방 및 대리 처방을 받을 수 있어 병원 내 감염을 예방할 수 있습니다.</p>
					<p class="s_descript">고혈압, 심장질환 등 비호흡기 환자분들은 국민안심병원 일반외래를
						이용하시고, 단순 경미한 호흡기 증상을 가진 환자분들은 가까운 의원이나 국민안심병원 호흡기 외래를 이용하시기 바랍니다.
					</p>
					<p class="s_descript">코로나19 증상이 의심되는 의사환자나 조사대상유증상자는 먼저 관할 보건소
						또는 1339 콜센터 등에서 상담을 받으신 후 선별진료소를 방문할 것을 권장합니다.</p>

					<h5 class="s_title_in3">국민안심병원 이용 누가? 언제? 어떻게?</h5>
					<div class="go_vod">
						<iframe width="560" height="315"
							src="https://www.youtube.com/embed/n9oKaI-ChX8" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>

					<h4 class="s_title_1">어린이 노약자 등 집단시설 이용</h4>
					<p class="s_descript">어린이집은 기존 3월 22일에서 2주 연장하여 4월 5일까지 휴원하며, 유
						· 초 · 중 · 고의 개학은 당초 3월 2일에서 4월 6일로 연기하였습니다.</p>
					<p class="s_descript">요양시설 등 종사자는 발열, 기침 등 호흡기 증상이 있거나 환자발생국가
						해외여행력이 있으면 14일 간 업무에서 배제하고 있으며, 시설 내 외부인 출입도 제한하고 있습니다.</p>
					<p class="s_descript">사회복지 이용시설이 휴관하더라도 일상생활 유지에 필수적인 아동 도시락
						지원, 장애인 활동지원 등의 서비스는 지속 제공합니다.</p>

					<!-- e: content -->


				</div>
			</div>
		</div>
	</div>
	</div>

	<!-- /.container -->





	<%@ include file="include/footer.jsp"%>

	<%@ include file="include/plugin_js.jsp"%>

</body>

</html>

