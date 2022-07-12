<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리 리스트</title>
        <!-- Bootstrap -->
        <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="/resources/assets/styles.css" rel="stylesheet" media="screen">
        <link href="/resources/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="/resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>

<body>
	<div class="row-fluid">
         <!-- block -->
              <div class="block">
                  <div class="navbar navbar-inner block-header">
                      <div class="muted pull-left">주문관리 리스트</div>
                  </div>
                  <div class="block-content collapse in">
                  <div class="span12">
				  <div id="example_wrapper" class="dataTables_wrapper form-inline" role="grid">
				  <div class="row">
				  <div class="span6">
				  <div id="example_length" class="dataTables_length">
				  	<label><select size="1" name="example_length" aria-controls="example">
				  			<option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option>
				  			</select> records per page</label>
				  </div></div>
				  <div class="span6">
				  <div class="dataTables_filter" id="example_filter">
				  		<select size="1" name="example_length" aria-controls="example">
			  			<option value="10" selected="selected">주문번호</option><option value="25">회원ID</option><option value="50">배송상태</option>
			  			</select>
				  	<label><input type="text" aria-controls="example" value="Search"></label></div></div>
				  </div>

				  
	<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered dataTable" id="example" aria-describedby="example_info">
	<thead>
	<tr role="row"><th class="sorting_asc" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 241px;">Rendering engine</th><th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 349px;">Browser</th><th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 323px;">Platform(s)</th><th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 207px;">Engine version</th><th class="sorting" role="columnheader" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 150px;">CSS grade</th></tr>
	</thead>
	
<tbody role="alert" aria-live="polite" aria-relevant="all"><tr class="gradeA odd">
			<td class="  sorting_1">Gecko</td>
			<td class=" ">Firefox 1.0</td>
			<td class=" ">Win 98+ / OSX.2+</td>
			<td class="center ">1.7</td>
			<td class="center ">A</td>
		</tr><tr class="gradeA even">
			<td class="  sorting_1">Gecko</td>
			<td class=" ">Firefox 1.5</td>
			<td class=" ">Win 98+ / OSX.2+</td>
			<td class="center ">1.8</td>
			<td class="center ">A</td>
		</tr></tbody></table><div class="row"><div class="span6"><div class="dataTables_info" id="example_info">Showing 1 to 10 of 57 entries</div></div><div class="span6"><div class="dataTables_paginate paging_bootstrap pagination"><ul><li class="prev disabled"><a href="#">← Previous</a></li><li class="active"><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li><a href="#">4</a></li><li><a href="#">5</a></li><li class="next"><a href="#">Next → </a></li></ul></div></div></div></div>
                       </div>
                   </div>
               </div>
               <!-- /block -->
     </div>
     

</body>
</html>