<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmpList.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/mainStyle.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- jquery 먼저 쓰기!! -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>
<body>

<!----------------------------------------------------------------------------- 
  #28. EmpList.jsp
  - 직원 리스트 출력 페이지
  - 일반직원이 접근하는 직원 리스트 출력 페이지
    (관리자가 접근하는 직원 리스트 출력 페이지는 EmployeeList.jsp 로 구성할 예정)
 ------------------------------------------------------------------------------>
 
 <div>
 
 	<!-- 메뉴 구성 영역 -->
 	<div>
 		<c:import url="EmployeeMenu.jsp"></c:import>
 	</div>
 	
 	<!-- 콘텐츠 영역 -->
	<div id="content">
		
		
		<h1>[직원정보] > [직원 리스트]</h1>
		<hr>
		
		<br>
		<!----------------------------------------------------- 
		EMPLOYEEID NAME SSN BIRTHDAY LUNAR LUNARNAME TELEPHONE
		DEPARTMENTNAME POSITIONNAME REGIONNAME
		BASICPAY EXTRAPAY PAY GRADE
		
		1	안혜지	950302	1995-03-02	0	양력	010-9349-2717	
		개발부	사원	서울
		------------------------------------------------------>
		
		<table id="customers" class="table">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주민번호</th>
				<th>생년월일</th>
				<th>양/음력</th>
				<th>전화번호</th>
				<th>지역</th>
				<th>부서</th>
				<th>직위</th>
				
			</tr>
			
			 
			<tr>
				<td>1</td>
				<td>안혜지</td>
				<td>950302</td>
				<td>1995-03-02</td>
				<td>양력</td>
				<td>010-9349-2717</td>
				<td>서울</td>
				<td>개발부</td>
				<td>사원</td>
				
			</tr> 
			<!-- 
			<c:forEach var="employee" items="${employeeList }">
			<tr>
				<td>${employee.employeeId }</td>
				<td>${employee.name }</td>
				<td>${employee.ssn1 }-*******</td>
				<td>${employee.birthday }</td>
				<td>${employee.lunarName }</td>
				<td>${employee.telephone }</td>
				<td>${employee.regionName }</td>
				<td>${employee.departmentName }</td>
				<td>${employee.positionName }</td>
				
				<%-- <td>${employee.basicPay }</td> --%>
				<td>
					<fmt:formatNumber value="${employee.basicPay }" groupingUsed="true"></fmt:formatNumber>
				</td>
				
				<%-- <td>${employee.extraPay }</td> --%>
				<td>
					<fmt:formatNumber value="${employee.extraPay }" groupingUsed="true"></fmt:formatNumber>
				</td>
				
				<%-- <td>${employee.pay }</td> --%>
				<td>
					<fmt:formatNumber value="${employee.pay }" groupingUsed="true"></fmt:formatNumber>
				</td>
				
				<%-- <td>${employee.grade }</td> --%>
				<td>${employee.grade==0 ? "관리자" : "일반사원" }</td>
				<td style="width:60px;">
					<button type="button" class="btn updateBtn btn-primary"
					value="${employee.employeeId }">수정</button>
				</td>
				<td style="width:60px;">
					<button type="button" class="btn deleteBtn btn-danger"
					value="${employee.employeeId }">삭제</button>
					
				</td>
			</tr>
			</c:forEach>
			-->
			
		</table>
		
	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 -->
	<div id="footer">
	</div> 	
 </div>
</body>
</html>