<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드관리 리스트</title>
        <!-- Bootstrap -->
        <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="/resources/assets/styles.css" rel="stylesheet" media="screen">
        <link href="/resources/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <link href="/resources/vendors/jGrowl/jquery.jgrowl.css" rel="stylesheet" media="screen">
        
        <script src="/resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <%@ include file="../includes/admin_header.jsp" %>
</head>

<body>
	<div class="row-fluid">
         <!-- block -->
              <div class="block">
                  <div class="navbar navbar-inner block-header">
                      <div class="muted pull-left">코드관리 리스트</div>
                      <a href='/code/register' class="muted pull-right" style=margin:10px;>코드등록</a>
                  </div>
                  <div class="block-content collapse in">
                  <div class="span12">
				  <div id="example_wrapper" class="dataTables_wrapper form-inline" role="grid">
				  <div class="row">
				  <div class="span6">
				  
				  <div id="example_length" class="dataTables_length">
				  	<label><select size="1" name="example_length" aria-controls="example" id="cntPerPage" onchange="if(this.value) location.href=(this.value);">
				  			<option value="0" selected="selected">--</option>
				  			<option value="http://localhost:8080/code/list?cntPerPage=10">10</option>
				  			<option value="http://localhost:8080/code/list?cntPerPage=25">25</option>
				  			<option value="http://localhost:8080/code/list?cntPerPage=50">50</option>
				  			<option value="http://localhost:8080/code/list?cntPerPage=100">100</option>
				  			<option value="http://localhost:8080/code/list?cntPerPage=2">2</option>
				  			</select> records per page</label>
				  </div></div>
				  
				  <div class="span6">
				  <div class="dataTables_filter" id="example_filter">
				  		<form id="searchForm" action="/code/list" method="get">
				  		<select size="1" aria-controls="example" name="searchType" id="searchType">
				  			<option value="" <c:out value="${paging.searchType == null ? 'selected' : ''}"/>>--</option>
				  			<option value="r" <c:out value="${paging.searchType eq 'r' ? 'selected' : ''}"/>>대분류코드</option>
				  			<option value="m" <c:out value="${paging.searchType eq 'm' ? 'selected' : ''}"/>>대분류코드명</option>
				  			<option value="d" <c:out value="${paging.searchType eq 'd' ? 'selected' : ''}"/>>중분류코드</option>
				  			<option value="s" <c:out value="${paging.searchType eq 's' ? 'selected' : ''}"/>>중분류코드명</option>
			  			</select>
				  			<input type="text" aria-controls="example" placeholder="Search" id="keyword" name="keyword">
				  			
						  	<input type="hidden" name="nowPage" value="${paging.nowPage}">
						  	<input type="hidden" name="cntPerPage" value="${paging.cntPerPage }">
						  	<button id="searchBtn" type="button">검색</button>
						</form>
				  </div>
				  </div>
				  </div>

<!-- 
				  <form id='actionForm' action="/code/list" method='get'>
                   	<input type="hidden" name="nowPage" value="${paging.nowPage}">
                   	<input type="hidden" name="cntPerPage" value="${paging.cntPerPage }">
                   	<input type="hidden" name="searchType" value='<c:out value="${paging.searchType }"/>'>
                   	<input type="hidden" name="keyword" value='<c:out value="${paging.keyword }"/>'>
                  </form> -->
				  	
				  
				  
	<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered dataTable" id="example" aria-describedby="example_info">
	<thead>
	<tr role="row">
	<th class="sorting_asc" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 80px;">대분류코드</th>
	<th class="sorting_asc" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 150px;">대분류코드명</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 80px;">중분류코드</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 150px;">중분류코드명</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 80px;">소분류코드</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 150px;">소분류코드명</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 250px;">비고</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 120px;">등록일</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 120px;">수정일</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 80px;">코드관리</th>
	</tr>
	</thead>
	
	<tbody role="alert" aria-live="polite" aria-relevant="all">
		<c:forEach items="${list }" var="code">
			<tr id="codelist">
				<td><c:out value="${code.code1 }"/></td>
				<td><c:out value="${code.code1_name }"/></td>
				<td><c:out value="${code.code2 }"/></td>
				<td><c:out value="${code.code2_name }"/></td>
				<td><c:out value="${code.code3 }"/></td>
				<td><c:out value="${code.code3_name }"/></td>
				<td><c:out value="${code.bigo }"/></td>
				<td><c:out value="${code.regdate }"/></td>
				<td><c:out value="${code.updatedate }"/></td>
				<td><a href='/code/read?code_no=<c:out value="${code.code_no }"/>&nowPage=<c:out value="${paging.nowPage }"/>
				&cntPerPage=<c:out value="${paging.cntPerPage }"/>&searchType=<c:out value="${paging.searchType }"/>
				&keyword=<c:out value="${paging.keyword }"/>'>코드수정</a></td></tr>
		</c:forEach>
	</tbody></table>
	
	<div class="row">
	<div class="span6">
	<div class="dataTables_paginate paging_bootstrap pagination">
	
	<ul class="pagination">
	<c:if test="${paging.startPage != 1 }">
		<li><a href="/code/list?nowPage=${paging.startPage -1 }&cntPerPage=${paging.cntPerPage }&searchType=${paging.searchType}&keyword=${paging.keyword}">← Previous</a></li>
	</c:if>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		<c:choose>
			<c:when test="${p == paging.nowPage }">
				<li class="active">${p }</li>
			</c:when>
			<c:when test="${p != paging.nowPage }">
				<a href="/code/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&keyword=${paging.keyword}">${p }</a>
			</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endPage != paging.lastPage}">
		<li class="next"><a href="/code/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&keyword=${paging.keyword}">Next → </a></li>
	</c:if>
	</ul>
	
	</div></div></div></div>
                       </div>
                   </div>
               </div> 
               <!-- /block -->
     </div>
     
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var searchForm = $("#searchForm");
		//var actionForm = $("#actionForm");
		
		$("#searchBtn").on("click", function(e){
			//if(!searchForm.find("option:selected").val()){
	         //   alert("검색 종류를 선택하세요.");
	        //    return false;
	        //}
	        
	        //if(!searchForm.find("input[name='keyword']").val()){
	        //    alert("키워드를 입력하세요.");
	        //    return false;
	       // }
	        
	        searchForm.find("input[name='nowPage']").val("1");
	       
	        e.preventDefault();
	        searchForm.submit();
		});
		
		
		
	});
</script>
</body>
</html>  
