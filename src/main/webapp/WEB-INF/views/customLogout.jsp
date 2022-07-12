<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Logout</title>
    <!-- Bootstrap -->
    <link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../../resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="../../resources/assets/styles.css" rel="stylesheet" media="screen">
     <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
  </head>
  <body id="login">
    <div class="container">

      <form class="form-signin" method='post' action="/customLogout" >
        <h2 class="form-signin-heading">로그아웃 확인</h2>
        <div>
        <button class="btn btn-large btn-primary" type="submit">로그아웃</button>
        </div>
        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
      </form>

    </div> <!-- /container -->
    <script src="../../resources/vendors/jquery-1.9.1.min.js"></script>
    <script src="../../resources/bootstrap/js/bootstrap.min.js"></script>
  
</body></html>