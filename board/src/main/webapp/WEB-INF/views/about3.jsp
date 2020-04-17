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

			<%@ include file="include/image_slide.jsp"%>

			<div class="container">

				<h4 class="s_title_1">
					사례정의 및 검사대상 <span class="t_date">(2020.3.15. 기준)</span>
				</h4>
				<p class="s_descript">코로나바이러스감염증-19(코로나19)는 임상양상, 역학적 특성에 대한 정보가
					구체적으로 밝혀질 때까지 ‘제1급감염병 신종감염병증후군’을 적용하여 대응합니다.</p>
				<p class="s_descript">대한민국 질병관리본부 사례정의에 따라 의사환자 및 조사대상 유증상자는
					진단검사를 받을 수 있습니다.</p>
				<div class="box_nh">
					<div class="bn_t">
						<p>사례정의 (2020년 3월 15일 기준)</p>
					</div>
					<div class="bn_b">
						<p class="mgt16">
							<strong class="w_bold">확진환자(Confirmed case)</strong>
						</p>
						<ul class="s_listin_dot">
							<li>임상양상에 관계없이 진단을 위한 검사기준에 따라 감염병 병원체 감염이 확인된 자<br />
							<span class="txt_ntc">※ 자가진단 항목 : 진단검사 : 코로나바이러스감염증-19
									유전자(PCR) 검사, 바이러스 분리</span></li>
						</ul>
						<p class="mgt16">
							<strong class="w_bold">의사환자</strong>
						</p>
						<ul class="s_listin_dot">
							<li>확진환자의 증상발생 기간 중 확진환자와 접촉한 후 14일 이내에 발열(37.5℃ 이상) 또는
								호흡기증상(기침, 호흡곤란, 인후통 등)이 나타난 자</li>
						</ul>
						<p class="mgt16">
							<strong class="w_bold">조사 대상 유증상자</strong>
						</p>
						<ul class="s_listin_dot">
							<li>① 의사의 소견에 따라 원인이상 폐렴 등 코로나19가 의심되는 자</li>
							<li>② 중국(홍콩, 마카오 포함) 등 코로나바이러스감염증-19 지역 전파 <span
								class="txt_ntc">(*)</span>가 있는 국가를 방문한 후 14일 이내에 발열(37.5℃ 이상) 또는
								호흡기증상(기침, 호흡곤란 등)이 나타난 자<br /> <span class="txt_ntc">(*)
									WHO 홈페이지 (local transmission) 또는 질병관리본부 홈페이지 참조</span></li>
							<li>③ 코로나바이러스감염증-19 국내 집단발생과 역학적 연관성이 있으며, 14일 이내 발열(37.5℃
								이상) 또는 호흡기증상(기침, 호흡곤란 등)이 나타난 자</li>
						</ul>
					</div>
				</div>
				<div class="box_nh mgt8">
					<div class="bn_t">
						<p>코로나 19 의심증상 발생 시 행동수칙</p>
					</div>
					<div class="bn_b">
						<ul class="s_listin_bar">
							<li>코로나 19 감염이 의심되면, 외출을 자제하고 보건소 또는 콜센터(‘1339 또는
								‘지역번호+120’)로 먼저 상담하시기 바랍니다. 외국어 지원을 해 드립니다.</li>
							<li>1339콜센터 안내에 따라 반드시 마스크를 착용한 후 선별진료소가 있는 의료기관을 방문하고, 방문 시
								의료진에게 해외여행력을 알려주시기 바랍니다.</li>
						</ul>
					</div>
				</div>

				<h4 class="s_title_1">선별진료소 방문 및 검사</h4>
				<p class="s_descript">
					의사환자일 경우, 선별진료소(보건소 또는 의료기관)의 격리공간 또는 독립된 공간으로 이동하여 검체체취가 진행됩니다. <br />검사결과가
					음성일 경우에는 자가격리기간 유지(최종 접촉일 기준 14일) 후 격리가 해제되며, 검사결과가 양성일 경우에는 증상의
					중증도에 따라 적절한 치료를 받습니다.
				</p>
				<p class="s_descript">조사대상 유증상자의 경우도 의사환자와 동일하게 격리공간 또는 독립된 공간으로
					이동하여 검체체취가 진행되며, 검사결과가 양성일 경우 증상의 중증도에 따라 적절한 치료를 받습니다. 다만, 검사결과가
					음성일 경우에는 보건교육(외출 금지, 대중교통 이용 금지, 가족과 동선 겹치지 않기 등)을 받고 증상발현일 이후
					14일까지 보건교육 내용을 준수할 것을 권고 받습니다.</p>

				<h4 class="s_title_1">확진환자 치료 및 지원</h4>
				<p class="s_descript">한국 정부는 환자를 중증도에 따라 분류하고 중증환자는 입원치료를 우선
					제공하고, 입원이 필요하지 않은 확진자에 대해서는 자택이나 시설에서 의료서비스 지원 및 증상 모니터링 등을 하기
					위함입니다.</p>
				<p class="s_descript">먼저, 보건소에서 확진자를 확인하고, 시도별로 구성된 환자관리반 의료진이
					확진자 중증도를 4가지(경증 &middot; 중등도 &middot; 중증 &middot; 최중증)로 분류합니다.</p>
				<p class="s_descript">중등도 &middot; 중증 &middot; 최중증 환자 등은 환자상태에
					따라 감염병전담병원, 국가지정 입원치료기관 등에 치료병상을 배정하여 신속히 입원치료하게 됩니다.</p>
				<p class="s_descript">생활치료센터* 는 주로 퇴원기준으로 퇴원한 경증 환자나 무증상 확진자 중
					자택에서 치료가 어려운 경우 입소하여 격리하는 시설입니다. 이 시설에서는 의료진이 1일 2회 이상 모니터링을 실시하고
					증상 악화시엔 의료기관으로 신속 이송, 증상 완화시엔 격리해제 기준에 따라 퇴소하게 됩니다.(약 3주)</p>
				<p class="s_descript">생활치료센터는 각 시도별로 국가운영시설, 숙박시설 등을 지정하여 운영하며,
					의료진 및 의료장비(산소포화도 측정기, 체온계, 혈압계, 심폐소생술 세트, 흉부 X선 촬영기 등) 개인구호키트(속옷,
					세면도구, 마스크 등) 및 위생키트(체온계 &middot; 의약품)를 지원합니다.</p>
				<p class="s_descript">한편, 입원 대기 중인 확진자에게는 전화 상담과 필요 의약품 공급 등
					24시간 전담 진료제를 실시하고 있습니다. 입원대기 환자는 공공기관 자료를 활용해 환자들의 기저질환을 미리 확인하고,
					신속하게 중증도를 분류해 입원 치료를 결정합니다.</p>
				<p class="s_descript">한국 정부는 국민들이 감염 예방에 적극 협조하고 생계에 지장을 받지 않도록,
					확진환자는 입원 &middot; 치료비, 의심환자 등의 진단검사비는 전액 건강보험 또는 국비로 지원합니다. 또한
					자가격리자나 입원 대상자에 대해서는 생활지원비 또는 유급휴가비를 지원하고, 사망시에는 장례비를 지급합니다.</p>

				<h4 class="s_title_1">격리해제</h4>
				<p class="s_descript">확진환자 중 증상이 있는 경우 임상기준과 검사기준이 충족되면 격리해제
					됩니다.</p>
				<p class="s_descript">임상기준은 해열제를 복용하지 않고 발열이 없으며 임상 증상이 호전된
					경우이며, 검사기준은 PCR 검사결과 24시간 간격으로 2회 검사를 실시하여 음성 결과를 확인하는 것이 원칙 입니다.</p>
				<p class="s_descript">확진환자 중 증상이 없는 경우에는 확진일로부터 7일째 검사결과가 24시간
					간격으로 2회 음성이면 격리해제 되며, 확진일로부터 7일째 검사결과가 양성이면 이후 검사주기(확진 후 10일째, 14일째
					등)는 의료진 등이 결정하여 진행하며 24시간 간격으로 검사를 실시하여 2회 음성이 나오면 격리해제 됩니다.</p>
				<!-- e: content -->


			</div>



		</div>
	</div>


	<!-- /.row -->
	</div>

	<!-- /.container -->





	<%@ include file="include/footer.jsp"%>

	<%@ include file="include/plugin_js.jsp"%>

</body>

</html>

