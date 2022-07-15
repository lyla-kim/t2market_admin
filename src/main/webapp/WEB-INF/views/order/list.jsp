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
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
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
				  		<select size="1" name="example_length" aria-controls="example">
			  			<option value="10" selected="selected">주문번호</option><option value="25">회원ID</option><option value="50">배송상태</option>
			  			</select>
				  	<label><input type="text" aria-controls="example" placeholder="Search"></label></div></div>
				  </div>

				  
	<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered dataTable" id="example" aria-describedby="example_info">
	<thead>
	<tr role="row">
	<th class="sorting_asc" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 241px;">주문번호</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 250px;">회원ID</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 100px;">회원명</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 207px;">주문날짜</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 150px;">배송완료 날짜</th>
	<th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 150px;">배송상태</th></tr>
	</thead>
	
	<tbody role="alert" aria-live="polite" aria-relevant="all">
		<c:forEach items="${list }" var="reci">
			<tr>
				
				<td><c:out value="${reci.reciept_no }"/></td>
				<td><c:out value="${reci.member_id }"/></td>
				<td><c:out value="${reci.name }"/></td>
				<td><c:out value="${reci.indate }"/></td>
				<td><c:if test="${reci.delivery eq 'N' }">-</c:if><c:if test="${reci.delivery eq 'Y' }"><c:out value="${reci.recieve_date }"/></c:if></td>
				<td><c:if test="${reci.delivery eq 'Y' }">배송완료</c:if><c:if test="${reci.delivery eq 'N' }">배송전</c:if></td>
		</c:forEach>
	</tbody></table>
	
	<div class="row"><div class="span6"><div class="dataTables_info" id="example_info">Showing 1 to 10 of 57 entries</div></div>
	<div class="span6"><div class="dataTables_paginate paging_bootstrap pagination">
	
	<ul>
	<c:if test="${paging.startPage != 1 }">
		<li><a href="/order/list?nowPage=${paging.startPage -1 }&cntPerPage=${paging.cntPerPage }">← Previous</a></li>
	</c:if>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		<c:choose>
			<c:when test="${p == paging.nowPage }">
				<li class="active">${p }</li>
			</c:when>
			<c:when test="${p != paging.nowPage }">
				<a href="/order/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
			</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endPage != paging.lastPage}">
		<li class="next"><a href="/order/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next → </a></li>
	</c:if>
	</ul></div></div></div></div>
                       </div>
                   </div>
               </div> 
               <!-- /block -->
     </div>
     


</body>
</html>  
