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
<title>RegionList.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" style="text/css" href="<%=cp %>/css/mainStyle.css">
<style type="text/css">
	#customer
	{
		width:32%;
	}
	
	.disable
	{
		color:gray;
	}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- jquery 먼저 쓰기!! -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<!----------------------------------------------------------------------------- 
  #31. RegionList.jsp
  - 지역 리스트 출력 페이지
  - 관리자가 접근하는 지역 리스트 출력 페이지
    (일반 직원이 접근하는 지역 리스트 출력 페이지는 RegList.jsp 로 구성할 예정)

 ------------------------------------------------------------------------------>

<div>
	
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
		<h1>[지역 관리] > 지역 리스트</h1>
		
		<div>
			<form action="">
				<input type="button" value="지역 추가" class="btn btn-primary"
					onclick="location.href='regioninsertform.action'">
			</form>
		</div>
		
		<br><br>
		<!----------------------------------------------
		REGIONID REGIONNAME DELCHECK
		------------------------------------------------>
		
		<table id="customer" class="table">
			<tr>
				<th>번호</th>
				<th style="width:200px;">지역명</th>
				
				<th>수정</th>
				<th>삭제</th>
			</tr>
			
			<!-- 
			<tr>
				<td>1</td>
				<td>서울</td>
				
				<td>
					<button type="button" class="btn updateBtn">수정</button>
				</td>
				<td>
					<button type="button" class="btn deleteBtn">삭제</button>
				</td>
			</tr> 
			-->
			
			<c:forEach var="region" items="${regionList }">
			<tr>
				<td>${region.regionId }</td>
				<td>${region.regionName }</td>
			
				<td>
					<button type="button" class="btn btn-primary updateBtn"
					value="${region.regionId }">수정</button>
				</td>
				<td>
					<button type="button" 
					value="${region.regionId }"
					${region.delCheck==0 ? "class=\"btn btn-danger deleteBtn\"" : "class=\"diasable\"" }
					${region.delCheck==0 ? "" : "disabled=\"disabled\"" }>삭제</button>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<!-- 회사 소개 및 애플리케이션 소개 -->
	<div id="footer">
	
	</div>
	
</div>


</body>
</html>