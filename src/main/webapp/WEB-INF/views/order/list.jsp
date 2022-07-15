<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리 리스트</title>
        <!-- Bootstrap -->
        <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="/resources/assets/styles.css" rel="stylesheet" media="screen">
        <link href="/resources/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <link href="/resources/vendors/jGrowl/jquery.jgrowl.css" rel="stylesheet" media="screen">
        
        <script src="/resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>

<body>
	<div class="row-fluid">
         <!-- block -->
              <div class="block">
                  <div class="navbar navbar-inner block-header">
                      <div class="muted pull-left">주문관리 리스트</div>
                  </div>
                  <div class="block-content collapse in">
                  <div class="span12">
				  <div id="example_wrapper" class="dataTables_wrapper form-inline" role="grid">
				  <div class="row">
				  <div class="span6">
				  
				  <div id="example_length" class="dataTables_length">
				  	<label><select size="1" name="example_length" aria-controls="example" id="cntPerPage" onchange="if(this.value) location.href=(this.value);">
				  			<option value="0" selected="selected">--</option>
				  			<option value="http://localhost:8080/order/list?cntPerPage=10">10</option>
				  			<option value="http://localhost:8080/order/list?cntPerPage=25">25</option>
				  			<option value="http://localhost:8080/order/list?cntPerPage=50">50</option>
				  			<option value="http://localhost:8080/order/list?cntPerPage=100">100</option>
				  			<option value="http://localhost:8080/order/list?cntPerPage=2">2</option>
				  			</select> records per page</label>
				  </div></div>
				  
				  <div class="span6">
				  <div class="dataTables_filter" id="example_filter">
				  		<form id="searchForm" action="/order/list" method="get">
				  		<select size="1" aria-controls="example" name="searchType" id="searchType">
				  			<option value="" <c:out value="${paging.searchType == null ? 'selected' : ''}"/>>--</option>
				  			<option value="r" <c:out value="${paging.searchType eq 'r' ? 'selected' : ''}"/>>주문번호</option>
				  			<option value="m" <c:out value="${paging.searchType eq 'm' ? 'selected' : ''}"/>>회원ID</option>
				  			<option value="d" <c:out value="${paging.searchType eq 'd' ? 'selected' : ''}"/>>배송상태</option>
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
				  <form id='actionForm' action="/order/list" method='get'>
                   	<input type="hidden" name="nowPage" value="${paging.nowPage}">
                   	<input type="hidden" name="cntPerPage" value="${paging.cntPerPage }">
                   	<input type="hidden" name="searchType" value='<c:out value="${paging.searchType }"/>'>
                   	<input type="hidden" name="keyword" value='<c:out value="${paging.keyword }"/>'>
                  </form> -->
				  	
				  
				  
	<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered dataTable" id="example" aria-describedby="example_info">
	<thead>
	<tr role="row">
	<th class="sorting_asc" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 150px;">주문상세번호</th>
	<th class="sorting_asc" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 150px;">주문번호</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 250px;">회원ID</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 100px;">회원명</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 207px;">주문날짜</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 150px;">배송완료 날짜</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 150px;">배송상태</th></tr>
	</thead>
	
	<tbody role="alert" aria-live="polite" aria-relevant="all">
		<c:forEach items="${list }" var="reci">
			<tr id="recilist">
				<td><c:out value="${reci.detail_no }"/></td>
				<td><c:out value="${reci.reciept_no }"/></td>
				<td><a href='/order/read?detail_no=<c:out value="${reci.detail_no }"/>&nowPage=<c:out value="${paging.nowPage }"/>
				&cntPerPage=<c:out value="${paging.cntPerPage }"/>&searchType=<c:out value="${paging.searchType }"/>
				&keyword=<c:out value="${paging.keyword }"/>'><c:out value="${reci.member_id }"/></a></td>
				<td><c:out value="${reci.member_name }"/></td>
				<td><c:out value="${reci.indate }"/></td>
				<td><c:if test="${reci.delivery eq 'N' }">-</c:if><c:if test="${reci.delivery eq 'Y' }"><c:out value="${reci.recieve_date }"/></c:if></td>
				<td><c:if test="${reci.delivery eq 'Y' }">배송완료</c:if><c:if test="${reci.delivery eq 'N' }">배송전</c:if></td></tr>
		</c:forEach>
	</tbody></table>
	
	<div class="row">
	<div class="span6">
	<div class="dataTables_paginate paging_bootstrap pagination">
	
	<ul class="pagination">
	<c:if test="${paging.startPage != 1 }">
		<li><a href="/order/list?nowPage=${paging.startPage -1 }&cntPerPage=${paging.cntPerPage }&searchType=${paging.searchType}&keyword=${paging.keyword}">← Previous</a></li>
	</c:if>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		<c:choose>
			<c:when test="${p == paging.nowPage }">
				<li class="active">${p }</li>
			</c:when>
			<c:when test="${p != paging.nowPage }">
				<a href="/order/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&keyword=${paging.keyword}">${p }</a>
			</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endPage != paging.lastPage}">
		<li class="next"><a href="/order/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&keyword=${paging.keyword}">Next → </a></li>
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
