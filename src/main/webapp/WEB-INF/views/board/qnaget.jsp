<!-- 관리자 공지사항 게시물 상세 화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<title>qna_get</title>
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
			
			<!--/span-->
			<div class="span9" style="margin-left: 0px;">
				<!-- morris stacked chart -->

				<div class="row-fluid">
					<form role="form" name="frm" method="post"
						action="/board/noticeregister">
						<!-- block -->
						<div class="block">
							<div class="navbar navbar-inner block-header">
								<div class="muted pull-left">1:1 상담 상세보기</div>
							</div>
							<div class="block-content collapse in">
								<div class="span12">

									<fieldset>
										<div class="control-group">
											<label>제목</label>
											<input name="title" id="title" style="width: 400px" value='<c:out value="${qna.title }"/>' readonly="readonly">
										</div>
										<div class="control-group">
											<label>작성자</label>
											<input name="title" id="title" style="width: 400px" value='<c:out value="${qna.member_id }"/>' readonly="readonly">
										</div>
										<div class="control-group">
											<label>작성일</label>
											<input name="title" id="title" style="width: 400px" value='<c:out value="${qna.regdate }"/>' readonly="readonly">
										</div>
										<div class="control-group">
											<label class="control-l9 abel" for="textarea2">내용</label>
											<div class="controls">
												<textarea name="content" id="content" cols="30" rows="5"
													style="width: 1050px; height: 250px; font-size: 16px;" readonly="readonly">
												<c:out value="${qna.content1 }" />	
												</textarea>
											</div>
										</div>
										<div class="form-actions">
											<input type="hidden" name="nowPage" value='<c:out value="${paging.nowPage }"/>'>
                   							<input type="hidden" name="cntPerPage" value='<c:out value="${paging.cntPerPage }"/>'>
											<input type="button" value="목록" class="btn" onclick="location.href='/board/qnalist?nowPage=${paging.nowPage}&cntPerPage=${paging.cntPerPage }'">
										</div>
									</fieldset>
									
								</div>
							</div>
						</div>
					</form>
					<!-- /block -->
				</div>
				
				<!-- 댓글 시작 -->
				<div class="block">
                  <div class="navbar navbar-inner block-header">
                      <div class="muted pull-left">댓글</div>
                  </div>
                  <div class="block-content collapse in">
                      <div class="span12">
                           <form id="replyForm" class="form-horizontal" action="/board/replyWrite" method="post">
                            <fieldset>
                            
                            <!-- 댓글 출력되는 자리 -->
                            <c:forEach items="${reply }" var="reply">
                            <li>
                            	<div>
                            		<p>${reply.admin_id } / ${reply.updatedate }</p>
                            		<p id="surf${reply.answer_no}">${reply.content } </p>
                            		<div style="display:none" id="hideC${reply.answer_no}">
                            			<textarea id="hideT${reply.answer_no}" cols="30" rows="5" name="content1"
													style="width: 300px; height: 200px; font-size: 15px;"></textarea>
                            		</div>
                            		<div>
                            		<button class="btn" type="button" id="replyModifyBtn${reply.answer_no}" data-answer_no="${reply.answer_no}">수정</button>
                            		<button class="btn" type="button" id="replyDeleteBtn${reply.answer_no}" data-answer_no="${reply.answer_no}">삭제</button>
                            		<!-- <button class="btn" type="button" id="replyCompleteBtn${reply.answer_no}" style="display:none" data-answer_no="${reply.answer_no}">수정완료</button>
                            		<button class="btn" type="button" id="replyCancelBtn${reply.answer_no}" style="display:none">취소</button> -->
                            		</div>
                            	</div>
                            </li>
                            </c:forEach>
                            <!-- 댓글 출력되는 자리 -->
                            
                              <hr>
                            <div id="rr">
                              <div class="control-group">
                                <label class="control-label">작성자</label>
                                <div class="controls">
                                	<input class="input-xlarge uneditable-input" type="text" name="admin_id" id="admin_id">
                                  <!-- <span class="input-xlarge uneditable-input">작성자id</span> -->
                                </div>
                              </div>
                              <div class="control-group">
                                <label class="control-label" for="focusedInput">내용</label>
                                <div class="controls">
                                  <textarea name="content" id="content" cols="30" rows="5"
									style="width: 300px; height: 200px; font-size: 15px;"></textarea>
                                </div>
                              </div>
                              <input type="hidden" name="qna_no" id="qna_no" value='<c:out value="${qna.qna_no }"/>'>
                              <input type="hidden" name="nowPage" value='<c:out value="${paging.nowPage }"/>'>
                   			  <input type="hidden" name="cntPerPage" value='<c:out value="${paging.cntPerPage }"/>'>
                              
                              <div class="form-actions">
                                <button type="submit" class="btn btn-primary">댓글등록</button>
                                <button type="reset" class="btn">취소</button>
                              </div>
                            </div>
                            </fieldset>
                          </form>

                      </div>
                  </div>
              </div>
									
				<!-- 댓글 끝 -->
			</div>
		</div>
	</div>
	<!-- /block -->
	<!--/.fluid-container-->
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		//삭제버튼 클릭 시
		$("button[id^='replyDeleteBtn']").on("click", function(){
			location.href = "/board/replyRemove?qna_no=${qna.qna_no}&answer_no="+$(this).attr("data-answer_no");
		});
		
		//수정버튼 클릭 시
		$("button[id^='replyModifyBtn']").on("click", function(){
			location.href = "/board/replyModify?qna_no=${qna.qna_no}&answer_no="+$(this).attr("data-answer_no");
		//	$("p[id^='surf']").hide();
		//	$("div[id^='hideC']").show();
		//	$("button[id^='replyModifyBtn']").hide();
		//	$("button[id^='replyDeleteBtn']").hide();
		//	$("button[id^='replyCompleteBtn']").show();
		//	$("button[id^='replyCancelBtn']").show();
			
		//	$("div[id='rr']").hide();
		});
		
		//취소 클릭 시
		//$("button[id^='replyCancelBtn']").on("click", function(){
		//	$("p[id^='surf']").show();
		//	$("div[id^='hideC']").hide();
		//	$("button[id^='replyModifyBtn']").show();
		//	$("button[id^='replyDeleteBtn']").show();
		//	$("button[id^='replyCompleteBtn']").hide();
		//	$("button[id^='replyCancelBtn']").hide();
			
		//	$("div[id='rr']").show();
		//});
		
		//수정완료버튼 클릭시 
		//$("button[id^='replyCompleteBtn']").on("click", function(){
		//	var content = $("div[id^='hideC'] textarea").val();
		//	location.href = "/board/replyModify?qna_no=${qna.qna_no}&answer_no="+$(this).attr("data-answer_no")+"&content="+content;
		//});
	});
</script>
</html>
