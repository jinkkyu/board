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
	<div class="container">

		<div class="row">

			<%@ include file="include/sidebar.jsp"%>
			
			<%@ include file="include/image_slide.jsp" %>
			<div class="container">

			<table class="table">
			<caption>
				<span class="hdn">코로나바이러스감염증-19 기본정보표 - 정의, 질병분류, 병원체, 전파경로,
					잠복기, 진단기준, 증상, 치료, 치명률, 관리, 예방 으로 구성</span>
			</caption>
			<colgroup>
				<col style="width: 25%;">
				<col style="width: 75%;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">정의</th>
					<td class="ta_l">SARS-CoV-2 감염에 의한 호흡기 증후군</td>
				</tr>
				<tr>
					<th scope="row">질병 분류</th>
					<td class="ta_l">
						<ul >
							<li >법정감염병 : 제1급감염병 신종감염병증후군</li>
							<li>질병 코드 : U07.1</li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">병원체</th>
					<td class="ta_l">SARS-CoV-2 : <span class="txt_ntc_bold">Coronaviridae</span>에
						속하는 RNA 바이러스
					</td>
				</tr>
				<tr>
					<th scope="row">전파 경로</th>
					<td class="ta_l">
						<p>현재까지는 비말, 접촉을 통한 전파로 알려짐</p>
						<ul class="s_listin_mdot mgt0">
							<li>기침이나 재채기로 호흡기 비말 등</li>
							<li>오염된 물건을 만진 뒤 눈, 코, 입을 만짐</li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">잠복기</th>
					<td class="ta_l">1~14일 (평균 4~7일)</td>
				</tr>
				<tr>
					<th scope="row">진단 기준</th>
					<td class="ta_l">
						<ul class="s_listin_mdot mgt0">
							<li>환자 : 진단을 위한 검사기준에 따라 감염병병원체 감염이 확인된 사람</li>
							<li>진단을 위한 검사기준
								<ul>
									<li>- 검체에서 바이러스 분리</li>
									<li>- 검체에서 특이 유전자 검출</li>
								</ul>
							</li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">증상</th>
					<td class="ta_l">발열, 권태감, 기침, 호흡곤란 및 폐렴, 급성호흡곤란증후군 등 다양하게 경증에서
						중증까지 호흡기감염증이 나타남<br>드물게는 객담, 인후통, 두통, 객혈과 오심, 설사도 나타남
					</td>
				</tr>
				<tr>
					<th scope="row">치료</th>
					<td class="ta_l">
						<ul class="s_listin_mdot mgt0">
							<li>대증 치료 : 수액 보충, 해열제 등 보존적 치료</li>
							<li>특이적인 항바이러스제 없음</li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">치명률</th>
					<td class="ta_l">
						<ul class="s_listin_mdot mgt0">
							<li>치명률은 1∼2%로 알려져 있으나 아직 확실하지 않음</li>
							<li>단, 고령, 면역기능이 저하된 환자, 기저질환을 가진 환자가 주로 중증, 사망 초래</li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">관리</th>
					<td class="ta_l">
						<p class="w_bold">환자 관리</p>
						<ul class="s_listin_mdot mgt0">
							<li>표준주의, 비말주의, 접촉주의 준수</li>
							<li>증상이 있는 동안 가급적 집에서 휴식을 취하고 다른 사람과 접촉을 피하도록 권고</li>
						</ul>
						<p class="w_bold">접촉자 관리</p>
						<ul class="s_listin_mdot mgt0">
							<li>감염증상 발생 여부 관찰</li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">예방</th>
					<td class="ta_l">
						<ul class="s_listin_mdot mgt0">
							<li>백신 없음</li>
							<li>올바른 손씻기
								<ul>
									<li>- 흐르는 물에 비누로 30초 이상 손씻기</li>
									<li>- 외출 후, 배변 후, 식사 전·후, 기저귀 교체 전·후, 코를 풀거나 기침, 재채기 후 등
										실시</li>
								</ul>
							</li>
							<li>기침 예절 준수
								<ul>
									<li>- 기침할 때는 휴지나 옷소매 위쪽으로 입과 코를 가리고 하기</li>
									<li>- 호흡기 증상이 있는 경우 마스크 착용</li>
								</ul>
							</li>
							<li>씻지 않은 손으로 눈, 코, 입 만지지 않기</li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
		<div>

		</div>
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

