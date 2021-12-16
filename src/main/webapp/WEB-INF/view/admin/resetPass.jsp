<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">


<!-- Tieu Long Lanh Kute -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login page | Nifty - Responsive admin template.</title>


	<!--STYLESHEET-->
	<!--=================================================-->

	<!--Open Sans Font [ OPTIONAL ] -->
 	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=latin" rel="stylesheet">


    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <jsp:include page="/WEB-INF/view/user/layoutForLogin/css.jsp"></jsp:include>



	<!--SCRIPT-->
	<!--=================================================-->






	<!--

	REQUIRED
	You must include this in your project.

	RECOMMENDED
	This category must be included but you may modify which plugins or components which should be included in your project.

	OPTIONAL
	Optional plugins. You may choose whether to include it in your project or not.

	DEMONSTRATION
	This is to be removed, used forÂ demonstration purposes only.Â This category must not be included in your project.

	SAMPLE
	Some script samples which explain how to initialize plugins or components. This category should not be included in your project.


	Detailed information and more samples can be found in the document.

	-->


</head>

<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->

<body>
	<div id="container" class="cls-container">

		<!-- BACKGROUND IMAGE -->
		<!--===================================================-->
		<div id="bg-overlay" class="bg-img img-balloon"></div>


		<!-- HEADER -->
		<!--===================================================-->
		<div class="cls-header cls-header-lg">
			<div class="cls-brand">
				<a class="box-inline" href="/index">
					<!-- <img alt="Nifty Admin" src="admin/img/logo.png" class="brand-icon"> -->
					<span class="brand-title">Perfume Rice <span class="text-thin"></span></span>
				</a>
			</div>
		</div>
		<!--===================================================-->


		<!-- PASSWORD RESETTING FORM -->
		<!--===================================================-->
		<div class="cls-content">
			<div class="cls-content-sm panel">
				<div class="panel-body">
					<p class="pad-btm">
						Đặt lại mật khẩu của bạn.
					</p>
					<form action="/reset_password" method="post">
						<input type="hidden" name="token" value="${token}" />
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-asterisk"></i></div>
								<input id="password" required autofocus type="password" class="form-control" placeholder="Mật khẩu" name="password">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-asterisk"></i></div>
								<input required oninput="checkPasswordMatch(this);" type="password" class="form-control" placeholder="Nhập Lại Mật khẩu">
							</div>
						</div>
						<div class="form-group text-right">
							<button class="btn btn-success text-uppercase" type="submit">Đặt lại mật khẩu</button>
						</div>
					</form>
				</div>
			</div>
			<div class="pad-ver">
				<a href="/admin/login" class="btn-link mar-rgt">Quay lại đăng nhập</a>
			</div>
		</div>
		<!--===================================================-->



	</div>
	<!--===================================================-->
	<!-- END OF CONTAINER -->



	<!--JAVASCRIPT-->
	<!--=================================================-->
    <jsp:include page="/WEB-INF/view/user/layoutForLogin/js.jsp"></jsp:include>



	<!--

	REQUIRED
	You must include this in your project.

	RECOMMENDED
	This category must be included but you may modify which plugins or components which should be included in your project.

	OPTIONAL
	Optional plugins. You may choose whether to include it in your project or not.

	DEMONSTRATION
	This is to be removed, used forÂ demonstration purposes only.Â This category must not be included in your project.

	SAMPLE
	Some script samples which explain how to initialize plugins or components. This category should not be included in your project.


	Detailed information and more samples can be found in the document.

	-->


</body>

<!-- Tieu Long Lanh Kute -->
</html>
<script>

	function checkPasswordMatch(fieldConfirmPassword) {
		if (fieldConfirmPassword.value != $("#password").val()) {
			fieldConfirmPassword.setCustomValidity("Mật khẩu không hợp lệ!");
		} else {
			fieldConfirmPassword.setCustomValidity("");
		}
	}
</script>
