<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
        <title>주문관리 상세조회&수정</title>
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
                 <form class="form-horizontal" action="" method="post" id="frm" name="">
                  <fieldset>
                    <legend>주문관리 상세조회 & 수정</legend>
                    
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">회원 아이디</label>
                      <div class="controls">
                        <input class="input-xlarge focused"  type="text" value='<c:out value="${read.member_id }"/>' readonly>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">주문자</label>
                      <div class="controls">
                        <input class="input-xlarge focused"  type="text" value='<c:out value="${read.buyer_name }"/>' readonly>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">수신자</label>
                      <div class="controls">
                        <input class="input-xlarge focused"  type="text" value='<c:out value="${read.reciever_name }"/>' readonly>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">수신자 주소</label>
                      <div class="controls">
                        <input class="input-xlarge focused"  type="text" value='<c:out value="${read.reciever_address }"/>' readonly>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">상품코드</label>
                      <div class="controls">
                        <input class="input-xlarge focused"  type="text" value='<c:out value="${read.product_no }"/>' readonly>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">상품명</label>
                      <div class="controls">
                        <input class="input-xlarge focused"  type="text" value='<c:out value="${read.product_name }"/>' readonly>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">주문날짜</label>
                      <div class="controls">
                        <input class="input-xlarge focused"  type="text" value='<c:out value="${read.indate }"/>' readonly>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">수량</label>
                      <div class="controls">
                        <input class="input-xlarge focused"  type="text" value='<c:out value="${read.sales }"/>' readonly>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">총금액</label>
                      <div class="controls">
                        <input class="input-xlarge focused"  type="text" value='<c:out value="${read.total_price }"/>' readonly>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="optionsCheckbox2">배송상태</label>
                      <div class="controls">
                      	<c:choose>
                      		<c:when test="${read.delivery eq 'N' }">
                      			<label><input type="radio" name="active" value="N" checked>배송전</label>
		                        <label><input type="radio" name="active" value="Y">배송완료</label>
                      		</c:when>
                      		<c:when test="${read.delivery eq 'Y' }">
                      			<label><input type="radio" name="active" value="N" >배송전</label>
		                        <label><input type="radio" name="active" value="Y" checked>배송완료</label>
                      		</c:when>
                      	</c:choose>
                        
                      </div>
                    </div>
                    
                    <div class="form-actions">
                      <button type="submit" class="btn btn-primary" name="signup">완료</button>
                      <button type="button" class="btn" id="cancel">이전</button>
                    </div>
                  </fieldset>
                </form>

            </div>
        </div>
</div>
</div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	var formObj = $("#frm");
	
	//취소시 이전페이지 이동
	$("#cancel").on("click", function(){
		history.go(-1);
	});
});
	
</script>
</body>
</html>