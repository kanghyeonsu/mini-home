<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<p class="h1">사진첩</p>
					<div> 사진첩 게시물 수 : ${pageResult.count}</div>
					<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>	
					<tbody>
					
					<c:forEach var = "s" items="${list}" varStatus="loop">
						<tr>
							<td>${s.no }</td>
							<td>
							<a href="${pageContext.request.contextPath}
							/jsp/photogallary/detailphotogallary
							?homepage_no=${homepage_no}
							&category_group_no=${category_group_no}
							&category_no=${category_no}
							&no=${s.no}
							&member_no=${member_no}
							&commentPageNo=1">
							${s.title }</a>
							</td>
							<td>${s.writer }</td>
							
							<fmt:formatDate var="d" value="${s.updateDate}" pattern="yyyy/MM/dd HH:mm"/>
							<td>${d}</td>
						</tr>
					</c:forEach>
					
					<c:if test="${empty list}">
						<tr>
							<td colspan='4'>입력된 게시물이 없습니다.</td>
						</tr>
					</c:if>
						<tr><td><navi:page2 data="${pageResult}" /></td></tr>
					</tbody>
					</table>
					<a onclick="move(${homepage_no}, ${category_group_no}, ${category_no}, 'writeformphotogallary')">
					글쓰기
					</a>
					<div>
					<a onclick="move(${homepage_no}, ${category_group_no}, ${category_no}, 'listphotogallarycategory')">
						뒤로가기
					</a>
					
					</div>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${empty user}"> --%>
						
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<%-- 							<a href="${pageContext.request.contextPath}/jsp/photogallary/photogallarywrite">글쓰기</a> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
									
								
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
 		
 		
 		function move(homepageNo, categoryGrpNo, categoryNo, page) {
 			var url = "${pageContext.request.contextPath}/jsp/photogallary/"+page
 			+ "?homepage_no=" + homepageNo + "&category_group_no=" + categoryGrpNo
 			+ "&category_no=" + categoryNo;
 			
 			location.href=url;
 		}
	</script> 
</body>
</html>