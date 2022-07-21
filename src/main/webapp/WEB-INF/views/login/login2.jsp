<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../includes/admin_header.jsp"%>
<meta charset="UTF-8">
<title>관리자로그인</title>
</head>
<body>
<div class="span4">
<div class="row-fluid">
<div class="block">
<div class="block-content collapse in">
<div class="container">
		<c:if test="${admin == null}">
		
		<form method ="post" autocomplete="off" action="/login/login2" >
			
				<h2 class="form-signin-heading">로그인</h2>
				<input type="text" id="admin_id" name="admin_id"  placeholder="ID"/>
			
				<p><input type="password" id="pass" name="pass"  placeholder="Password"/></p>
			
				<button type="submit" class="btn btn-large btn-primary">로그인</button>
				<button type="button" class="btn btn-large" id="signin">회원가입</button>
		</form>
		
		</c:if>
		<c:if test="${admin != null}">
			<h2>${admin.admin_id } 님 환영합니다.</h2>
		</c:if>
</div>
</div>
</div>
</div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	var result = '${result}';

	if(result === "loginFalse"){
		alert("로그인에 실패했습니다.");
	}else if(result === "loginOK"){
		alert("로그인에 성공했습니다.");
	}
	

	$("#signin").on("click", function(){
		location.href="/admin/registerAdmin";
	});
});
</script>

</html>