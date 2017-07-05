<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>My Minin Home</title>
</head>
<body>
	<h1>설정</h1>

	
	<div>
		<h3><b>사진첩</b></h3>
	<c:forEach var="pboardmnt" items="${m_pboard}" varStatus="status">
		<p>번호 : ${status.count}</p>
		<p>사진첩이름 : ${pboardmnt.pbm_name}</p>
		<p>사진첩공개범위 : <c:choose>
					    <c:when test="${pboardmnt.pbm_open eq '0'}">나만</c:when>
					    <c:when test="${pboardmnt.pbm_open eq '1'}">친구에게</c:when>
					    <c:when test="${pboardmnt.pbm_open eq '2'}">모두</c:when>
					    <c:otherwise>
					        선택하세요.
					    </c:otherwise>
					</c:choose></p>
		<p>댓글사용여부 : <c:choose>
					    <c:when test="${pboardmnt.pbm_cmt_yn eq '0'}">사용</c:when>
					    <c:when test="${pboardmnt.pbm_cmt_yn eq '1'}">사용안함</c:when>
					    <c:otherwise>
					        선택하세요.
					    </c:otherwise>
					</c:choose></p>
	</c:forEach>
	</div>

	<div>
		<h3><b>동영상</b></h3>
	<c:forEach var="vboardmnt" items="${m_vboard}" varStatus="status">
		<p>번호 : ${status.count}</p>
		<p>사진첩이름 : ${vboardmnt.vbm_name}</p>
		<p>사진첩공개범위 : <c:choose>
					    <c:when test="${vboardmnt.vbm_open eq '0'}">나만</c:when>
					    <c:when test="${vboardmnt.vbm_open eq '1'}">친구에게</c:when>
					    <c:when test="${vboardmnt.vbm_open eq '2'}">모두</c:when>
					    <c:otherwise>
					        선택하세요.
					    </c:otherwise>
					</c:choose></p>
		<p>댓글사용여부 :  <c:choose>
					    <c:when test="${vboardmnt.vbm_cmt_yn eq '0'}">사용</c:when>
					    <c:when test="${vboardmnt.vbm_cmt_yn eq '1'}">사용안함</c:when>
					    <c:otherwise>
					        선택하세요.
					    </c:otherwise>
					</c:choose></p>
	</c:forEach> 
	</div>
 	
	<div>
		<h3><b>방명록</b></h3>
		<p>방명록 사용여부 : <c:choose>
					    <c:when test="${m_guest.g_open eq '0'}">나만</c:when>
					    <c:when test="${m_guest.g_open eq '1'}">친구에게</c:when>
					    <c:when test="${m_guest.g_open eq '2'}">모두</c:when>
					    <c:otherwise>
					        선택하세요.
					    </c:otherwise>
					</c:choose>
		</p>
	</div>





	<c:if test="${empty loginMember }">
		<P>
			<a href="./login">로그인</a>
		</P>
		<P>
			<a href="./join">회원가입</a>
		</P>
	</c:if>

	<c:if test="${not empty loginMember}">
		<P>
			${loginMember.m_name}님(${loginMember.m_id}) <a href="./logout">로그아웃</a>
		</P>
		<P>
			${loginMember.m_name}님(${loginMember.m_id}) <a href="">친구추가</a>
		</P>
		<P>
			${loginMember.m_name}님(${loginMember.m_id}) <a href="">이웃리스트</a>
		</P>
		<P>
			${loginMember.m_name}님(${loginMember.m_id}) <a href="">회원정보수정</a>
		</P>
	</c:if>
	
	

</body>
</html>
