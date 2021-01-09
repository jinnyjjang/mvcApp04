<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmployeeMenu.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- jquery 먼저 쓰기!! -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<!-------------------------------- 
  #13. EmployeeMenu.jsp		
  - 메인 메뉴 페이지 구성
  - 로그아웃 기능(버튼) 추가 구성
 --------------------------------->

<div class="btn-group" role="group">
	
	<c:choose>
		<c:when test="${sessionScope.admin==null }">
		<a href="emplist.action" role="button" class="menu btn btn-success btn-lg">직원 정보</a>
		</c:when>
		
		<c:otherwise>
		<a href="employeelist.action" role="button" class="menu btn btn-success btn-lg">직원 관리</a>
		</c:otherwise>
		
	</c:choose>
	
	<c:choose>
		<c:when test="${sessionScope.admin== null }">
		<a href="reglist.action" role="button" class="menu btn btn-success btn-lg">지역 정보</a>
		</c:when>
		
		<c:otherwise>
		<a href="regionlist.action" role="button" class="menu btn btn-success btn-lg">지역 관리</a>
		</c:otherwise>
		
	</c:choose>
	
	<c:choose>
		<c:when test="${sessionScope.admin== null }">
		<a href="deptlist.action" role="button" class="menu btn btn-success btn-lg">부서 정보</a>
		</c:when>
		
		<c:otherwise>
		<a href="departmentlist.action" role="button" class="menu btn btn-success btn-lg">부서 관리</a>
		</c:otherwise>	
	</c:choose>
	
	<c:choose>
		<c:when test="${sessionScope.admin== null }">
		<a href="poslist.action" role="button" class=" menu btn btn-success btn-lg">직위 정보</a>
		</c:when>
	
		<c:otherwise>
		<a href="positionlist.action" role="button" class=" menu btn btn-success btn-lg">직위 관리</a>
		</c:otherwise>
	</c:choose>
	
	<a href="logout.action" role="button" class="menu btn btn-success btn-lg">로그아웃</a>
	
</div>

</body>
</html>