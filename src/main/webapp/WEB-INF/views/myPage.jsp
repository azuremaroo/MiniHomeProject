<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>



	<c:if test="${loginMember.m_id == null }">
		<P>
			<a href="./login">로그인</a>
		</P>
		<P>
			<a href="./join">회원가입</a>
		</P>
	</c:if>

	<c:if test="${loginMember.m_id != null }">
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
	
	
	<div>
		<p>방명록</p>
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
	<div>
		<p>사진첩</p>
		<p><c:forEach var="pboardmnt" items="${m_pboard}" varStatus="status">
	    번호 : ${status.count}
	    사진첩이름 : ${pboardmnt.pbm_name}
	    사진첩공개여부 : ${pboardmnt.pbm_open}
	    댓글사용여부 : ${pboardmnt.pbm_cmt_yn} 
	</c:forEach></p>
	</div>

	<div>
		<p>동영상</p>
		<p><c:forEach var="vboardmnt" items="${m_vboard}" varStatus="status">
	    번호 : ${status.count}
	    사진첩이름 : ${vboardmnt.vbm_name}
	    사진첩공개여부 : ${vboardmnt.vbm_open}
	    댓글사용여부 : ${vboardmnt.vbm_cmt_yn} 
	</c:forEach> </p>
	</div>
 	
	

</body>
</html>
