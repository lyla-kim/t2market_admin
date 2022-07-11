<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>

        <title>admin main page</title>
        <!-- Bootstrap -->
        <link  href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link  href="/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link  href="/resources/assets/styles.css" rel="stylesheet" media="screen">
        <script src="/resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    <%@ include file="./includes/admin_header.jsp" %>
    

<body>

    <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="/">Admin Panel</a>
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
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">게시판관리 </a>
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
