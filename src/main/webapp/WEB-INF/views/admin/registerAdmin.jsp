<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <title>Forms</title>
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
    </head>
<body>
<div class="span9">
<div class="row-fluid">
<div class="block">
		<div class="block-content collapse in">
            <div class="span12">
                 <form class="form-horizontal" action="/admin/registerAdmin" method="post" id="frm" name="regAdmin">
                  <fieldset>
                    <legend>회원가입</legend>
                    <div class="control-group">
                     <!--  <label class="control-label" for="disabledInput">권한</label> -->
                      <div class="controls">
                        <select name="code_no">
                        	<option value="11" selected="selected">최상위관리자</option>
                        	<option value="12" >상품관리자</option>
                        	<option value="13" >주문관리자</option>
                        </select>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">관리자 아이디</label>
                      <div class="controls">
                        <input class="input-xlarge focused" name="admin_id" id="admin_id" type="text" required>
                        <button class="btn" type="button" id="idCheck" value="N">중복확인</button>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">비밀번호</label>
                      <div class="controls">
                        <input class="input-xlarge focused" name="pass" type="password" required>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">이름</label>
                      <div class="controls">
                        <input class="input-xlarge focused" name="name" type="text">
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="optionsCheckbox2">사용유무</label>
                      <div class="controls">
                        <label>
                          <input type="radio" name="active" value="Y" checked>
                          사용
                        </label>
                         <label>
                          <input type="radio" name="active" value="N">
                          미사용
                        </label>
                      </div>
                    </div>
                    
                    <div class="form-actions">
                      <button type="submit" class="btn btn-primary" name="signup">회원가입</button>
                      <button type="button" class="btn" id="cancel">이전</button>
                    </div>
                  </fieldset>
                </form>

            </div>
        </div>
</div>
</div>
</div>
</body>
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	var formObj = $("#frm");
	var idCheck = $("#idCheck").val();
	
	//아이디, 비밀번호 필수입력
	$(document).on("click", "button[name='signup']", function(e){
		var id=$("input[name='admin_id']").val();
		var pass = $("input[name='pass']").val();
		
		if(idCheck == "N"){
			alert("아이디 중복확인을 해야합니다.");
			return false;
		}
		
		if(id == null || id == ""){
			alert("아이디를 입력해야 합니다.");
			document.regAdmin.admin_id.focus();
			return false;
		}
		
		if(pass == null || pass == ""){
			alert("비밀번호를 입력해야 합니다.");
			document.regAdmin.pass.focus();
			return false;
		}
		
		e.preventDefault();
		formObj.submit();
	});
	
	//아이디중복체크
	$("#idCheck").on("click", function(){
		var id=$("input[name='admin_id']").val();
			
			$.ajax({
				url : "/admin/idCheck",
				type : "post",
				dataType : "json",
				data : {"id" : $("#admin_id").val()},
				success : function(data){
					if(data >0){
						alert("중복된 아이디입니다.");
						idCheck="N";
						return false;
					}else if(id===null || id===""){
						alert("아이디를 작성해주세요");
						return false;
						
					}else if(data==0){
						alert("사용 가능한 아이디입니다.");
						idCheck="Y";
						
						$("#admin_id").change(function(){
							idCheck="N";
						});
					}
				}
			});
		
	});
	
	//이전 클릭시 이전페이지 이동
	$("#cancel").on("click", function(){
		history.go(-1);
	});
});
	
</script>