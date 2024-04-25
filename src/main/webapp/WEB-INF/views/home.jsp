<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>S치킨-그룹웨어</title>
<c:import url="template/head.jsp" />

<style>
/* 일요일 날짜 빨간색 */
.fc-day-sun a {
  color: red;
  text-decoration: none; /* 밑줄 제거 */
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
  color: blue;
  text-decoration: none; /* 밑줄 제거 */
}

/* 월요일부터 금요일까지의 날짜 검정색 */
.fc-day-mon a,
.fc-day-tue a,
.fc-day-wed a,
.fc-day-thu a,
.fc-day-fri a {
  color: black;
  text-decoration: none; /* 밑줄 제거 */
}

#calendar {
	height: 380px; /* 원하는 높이로 조정 */
}
</style>
  
</head>

<body>

	<!-- ======= Header ======= -->
	<c:import url="template/header.jsp" />
	<!-- ======= Sidebar ======= -->
	<c:import url="template/sidebar.jsp" />
	<main id="main" class="main">
		
		<section class="section ms-auto me-auto" style="width: 1200px;">
			<div class="pagetitle">
				<h1>메인 화면</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col">
					<div class="card" style="width: 800px;">
						<div class="card-body">
							<div id='calendar-container'>
								<div id='calendar'></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col"></div>
			</div>
			<div class="row justify-content-start d-flex">
				<div class="col-3 pagetitle" style="margin-left: 18.5%; margin-bottom: 15px"><h1>공지사항</h1></div>
				<div class="col-3 pagetitle" style="margin-left: 25.5%; margin-bottom: 15px"><h1>결재목록</h1></div>
				</div>
				<!-- border -->
			<div class="row justify-content-center d-flex">
				
				<div class=" col">
					<table class="table text-center text-nowrap">
                            <thead>
	                            <tr>
	                                <th style="width: 5%">no</th>
	                                <th style="width: 65%">제목</th>
	                                <th style="width: 10%">작성일</th>
	                                <th style="width: 10%">등록자</th>
	                                <th style="width: 10%">조회수</th>
	                            </tr>
                            </thead>
                            <tbody>
		                            <c:forEach items="${list}" var="vo" end="5">
	                            		<c:if test="${vo.sort eq 0}">
				                            <tr id="important">
                                                <input type="hidden" id="important_val" value="${vo.important}">
				                                <td>${vo.id}</td>
				                                <td class="text-start"><a href="./all/detail?id=${vo.id}">${vo.title}</a></td>
				                                <td>${vo.writeDate}</td>
				                                	<td>${vo.employeeVO.name}</td>
				                                <td>${vo.hit}</td>
				                            </tr>
			                            </c:if>
		                            </c:forEach>
	                           
                            </tbody>
                        </table>
                        </div>
				<!-- 전자결재 -->
				
				<div class=" col">
				<table class="table text-center text-nowrap">
                            <thead>
	                            <tr>
	                                <th style="width: 5%">no</th>
	                                <th style="width: 65%">제목</th>
	                                <th style="width: 10%">작성일</th>
	                                <th style="width: 10%">등록자</th>
	                                <th style="width: 10%">조회수</th>
	                            </tr>
                            </thead>
                            <tbody>
		                            <c:forEach items="${list}" var="vo" end="5">
	                            		<c:if test="${vo.sort eq 0}">
				                            <tr id="important">
                                                <input type="hidden" id="important_val" value="${vo.important}">
				                                <td>${vo.id}</td>
				                                <td class="text-start"><a href="./detail?id=${vo.id}">${vo.title}</a></td>
				                                <td>${vo.writeDate}</td>
				                                
				                                	<td>${vo.employeeVO.name}</td>
				                                
				                                <td>${vo.hit}</td>
				                            </tr>
			                            </c:if>
		                            </c:forEach>
	                           
                            </tbody>
                        </table>
                        </div>
                        
                        </div>
	

		</section>
	</main>
	<!-- End #main -->
	<!-- ======= Footer ======= -->
	<c:import url="template/footer.jsp" />
	<!-- ======= Script ======= -->
	<c:import url="template/script.jsp" />

	<!-- 모달 추가 -->
	<div class="modal fade" id="eventModal" tabindex="-1" role="dialog"
		aria-labelledby="eventModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="eventModalLabel">일정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="d-flex">
						<div class="col-5 me-2">
						<label for="start" class="form-label"><b>시작</b></label>
							<input id="start" name="start" type="datetime-local"
								class="form-control mb-3">
						</div>
						<div class="col-5 ms-2 me-2">
						<label for="end" class="form-label"><b>종료</b></label>
							<input id="end" name="end" type="datetime-local"
								class="form-control mb-3 col-2">
						</div>
						<input type="checkbox" value="" class="mt-3 me-1" id="alltime"><span style="margin-top: 40px;">종일</span>
					</div>
					<label for="title" class="form-label"><b>제목</b></label>
					<input type="text" id="title" class="form-control mb-3" placeholder="제목을 입력해주세요.">
					<label for="content" class="form-label"><b>내용</b></label>
					 <input type="text" id="content" class="form-control mb-3" placeholder="내용을 입력해주세요.">
					 <label for="share" class="form-label"><b>공유자</b></label>
					 <input type="text" id="share" class="form-control mb-3" disabled value="${profile.name}">
					 <input type="hidden" name="share" value="${profile.id}" id="emid"/>
					 

					<!--  -->
<div class="row justify-content-center mb-3 w-30">
    <label for="managerId" class="form-label"><b>공유</b></label>
    <div class="form-group mb-3 d-flex">
        <input id="managerId" name="employeeId" type="hidden" class="form-control me-1">
        <input id="managerName" type="text" class="form-control me-1" readonly required>
        <input type="button" id="searchButton" value="직원 조회" class="btn btn-primary">
        <input type="button" id="removeButton" value="직원 제거" class="btn btn-danger">
    </div>
</div>
			
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" id="saveEventBtn" class="btn btn-primary">저장</button>
				</div>
			</div>
		</div>
	</div>
<div class="modal" tabindex="-1" id="dept-modal" style="margin-top: 10%; margin-left: -3%">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">부서 등록</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="orgChart"></div>

				<div>ㅁ</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">저장</button>
            </div>
        </div>
    </div>
</div>

</body>
<script type="module">
    import orgChart from "/js/orgChart/orgChart.js";

    const searchButton = document.getElementById("searchButton");
    const removeButton = document.getElementById("removeButton");
    const managerIdInput = document.getElementById("managerId");
    const managerNameInput = document.getElementById("managerName");
	const employeeid = document.getElementById("emid").value;
    let selectedEmployees = []; // 배열에 선택된 직원을 저장

	orgChart.init("orgChart", (data) => {
		console.log(data);
		
		if (!selectedEmployees.some(emp => emp.id === data.id || data.id === employeeid)) {
        // 선택된 직원을 배열에 추가
		console.log()
        selectedEmployees.push(data);
        
        // 선택된 직원들의 이름을 쉼표로 구분하여 입력란에 표시
        updateSelectedEmployees();
    } else {
        // 이미 선택된 직원인 경우 메시지 출력 또는 다른 처리 가능
        alert('이미 선택 되었습니다.');
    }
	});
    searchButton.addEventListener("click", () => {
		const modals = new bootstrap.Modal(document.getElementById("dept-modal"));
		modals.show();
	
    });

    removeButton.addEventListener("click", () => {
        // 모든 선택된 직원 제거
        selectedEmployees = [];
        updateSelectedEmployees();
    });

    function updateSelectedEmployees() {
        // 입력란을 업데이트하기 전에 이전에 선택된 직원을 모두 제거
        managerNameInput.value = "";
        managerIdInput.value = "";

        managerNameInput.value = selectedEmployees.map(employee => employee.name).join(", ");

        // 선택된 직원들의 ID를 숨은 입력란에 저장
        managerIdInput.value = selectedEmployees.map(employee => employee.id).join(", ");
    }


// 선택된 직원 삭제 기능 추가
managerNameInput.addEventListener("click", (event) => {
    if (event.target.tagName === "INPUT") {
        console.log("click")
        const clickedName = event.target.value;
        console.log(clickedName);
        // 선택된 직원이 여러 명일 수 있으므로 클릭된 이름과 일치하는 모든 직원을 배열에서 제거합니다.
        selectedEmployees = selectedEmployees.filter(employee => employee.name !== clickedName);
        updateSelectedEmployees(); // 입력란 업데이트
    }
});





    console.log("org 차트 로그임", orgChart);
</script>



<script>
	(function () {
		$(function () {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				height: '700px', // calendar 높이 설정
				expandRows: true, // 화면에 맞게 높이 재설정
				slotMinTime: '08:00', // Day 캘린더에서 시작 시간
				slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
				headerToolbar: {
					left: 'prev,next today',
					center: 'title',
					right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
				},
				initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
				navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
				editable: true, // 수정 가능?
				selectable: true, // 달력 일자 드래그 설정가능
				nowIndicator: true, // 현재 시간 마크
				dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
				locale: 'ko', // 한국어 설정
				googleCalendarApiKey : "AIzaSyBMcaAD8R_KhHKRl3WMVS0pndILwlEtiDc",
    eventSources :[ 
        {
            googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com'
            , color: 'white'   // an option!
            , textColor: 'red' // an option!
        } 
    ],

				eventAdd: function (obj) { // 이벤트가 추가되면 발생하는 이벤트
					console.log(obj);
				},
				eventChange: function (obj) { // 이벤트가 수정되면 발생하는 이벤트
					console.log(obj);
				},
				eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
					console.log(obj);
				},
				select: function (arg) {
				    // 부트스트랩 모달 열기
				    $('#eventModal').modal('show');

				    var startDate = arg.start.toISOString().slice(0, 10); // 선택된 날짜의 날짜 부분만 추출
				    var endDate = arg.end ? arg.end.toISOString().slice(0, 10) : startDate; // 종료 날짜가 있으면 그 날짜를 선택, 없으면 시작 날짜와 같은 날짜 선택

				    // 시작 날짜에 하루를 더하여 설정
				    var nextDay = new Date(arg.start);
				    nextDay.setDate(nextDay.getDate() + 1);
				    var nextDayISO = nextDay.toISOString().slice(0, 10);

				    $('#start').val(nextDayISO + 'T' + getCurrentTime()); // 시작 날짜 입력란에 선택된 날짜와 현재 시간 값 설정
				    $('#end').val(endDate + 'T18:00'); // 종료 날짜 입력란에 선택된 날짜 값 설정

				    // 현재 시간을 HH:mm 형식으로 반환하는 함수
				    function getCurrentTime() {
				        var now = new Date();
				        var hour = now.getHours().toString().padStart(2, '0'); // 시간을 두 자리로 변환하고 앞에 0을 채움
				        var minute = now.getMinutes().toString().padStart(2, '0'); // 분을 두 자리로 변환하고 앞에 0을 채움
				        return hour + ':' + minute; // 시간과 분을 합쳐서 반환
				    }

				    // 모달에서 이벤트 제목 입력 후 저장 버튼 클릭 시
				    $('#saveEventBtn').click(function () {
				        var title = $('#title').val(); // 모달의 이벤트 제목 입력란에서 제목 가져오기
				        if (title) {
				            calendar.addEvent({
				                title: title,
				                start: arg.start,
				                end: arg.end,
				                allDay: arg.allDay
				            });
				        }
				        calendar.unselect();
				        $('#eventModal').modal('hide'); // 모달 닫기
				    });

				    // 모달이 닫힐 때 이벤트 처리
				    $('#eventModal').on('hidden.bs.modal', function () {
				        // 모달이 닫힐 때마다 이벤트 처리를 위해 클릭 이벤트 해제
				        $('#saveEventBtn').off('click');
				    });
				},






			});
			// 캘린더 랜더링
			calendar.render();
		});
	})();
	$(document).ready(function() {
	    // 종일 체크박스 클릭 이벤트 처리
	    $('#alltime').change(function() {
	        if(this.checked) {
	            // 종일 옵션이 체크되었을 때
	            $('#end').val(getEndDateAllDay()); // 종료 시간을 23:59:59로 설정
	        } else {
	            // 종일 옵션이 해제되었을 때
	            $('#end').val(getEndDateNormal()); // 종료 시간을 기존의 18:00으로 설정
	        }
	    });

	    // 종일 옵션 체크 시 종료 시간을 23:59:59로 반환하는 함수
	    function getEndDateAllDay() {
	        var endDate = $('#start').val().slice(0, 10); // 시작 날짜를 가져와서 ISO 형식으로 변환
	        return endDate + 'T23:59:59'; // 종료 시간을 23:59:59로 설정하여 반환
	    }

	    // 종일 옵션 해제 시 종료 시간을 18:00으로 반환하는 함수
	    function getEndDateNormal() {
	        var endDate = $('#start').val().slice(0, 10); // 시작 날짜를 가져와서 ISO 형식으로 변환
	        return endDate + 'T18:00'; // 기존의 종료 시간(18:00)으로 설정하여 반환
	    }
	});

	</script>
	

</html>
