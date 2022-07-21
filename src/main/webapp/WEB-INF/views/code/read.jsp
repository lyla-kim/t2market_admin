<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
        <title>코드관리 상세조회&수정</title>
        <!-- Bootstrap -->
        <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="/resources/assets/styles.css" rel="stylesheet" media="screen">
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="/resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <%@ include file="../includes/admin_header.jsp" %>
    </head>
<body>
<div class="span9">
<div class="row-fluid">
<div class="block">
		<div class="block-content collapse in">
            <div class="span12">
                 <form class="form-horizontal" action="/code/update" method="post" id="frm" name="updateFrm">
                  <fieldset>
                    <legend>코드관리 상세조회 & 수정</legend>
                    
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">대분류코드</label>
                      <div class="controls">
                        <input class="input-xlarge focused" type="text" value='<c:out value="${read.code1 }"/>' readonly> <!-- name="code_no" 삭제-->
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">대분류코드명</label>
                      <div class="controls">
                        <input class="input-xlarge focused"  type="text" value='<c:out value="${read.code1_name }"/>' readonly>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">중분류코드</label>
                      <div class="controls">
                        <input class="input-xlarge focused"  type="text" name='code2' value='<c:out value="${read.code2 }"/>'>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">중분류코드명</label>
                      <div class="controls">
                        <input class="input-xlarge focused"  type="text" name='code2_name' value='<c:out value="${read.code2_name }"/>'>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">소분류코드</label>
                      <div class="controls">
                        <input class="input-xlarge focused"  type="text" name='code3' value='<c:out value="${read.code3 }"/>'>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">소분류코드명</label>
                      <div class="controls">
                        <input class="input-xlarge focused"  type="text" name='code3_name' value='<c:out value="${read.code3_name }"/>'>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">비고</label>
                      <div class="controls">
                      	<textarea class="input-xlarge focused" rows="8" name='bigo' ><c:out value="${read.bigo}"/></textarea>
                      </div>
                    </div>
                      
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="optionsCheckbox2">사용여부</label>
                      <div class="controls">
                      	<c:choose>
                      		<c:when test="${read.active eq 'N' }">
                      			<label><input type="radio" name="active" value="N" checked>사용안함</label>
		                        <label><input type="radio" name="active" value="Y">사용중</label>
                      		</c:when>
                      		<c:when test="${read.active eq 'Y' }">
                      			<label><input type="radio" name="active" value="N" >사용안함</label>
		                        <label><input type="radio" name="active" value="Y" checked>사용중</label>
                      		</c:when>
                      	</c:choose>
                        
                      </div>
                    </div>
                    <input type="hidden" name="code_no" value='<c:out value="${read.code_no }"/>'>
                    <input type="hidden" name="nowPage" value='<c:out value="${paging.nowPage }"/>'>
                   	<input type="hidden" name="cntPerPage" value='<c:out value="${paging.cntPerPage }"/>'>
                   	<input type="hidden" name="searchType" value='<c:out value="${paging.searchType }"/>'>
                   	<input type="hidden" name="keyword" value='<c:out value="${paging.keyword }"/>'>
                   	
                    <div class="form-actions">
                      <button type="submit" class="btn btn-primary" name="signup">완료</button>
                      <button type="button" class="btn" id="cancel">이전</button>
                    </div>
                  </fieldset>
                </form>

            </div>
        </div>
</div>
</div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	var formObj = $("#frm");
	
	//취소시 이전페이지 이동
	$("#cancel").on("click", function(){
		history.go(-1);
	});
});
	
</script>
</body>
</html>