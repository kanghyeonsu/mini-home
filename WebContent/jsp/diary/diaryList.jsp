
<%@page import="diary.DiaryDomain"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="navi" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/jsp/include/basicInclude.jsp"%>
</head>
<body>

	<div class="row justify-content-center">
		<div class="header">
			<c:import url="/jsp/include/header.jsp" />
		</div>

		<div class="content row">
			<div class="container">
				<center>
					<p class="h1">다이어리</p>
						<table class="table">
							
							<c:forEach var="diary" items="${diaryList}">
								<tr>
									<th > 제목</th>
									<td ><a href="${pageContext.request.contextPath}/jsp/diary/diarydetail?no=${diary.no}">${diary.title}</a></td>
								</tr>
						
							</c:forEach>
								</table>
							<table class="table">
								<tr>
									<td>
										<a href="${pageContext.request.contextPath}/jsp/diary/diarywritecontroller?categoryNo=${categoryNo}&homepageNo=${homepageNo}" class="btn btn-default" >글쓰기</a>
									</td>
									<td>
										<a href="${pageContext.request.contextPath}/jsp/category/categorylist?categoryNo=${categoryNo}" class="btn btn-default" >뒤로</a>
									</td>
								</tr>
								</table>
				
						<navi:diaryListPage data="${pageResult}" />
				</center>
			</div>
		</div>

		<div class="footer">
			<c:import url="/jsp/include/footer.jsp" />
		</div>
	</div>
	<script type="text/javascript">
		$("ul.nav.navbar-nav > li").removeClass(); //모든 li 클래스를 다 지우고
		$("ul.nav.navbar-nav > li:eq(2)").addClass("active"); // 추가
	</script>
</body>
</html>