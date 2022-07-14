<!-- 관리자 공지사항 목록 화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html style="" class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers no-applicationcache svg inlinesvg smil svgclippaths">
<head>
        <title>T2Market_admin_notice</title>
        <!-- Bootstrap -->
        <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="/resources/assets/styles.css" rel="stylesheet" media="screen">
        <link href="/resources/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <%@ include file="../includes/admin_header.jsp" %>
</head>
    
  <body class="wysihtml5-supported">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                        <li>
                            <a href="noticelist"><i class="icon-chevron-right"></i> 공지사항</a>
                        </li>
                        <li>
                            <a href="qnalist"><i class="icon-chevron-right"></i> 1:1 상담</a>
                        </li>
                    </ul>
                </div>
                <!--/span-->
                <div class="span9" id="content">
                      <!-- morris stacked chart -->
      <div class="row-fluid">
      
         <!-- block -->
         <div class="block">
             <div class="navbar navbar-inner block-header">
                 <div class="muted pull-left">공지사항</div>
                 
             </div>
             <div class="block-content collapse in">
                 <div class="span12">
                    <div class="table-toolbar">
                       <div class="btn-group pull-right" style="padding: 10px 0px;">
                          <a href="noticeregister">
                          	<button class="btn btn-success">Add New 
	                          <i class="icon-plus icon-white"></i><br>
	                         </button>
                          </a>
                  		</div>
                    </div>
                     
                     <div id="example2_wrapper" class="dataTables_wrapper form-inline" role="grid">
                     
                     	<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered dataTable" id="example2" aria-describedby="example2_info">
                         <thead>
                             <tr role="row">
                             <th class="sorting_asc" role="columnheader" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 162px;">번호</th>
                             <th class="sorting" role="columnheader" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 237px;">제목</th>
                             <th class="sorting" role="columnheader" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 220px;">작성자</th>
                             <th class="sorting" role="columnheader" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 139px;">작성일</th>
                         </thead>
                         
                     <tbody role="alert" aria-live="polite" aria-relevant="all">
                     	<c:forEach items="${list }" var="notice">
                     		<tr class="gradeA odd">
                                 <td class="  sorting_1"><c:out value="${notice.notice_no }" /></td>
                                 <td class="move">
                                 	<a class="move" href="/board/noticeget?notice_no=<c:out value='${notice.notice_no }' />">
                                 		<c:out value="${notice.title }" />
                                 	</a>
                                 </td>
                                 <td class=" "><c:out value="${notice.admin_id }" /></td>
                                 <td class="center "><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.regdate }" /></td>
                             </tr>
                             </c:forEach>
                           </tbody>
                         </table>
                       <!-- 기존 페이징 디자인 뺀곳  -->
                       <div class="row"><div class="span6"><div class="dataTables_info" id="example_info"></div></div>
						<div class="span6"><div class="dataTables_paginate paging_bootstrap pagination">
	
						<ul>
						<c:if test="${paging.startPage != 1 }">
							<li><a href="/board/noticelist?nowPage=${paging.startPage -1 }&cntPerPage=${paging.cntPerPage }">← Previous</a></li>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<li class="active">${p }</li>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="/board/noticelist?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<li class="next"><a href="/board/noticelist?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next → </a></li>
						</c:if>
						</ul></div></div></div>
					<!-- 페이징 끝 -->
                       </div>
                 </div>
             </div>
         </div>
         <!-- /block -->
            </div>
        </div>
    </div>
</div>
        <!--/.fluid-container-->

        <script src="vendors/jquery-1.9.1.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/datatables/js/jquery.dataTables.min.js"></script>


        <script src="assets/scripts.js"></script>
        <script src="assets/DT_bootstrap.js"></script>
        <script>
        $(function() {
            
        });
        </script>
    

</body>
</html>