<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<style>
body { margin: 0; }
.zeta-menu-bar {
  background: white;
  display: white;
  width: 100%;
}
.zeta-menu { margin: 0; padding: 0; }
.zeta-menu li {
  float: left;
  list-style:none;
  position: relative;
}
.zeta-menu li:hover { background: gainsboro; }
.zeta-menu li.expand { background: lightgreen; }
.zeta-menu li.expand>a { color: indigo; }
.zeta-menu a {
  color: black;
  display: block;
  padding: 10px 20px;
  text-decoration: none;
}
.zeta-menu ul {
  background: #eee;
  border: 1px solid silver;
  display: none;
  padding: 0;
  position: absolute;
  left: 0;
  top: 100%;
  width: 180px;
}
.zeta-menu ul li { float: none; }
.zeta-menu ul li.expand { background: #ddd; }
.zeta-menu ul li.expand a { color: black; }
.zeta-menu ul a { color: black; }
.zeta-menu ul ul { left: 100%; top: 0; }
</style>


        <title>admin main page</title>
        <!-- Bootstrap -->
        <link  href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link  href="/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link  href="/resources/assets/styles.css" rel="stylesheet" media="screen">
        <script src="/resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>

<body>

    <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="/">T2Market</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                        
	                        <ul class="nav">
	                        	<li class="dropdown"><a href="#1" class="dropdown-toggle">로그인</a></li>
	                        	<li class="dropdown"><a href="/admin/registerAdmin" class="dropdown-toggle">회원가입</a></li>
	                        </ul>
                            
                        </ul>
                        <ul class="nav">
                            
                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown" class="dropdown-toggle">상품관리</a>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">주문관리 </a>
                            </li>
                            <li class="dropdown">
                                <a href="board/noticelist" role="button" class="dropdown-toggle" data-toggle="dropdown">게시판관리 </a>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">매출관리 </a>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">코드관리 </a>
                            </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
    

    
 


</body>
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(document).mouseup(function(e) {
		if ($(e.target).parents('.zeta-menu').length == 0) {
			$('.zeta-menu li').removeClass('expand');
			$('.zeta-menu ul').hide();
		}
	});
	$(".zeta-menu>li:has(ul)>a").each( function() {
		$(this).html( $(this).html()+' &or;' );
	});
	$(".zeta-menu ul li:has(ul)")
		.find("a:first")
		.append("<p style='float:right;margin:-3px'>&#9656;</p>");

	$(".zeta-menu li>a").click(function(){
		var li = $(this).parent();
		var ul = li.parent()
		ul.find('li').removeClass('expand');
		ul.find('ul').not(li.find('ul')).hide();
		li.children('ul').toggle();
		if( li.children('ul').is(':visible') || li.has('ul')) {
			li.addClass('expand');
		}
	});
});
</script>
<script>
	$(document).ready(function(){
		$("#withdraw").on("click", function(e){
			if(!confirm("정말 탈퇴하시겠습니까?")){
				e.preventDefault();
			}
		});
	});
</script>