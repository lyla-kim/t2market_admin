<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<title>reply_modify</title>
<%@ include file="../includes/admin_header.jsp"%>
</head>
<body class="wysihtml5-supported">
<div class="container-fluid">
<div class="row-fluid">
	<div class="span3" id="sidebar">
		<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
			<li><a href="noticelist"><i class="icon-chevron-right"></i>
					공지사항</a></li>
			<li><a href="qnalist"><i class="icon-chevron-right"></i>
					1:1 상담</a></li>
		</ul>
	</div>
	
	<div class="span9" style="margin-left: 0px;">
	<div class="block">
                  <div class="navbar navbar-inner block-header">
                      <div class="muted pull-left">댓글수정</div>
                  </div>
                  <div class="block-content collapse in">
                      <div class="span12">
                           <form id="replyForm" class="form-horizontal" action="/board/replyModify" method="post">
                            <fieldset>
                            
                            <!-- 댓글 출력되는 자리 -->
                            <li>
                            	<div>
                            		<p>작성자 : ${replyUpdate.admin_id }
                            		<p>작성날짜 :  ${replyUpdate.updatedate }
                            		<div>댓글 내용 : 
                            			<textarea id="content" cols="30" rows="5" name="content"
													style="width: 300px; height: 200px; font-size: 15px;">${replyUpdate.content }</textarea>
                            		</div>
                            		
                            		<input type="hidden" name="qna_no" id="qna_no" value='<c:out value="${replyUpdate.qna_no }"/>'>
                            		<input type="hidden" name="answer_no" id="answer_no" value='<c:out value="${replyUpdate.answer_no }"/>'>
                            		<input type="hidden" name="nowPage" value='<c:out value="${paging.nowPage }"/>'>
                   			  		<input type="hidden" name="cntPerPage" value='<c:out value="${paging.cntPerPage }"/>'>
                            		<div>
                            		<button class="btn" type="submit">수정</button>
                            		<button class="btn" type="button" id="back">이전</button>
                            		</div>
                            	</div>
                            </li>
                            
                            </fieldset>
                          </form>

                      </div>
                  </div>
              </div>
          </div>
 </div>
 </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	//이전 클릭시 이전페이지 이동
	$("#back").on("click", function(){
		history.go(-1);
	});
});
	
</script>              
</body>
</html>