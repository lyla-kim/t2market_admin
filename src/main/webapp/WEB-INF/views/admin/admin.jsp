<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ page session="false" %>
<html>
<!-- yyyyyyyyyyyyyyyyaaaaaaaaaaaaaaaa -->
<head>
	<title>T2Market_admin</title>
	<%@ include file="../includes/admin_header.jsp" %>
</head>
 
<body>
깃 푸쉬테스트 남건우
	<p>principal : <sec:authentication property="principal"/></p>
	<p>AdminVO : <sec:authentication property="principal.admin"/></p>
	<p>사용자 이름 : <sec:authentication property="principal.admin.name"/></p>
	<p>사용자 아이디 : <sec:authentication property="principal.username"/></p>
	<p>사용자 권한 리스트 : <sec:authentication property="principal.admin.authList"/></p>
</body>
</html>
