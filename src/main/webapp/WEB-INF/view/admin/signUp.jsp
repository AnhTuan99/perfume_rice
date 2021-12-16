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


		<!-- LOGIN FORM -->
		<!--===================================================-->
		<div class="cls-content">
			<div class="cls-content-lg panel">
				<div class="panel-body">
					<p class="pad-btm">Tạo một tài khoản</p>
					<form method="POST" action="/signUp" modelAttribute="users">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon"><i class="fa fa-male"></i></div>
										<input required type="text" class="form-control" placeholder="Họ và tên" name="fullName">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon"><i class="fa fa-envelope"></i></div>
										<input required type="email" class="form-control" placeholder="E-mail" name="email">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon"><i class="fa fa-phone-square" aria-hidden="true"></i></div>
										<input required type="number" class="form-control" placeholder="Số điện thoại" name="telephone">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
										<input required type="text" class="form-control" placeholder="Địa chỉ" name="address">
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon"><i class="fa fa-user"></i></div>
										<input required type="text" class="form-control" placeholder="Tài khoản" name="username">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon"><i class="fa fa-asterisk"></i></div>
										<input required autofocus id="password" type="password" class="form-control" placeholder="Mật khẩu" name="password">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon"><i class="fa fa-asterisk"></i></div>
										<input required oninput="checkPasswordMatch(this);" type="password" class="form-control" placeholder="Nhập lại mật khẩu">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-8 text-left checkbox">
								<%--<label class="form-checkbox form-icon">
									<input type="checkbox"> I agree with the <a href="#" class="btn-link">Terms and Conditions</a>
								</label>--%>
							</div>
							<div class="col-xs-4">
								<div class="form-group text-right">
									<button class="btn btn-success text-uppercase" type="submit">
										Đăng ký</button>
								</div>
							</div>
						</div>

					</form>
				</div>
			</div>
			<div class="pad-ver">
				Bạn đã có tài khoản ? <a href="/admin/login" class="btn-link mar-rgt">Đăng nhập</a>
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
