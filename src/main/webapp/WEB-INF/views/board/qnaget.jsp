<!-- 관리자 공지사항 게시물 상세 화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<title>notice_get</title>
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
													style="width: 1050px; height: 300px; font-size: 15px;" readonly="readonly">
												<c:out value="${qna.content }" />	
												</textarea>
											</div>
										</div>
										<div class="form-actions">
											<input type="button" value="목록" class="btn" onclick="location.href='/board/qnalist'">
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
                           <form class="form-horizontal">
                            <fieldset>
                            
                            <!-- 댓글 출력되는 자리 -->
                            <c:forEach items="${reply }" var="reply">
                            <li>
                            	<div>
                            		<p>${reply.admin_id } / ${reply.updatedate }</p>
                            		<p>${reply.content } </p>
                            	</div>
                            </li>
                            </c:forEach>
                            <!-- 댓글 출력되는 자리 -->
                            
                              <hr>
                              <div class="control-group">
                                <label class="control-label">작성자</label>
                                <div class="controls">
                                  <span class="input-xlarge uneditable-input">작성자id</span>
                                </div>
                              </div>
                              <div class="control-group">
                                <label class="control-label" for="focusedInput">내용</label>
                                <div class="controls">
                                  <textarea name="content" id="content" cols="30" rows="5"
									style="width: 300px; height: 200px; font-size: 15px;"></textarea>
                                </div>
                              </div>
                              
                              <div class="form-actions">
                                <button type="submit" class="btn btn-primary">댓글등록</button>
                                <button type="reset" class="btn">취소</button>
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
</html>
