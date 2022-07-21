 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
        <title>T2Market_admin_Sales</title>
        <!-- Bootstrap -->
        <%@ include file="../includes/admin_header.jsp" %>
</head>
<body class="wysihtml5-supported">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3" id="sidebar">
				<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
					<li>
						<a href="noticelist"><i class="icon-chevron-right"></i> 매출조회</a>
					</li>
					<li>
						<a href="qnalist"><i class="icon-chevron-right"></i> 매출현황</a>
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
							<div class="muted pull-left">매출조회</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
								<div class="table-toolbar">
									<input type="month" id="searchStartDate" name="searchStartDate">
									<span style="margin:0px 10px">-</span>
									<input type="month" id="searchEndDate" name="searchEndDate">
									<select name="searchType" id="searchType"></select>
			<!--                        <div class="btn-group pull-right" style="padding: 10px 0px;"> -->
			<!--                           <a href="noticeregister"> -->
			<!--                           	<button class="btn btn-success">Add New  -->
			<!-- 	                          <i class="icon-plus icon-white"></i><br> -->
			<!-- 	                         </button> -->
			<!--                           </a> -->
			<!--                   		</div> -->
								</div>
								<div id="example2_wrapper" class="dataTables_wrapper form-inline" role="grid">
									<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered dataTable" id="example2" aria-describedby="example2_info">
										<thead>
											<tr role="row">
											<th class="sorting_asc" role="columnheader" tabindex="0" aria-controls="example2" style="width: 100px;">년월</th>
											<th class="sorting_asc" role="columnheader" tabindex="0" aria-controls="example2" style="width: 100px;">분류</th>
											<th class="sorting" role="columnheader" tabindex="0" aria-controls="example2" style="width: 300px;">상품명</th>
											<th class="sorting" role="columnheader" tabindex="0" aria-controls="example2" style="width: 150px;">판매수량</th>
											<th class="sorting" role="columnheader" tabindex="0" aria-controls="example2" style="width: 139px;">총판매금액</th>
										</thead>
			                         
										<tbody role="alert" aria-live="polite" aria-relevant="all" id="tbodyTag">
										</tbody>
									</table>
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
<!-- 	<script src="vendors/jquery-1.9.1.js"></script> -->
<!-- 	<script src="bootstrap/js/bootstrap.min.js"></script> -->
<!-- 	<script src="vendors/datatables/js/jquery.dataTables.min.js"></script> -->
<!-- 	<script src="assets/scripts.js"></script> -->
<!-- 	<script src="assets/DT_bootstrap.js"></script> -->
	<script>
	$(function() {
		var list = [
			{ym:"202202", type:"채소", productNm:"토마토", saleCnt:"10", totSaleAmt:"100000"},
			{ym:"202203", type:"과일", productNm:"수박", saleCnt:"10", totSaleAmt:"100000"},
			{ym:"202204", type:"채소", productNm:"토마토", saleCnt:"10", totSaleAmt:"100000"}
		];
	    //상단 검색영역
		$("#searchType").html(fnGetTypeListHtml(list));

		//목록영역
	    $("#tbodyTag").html(fnGetListHtml(list));
		
		//상단검색영역 change 이벤트
		$("#searchType").change(function(){
			var selectedVal = $(this).val();
			
			if(selectedVal){
				var filterList = list.filter(item => item.type == selectedVal);
				
				$("#tbodyTag").html(fnGetListHtml(filterList));
			}else{
				$("#tbodyTag").html(fnGetListHtml(list));
			}
		});
	    
	});
	//상단 검색영역
	function fnGetTypeListHtml(listParam){
		
		var returnSet = new Set();
		for(var i = 0 ; i < listParam.length ; i++){
			returnSet.add(listParam[i].type);
		}
		var returnHtml = '';
		
		//전체 추가
		returnHtml += '<option value="">전체</option>';
		
		returnSet.forEach(function(value){
			returnHtml += '<option value="'+value+'">'+value+'</option>';
		});
		
		return returnHtml;
		
	}
	//목록영역
	function fnGetListHtml(listParam){
		
		var returnHtml = '';
		
		for(var i = 0 ; i < listParam.length ; i++){
			var item = listParam[i];
			var ymStr = item.ym.substr(0,4) + "년" + item.ym.substr(4,2) + "월";
			returnHtml += '<tr class="gradeA odd">';
			returnHtml += '	<td class="sorting_1">'+ymStr+'</td>';
			returnHtml += '	<td class="sorting_1">'+item.type+'</td>';
			returnHtml += '	<td class="">'+item.productNm+'</td>';
			returnHtml += '	<td class="center ">'+item.saleCnt+'</td>';
			returnHtml += '	<td class="center ">'+item.totSaleAmt+'</td>';
			returnHtml += '</tr>';
		}
		
		return returnHtml;
		
	}
	</script>
</body>
</html>