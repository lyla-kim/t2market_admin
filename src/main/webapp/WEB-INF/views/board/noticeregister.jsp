<!-- 관리자 공지사항 등록 화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<title>notice_register</title>
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
								<div class="muted pull-left">공지사항 등록</div>
							</div>
							<div class="block-content collapse in">
								<div class="span12">

									<fieldset>
										<div class="control-group">
											<label class="control-label" for="date01">제목</label>
											<div class="controls">
												<input type="text" class="input-xlarge" name="title"
													id="title" style="width: 1050px">
											</div>
										</div>
										<div class="control-group">
											<label class="control-l9 abel" for="textarea2">내용</label>
											<div class="controls">
												<textarea name="content" id="content" cols="30" rows="5"
													style="width: 1050px; height: 300px; font-size: 15px;"></textarea>
											</div>
										</div>
										<div class="form-actions">
											<button type="submit" id="savebutton" class="btn btn-primary">저장</button>
											<button type="reset" class="btn">취소</button>
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