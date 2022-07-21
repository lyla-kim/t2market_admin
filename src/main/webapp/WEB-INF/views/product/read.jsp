<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
        <title>상품관리 상세조회&수정</title>
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
        <%@ include file="../includes/admin_header.jsp" %>
      
    </head>
<body>
<div class="span9">
<div class="row-fluid">
<div class="block">
		<div class="block-content collapse in">
            <div class="span12">
                 <form role="form" class="form-horizontal" action="/product/update" method="post" id="frm" name="updateFrm">
                 <input type="hidden" name="product_no" value='<c:out value="${read.product_no }"/>'>
                  <fieldset>
                    <legend>상품관리 상세조회 & 수정</legend>
                    
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">분류</label>
                      <div class="controls">
                      	<select name="code_no" id="selectCode" onchange="selectBoxChange(this.value);">
                      		<option value="${read.code_no }" selected><c:out value="${read.code2_name }"/></option>
                      			<c:forEach var="code" items="${code }">
                      				<option value="${code.code_no }"><c:out value="${code.code2_name }"/></option>
                      			</c:forEach>
                      	</select>
                      </div>
                     </div>
                     <div class="control-group">
                      <label class="control-label" for="focusedInput">상품명 *</label>
                      <div class="controls">
                        <input class="input-xlarge focused" type="text" name='product_name' value='<c:out value="${read.product_name }"/>'>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">단가 *</label>
                      <div class="controls">
                         <input class="input-xlarge focused" type="number" name='sell_price' value='<c:out value="${read.sell_price }"/>'>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">할인율</label>
                      <div class="controls">
                         <input class="input-xlarge focused" type="number" name='discount' value='<c:out value="${read.discount }"/>'>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">재고량</label>
                      <div class="controls">
                         <input class="input-xlarge focused" type="text" name='stock' value='<c:out value="${read.stock }"/>' readonly>
                      </div>
                     </div>
                      <div class="control-group">
                      <label class="control-label" for="focusedInput">입고량</label>
                      <div class="controls">
                         <input class="input-xlarge focused" type="number" name='input'/ value=0>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">상품설명</label>
                      <div class="controls">
                      	<textarea class="input-xlarge focused" rows="15" cols="30" name='explain' ><c:out value="${read.explain}"/></textarea>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="optionsCheckbox2">사용여부</label>
                      <div class="controls">
                      	<c:choose>
                      		<c:when test="${read.active eq 'N' }">
                      			<label><input type="radio" name="active" value="N" checked>사용안함</label>
		                        <label><input type="radio" name="active" value="Y">사용중</label>
                      		</c:when>
                      		<c:when test="${read.active eq 'Y' }">
                      			<label><input type="radio" name="active" value="N" >사용안함</label>
		                        <label><input type="radio" name="active" value="Y" checked>사용중</label>
                      		</c:when>
                      	</c:choose>
                      </div>
                    </div>
                    
                    <div class="control-group">
                    <label class="control-label" for="optionsCheckbox2">상품사진</label>
						<div class='imageResult'>
							<ul>
				
							</ul>
						</div>
					</div>
                    
                    <div class="control-group">
                      <label class="control-label" for="optionsCheckbox2">업로드</label>
                      <div class="controls uploadDiv">
                      	<input type="file" name="uploadFile"><br>
                      </div>
                      <div class='uploadResult'>
                      		<ul>
                      		
                      		</ul>
                      </div>
                    </div>
                    
                    
                    <input type="hidden" name="nowPage" value='<c:out value="${paging.nowPage }"/>'>
                   	<input type="hidden" name="cntPerPage" value='<c:out value="${paging.cntPerPage }"/>'>
                   	<input type="hidden" name="searchType" value='<c:out value="${paging.searchType }"/>'>
                   	<input type="hidden" name="keyword" value='<c:out value="${paging.keyword }"/>'>
                   	
                    <div class="form-actions">
                      <button type="submit" class="btn btn-primary" name="signup">완료</button>
                      <button type="submit" data-oper='list' class="btn btn-default" >목록</button>
                    </div>
                  </fieldset>
                </form>

            </div>
        </div>
</div>
</div>
</div>
<form id="frm" method="get" action="/product/read">
	<input type="hidden" id="product_no" name="product_no" value='<c:out value="${read.product_no }"/>'>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

	$("document").ready(function(){
		var formObj = $("form");
		
		
		$('button').on("click", function(e){
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			if(operation === 'list'){
				formObj.attr("action", "/product/list").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}
			
			formObj.submit();
		});
		
		(function(){
			var product_no = '<c:out value="${read.product_no}"/>';
			$.getJSON("/product/getAttachList", {product_no:product_no}, function(arr){
				console.log(arr);
				
				var str="";
				
				$(arr).each(function(i, attach){
					var fileCallPath =  encodeURIComponent("/"+attach.uuid +"_"+attach.fileName);
					
					console.log(fileCallPath);
					str += "<li data-path='"+attach.uploadPath+"'";
					str += "data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'";
					str += "><div>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str + "</li>";
				});
				
				$(".imageResult ul").html(str);
			});
		})();
});
</script>

<script type="text/javascript">
$(document).ready(function(e){
	
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		console.log("submit clicked");
		
		var str = "";
		
		
		
		
		
		$(".uploadResult ul li").each(function(i, obj){
			var jobj = $(obj);
			
			console.log(jobj.data("type"));
			
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		});
		
		formObj.append(str).submit();
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	
	function checkExtendsion(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;
	}
	
	$("input[type='file']").change(function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		
		for(var i=0; i<files.length; i++){
			if(!checkExtendsion(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type:'POST',
			dataType: 'json',
			success: function(result){
				console.log(result);
				showUploadFile(result);
			}
		});
		
	});
	
	function showUploadFile(uploadResultArr){
		if(!uploadResultArr || uploadResultArr.length ==0)
		{
			return;	
		}
		
		var uploadURL = $(".uploadResult ul");
		var str = "";
		
		$(uploadResultArr).each(function(i, obj){
				var fileCallPath =  encodeURIComponent("/s_"+obj.uuid +"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
				str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
				str +=" ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' "
				str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +"</li>";
						
		});
		
		uploadURL.append(str);
	}
	
	$(".uploadResult").on("click", "button", function(e){
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url: '/deleteFile',
			data: {fileName: targetFile, type:type},
			dataType:'text',
			type:'POST',
			success: function(result){
				alert(result);
				targetLi.remove();
			}
		});
	});
	
});
</script>

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