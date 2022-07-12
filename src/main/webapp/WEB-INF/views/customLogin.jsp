<html><head>
    <title>Admin Login</title>
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

      <form class="form-signin" method='post' action="/login" >
        <h2 class="form-signin-heading">Please sign in</h2>
        <div>
        <input type="text" name="username" class="input-block-level" placeholder="Admin Id">
        </div>
        <div>
        <input type="password" name="password" class="input-block-level" placeholder="Password">
        </div>
        <div>
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        </div>
        <div>
        <button class="btn btn-large btn-primary" type="submit">Sign in</button>
        </div>
        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
      </form>

    </div> <!-- /container -->
    <script src="../../resources/vendors/jquery-1.9.1.min.js"></script>
    <script src="../../resources/bootstrap/js/bootstrap.min.js"></script>
  
</body></html>