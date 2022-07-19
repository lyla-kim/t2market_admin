<!-- 관리자 공지사항 수정 화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<title>notice_modofy</title>
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
						action="/board/noticemodify">
						<!-- block -->
						<div class="block">
							<div class="navbar navbar-inner block-header">
								<div class="muted pull-left">공지사항 상세보기</div>
							</div>
							<div class="block-content collapse in">
								<div class="span12">

									<fieldset>
										<div class="control-group">
											<label>사용유무</label>
											<select name = "active">
												<option value = "Y" <c:if test="${notice.active eq 'Y' }">selected</c:if>>Y</option>
												<option value = "N" <c:if test="${notice.active eq 'N' }"></c:if>>N</option>
											</select>
										</div>
										<div class="control-group">
											<label>제목</label>
											<input type="hidden" name='notice_no' value='<c:out value="${notice.notice_no}"/>'/>
											<input name="title" id="title" style="width: 400px" value='<c:out value="${notice.title }"/>'>
										</div>
										<div class="control-group">
											<label>작성자</label>
											<input name="admin_id" id="admin_id" style="width: 400px" value='<c:out value="${notice.admin_id }"/>' readonly="readonly">
										</div>
										<div class="control-group">
											<label>작성일</label>
											<input name="regdatev" id="regdatev" style="width: 400px" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${notice.regdate }"/>' readonly="readonly">
										</div>
										<div class="control-group">
											<label>수정일</label>
											<input name="updatedatev" id="updatedatev" style="width: 400px" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${notice.updatedate }"/>' readonly="readonly">
										</div>
										<div class="control-group">
											<label class="control-l9 abel" for="textarea2">내용</label>
											<div class="controls">
												<textarea name="content" id="content" cols="30" rows="5"
													style="width: 1050px; height: 300px; font-size: 15px;" >
												<c:out value="${notice.content }" />	
												</textarea>
											</div>
										</div>
										<div class="form-actions">
											<button type="submit" id="savebutton" class="btn btn-primary">수정</button>
											<input type="button" value="목록" class="btn" onclick="location.href='/board/noticelist'">
										</div>
									</fieldset>


								</div>
							</div>
						</div>
					</form>
					<!-- /block -->
				</div>
			</div>
		</div>
	</div>
	<!-- /block -->
	<!--/.fluid-container-->
</body>
</html>
<script type="text/javascript">
	$(document).ready(function(e){
		$("#savebutton").on("click", function(e){
			
			if(!$("#title").val()){
				alert("제목을 입력하세요.");
				$("#title").focus();
				return false;
			}
			if(!$("#content").val()){
				alert("내용을 입력하세요.");
				$("#content").focus();
				return false;
			}
			
		})
	})
</script>