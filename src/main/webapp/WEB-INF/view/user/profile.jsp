<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<!-- Tieu Long Lanh Kute -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="utf-8">
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicons Icon -->
<link rel="icon"
	href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico"
	type="image/x-icon" />
<link rel="shortcut icon"
	href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico"
	type="image/x-icon" />
<title>Liên Hệ</title>

<!-- Mobile Specific -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS Style -->
<jsp:include page="/WEB-INF/view/user/layout/css.jsp"></jsp:include>

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,500,300,700,900'
	rel='stylesheet' type='text/css'>
</head>

<body class="cms-index-index cms-home-page">
	<div id="page">
		<!-- Header -->
		<jsp:include page="/WEB-INF/view/user/layout/header.jsp"></jsp:include>
		<!-- end header -->
		<div class="mm-toggle-wrap">
			<div class="mm-toggle">
				<i class="icon-align-justify"></i><span class="mm-label">Menu</span>
			</div>
		</div>
		<!-- Navbar -->
		<jsp:include page="/WEB-INF/view/user/layout/menu.jsp"></jsp:include>
		<!-- end nav -->

		<!-- Breadcrumbs -->
		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<ul>
							<li class="home"><a title="Về trang chủ"
								href="/index">Trang Chủ </a><span>&mdash;</span></li>
							<li class="category13"><strong>Thông Tin Của Tôi</strong></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- Breadcrumbs End -->
		<!-- main container -->
		<div class="main-container col2-right-layout wow bounceInUp animated">
			<div class="main container">
				<div class="row">
					<section class="col-main col-sm-9">
						<div class="page-title">
							<h2>Thông tin của tôi</h2>
						</div>
						<div class="static-contain">
								<!-- FORM VALIDATION ON ACCORDION -->
								<!--===================================================-->
								<sf:form method="POST" action="/profile" modelAttribute="users" id="demo-bv-accordion" class="form-horizontal">
									<sf:hidden path="id" />
									<div id="demo-accordion" class="panel-group accordion">
										<div class="panel">

											<!-- Accordion title -->
											<div class="panel-heading">
												<h4 class="panel-title">
													<a data-parent="#demo-accordion" data-toggle="collapse" href="#demo-acc-panel-1"><i class="fa"></i> Tài khoản</a>
												</h4>
											</div>

											<!-- Accordion content -->
											<div id="demo-acc-panel-1" class="panel-collapse collapse">
												<div class="panel-body">
													<div class="form-group">
														<label class="col-lg-3 control-label">Tài khoản</label>
														<div class="col-lg-7">
															<sf:input required="required"  path="username" type="text" class="form-control" name="username" placeholder="Username"/>
														</div>
													</div>
													<div class="form-group">
														<label class="col-lg-3 control-label">Email</label>
														<div class="col-lg-7">
															<sf:input required="required" path="email" type="email" class="form-control" name="email" placeholder="Email"/>
														</div>
													</div>
													<div class="form-group">
														<div class="col-lg-7 col-lg-offset-3">
															<button type="submit" class="button submit" value="Sign up">Cập nhật tài khoản và đăng nhập lại</button>
														</div>
													</div>

												</div>
											</div>
										</div>
										<form method="POST" action="/profileUpdatePass" name="registration" id="registration">
											<div class="panel">

											<!-- Accordion title -->
											<div class="panel-heading">
												<h4 class="panel-title">
													<a data-parent="#demo-accordion" data-toggle="collapse" href="#demo-acc-panel-2"><i class="fa"></i> Đổi mật khẩu</a>
												</h4>
											</div>

											<!-- Accordion content -->
											<div id="demo-acc-panel-2" class="panel-collapse collapse">
												<div class="panel-body">
													<div class="form-group">
														<label class="col-lg-3 control-label">Mật khẩu hiện tại</label>
														<div class="col-lg-7">
															<input  type="password" class="form-control" name="passwordNow" id="passwordNow" placeholder="Mật khẩu hiện tại">
														</div>
													</div>
													<div class="form-group">
														<label class="col-lg-3 control-label">Mật khẩu mới</label>
														<div class="col-lg-7">
															<input  autofocus type="password" class="form-control" name="passwordNew" id="passwordNew" placeholder="Mật khẩu mới">
														</div>
													</div>
													<div class="form-group">
														<label class="col-lg-3 control-label">Nhập lại mật khẩu mới</label>
														<div class="col-lg-7">
															<input oninput="checkPasswordMatch(this);" type="password" class="form-control" placeholder="Nhập lại mật khẩu mới">
														</div>
													</div>
													<div class="form-group">
														<div class="col-lg-7 col-lg-offset-3">
															<button onclick="updatePass();" type="button" class="button submit" value="Sign up">Cập nhật mật khẩu và đăng nhập lại</button>
														</div>
													</div>
												</div>
											</div>
										</div>
										</form>
										<div class="panel">

											<!-- Accordion title -->
											<div class="panel-heading">
												<h4 class="panel-title">
													<a data-parent="#demo-accordion" data-toggle="collapse" href="#demo-acc-panel-3"><i class="fa"></i> Thông tin</a>
												</h4>
											</div>

											<!-- Accordion content -->
											<div id="demo-acc-panel-3" class="panel-collapse collapse in">
												<div class="panel-body">
													<div class="form-group">
														<label class="col-lg-3 control-label">Họ và tên</label>
														<div class="col-lg-7">
															<sf:input required="required"  path="fullName" type="text" class="form-control" name="fullName" placeholder="Họ và tên"/>
														</div>
													</div>
													<div class="form-group">
														<label class="col-lg-3 control-label">Điện thoại</label>
														<div class="col-lg-7">
															<sf:input required="required"  path="telephone" type="text" class="form-control" name="telephone" placeholder="Điện thoại"/>
														</div>
													</div>
													<div class="form-group">
														<label class="col-lg-3 control-label">Địa chỉ</label>
														<div class="col-lg-7">
															<sf:input required="required"  path="address" type="text" class="form-control" name="address" placeholder="Địa chỉ"/>
														</div>
													</div>
													<div class="form-group">
														<div class="col-lg-7 col-lg-offset-3">
															<button type="submit" class="button submit" name="signup" value="Sign up">Cập nhật thông tin và đăng nhập lại</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</sf:form>
								<!--===================================================-->
								<!-- END FORM VALIDATION ON ACCORDION -->

						</div>
					</section>
					<aside class="col-right sidebar col-sm-3">
						<div class="block block-company">
							<div class="block-title">Thông Tin</div>
							<div class="block-content">
								<ol id="recently-viewed-items">
									<li class="item odd"><a href="/aboutUs">Giới Thiệu</a></li>
									<li class="item even"><a href="/storeAddress">Cửa Hàng</a></li>
									<li class="item last"><a href="/contact">Liên Hệ</a></li>
								</ol>
							</div>
						</div>
					</aside>
				</div>
			</div>
		</div>
		<!-- end main container -->


		<!-- Footer -->
		<jsp:include page="/WEB-INF/view/user/layout/footer.jsp"></jsp:include>
		<!-- End Footer -->
		<!-- JavaScript -->
		<jsp:include page="/WEB-INF/view/user/layout/js.jsp"></jsp:include>
		<script type='text/javascript'>
jQuery(document).ready(function(){
jQuery('#rev_slider_4').show().revolution({
dottedOverlay: 'none',
delay: 5000,
startwidth: 1920,
startheight: 650,

hideThumbs: 200,
thumbWidth: 200,
thumbHeight: 50,
thumbAmount: 2,

navigationType: 'thumb',
navigationArrows: 'solo',
navigationStyle: 'round',

touchenabled: 'on',
onHoverStop: 'on',

swipe_velocity: 0.7,
swipe_min_touches: 1,
swipe_max_touches: 1,
drag_block_vertical: false,

spinner: 'spinner0',
keyboardNavigation: 'off',

navigationHAlign: 'center',
navigationVAlign: 'bottom',
navigationHOffset: 0,
navigationVOffset: 20,

soloArrowLeftHalign: 'left',
soloArrowLeftValign: 'center',
soloArrowLeftHOffset: 20,
soloArrowLeftVOffset: 0,

soloArrowRightHalign: 'right',
soloArrowRightValign: 'center',
soloArrowRightHOffset: 20,
soloArrowRightVOffset: 0,

shadow: 0,
fullWidth: 'on',
fullScreen: 'off',

stopLoop: 'off',
stopAfterLoops: -1,
stopAtSlide: -1,

shuffle: 'off',

autoHeight: 'off',
forceFullWidth: 'on',
fullScreenAlignForce: 'off',
minFullScreenHeight: 0,
hideNavDelayOnMobile: 1500,

hideThumbsOnMobile: 'off',
hideBulletsOnMobile: 'off',
hideArrowsOnMobile: 'off',
hideThumbsUnderResolution: 0,

hideSliderAtLimit: 0,
hideCaptionAtLimit: 0,
hideAllCaptionAtLilmit: 0,
startWithSlide: 0,
fullScreenOffsetContainer: ''
});
});

</script>
</body>

<!-- Tieu Long Lanh Kute -->
</html>
<script>

	function checkPasswordMatch(fieldConfirmPassword) {
		if (fieldConfirmPassword.value != $("#passwordNew").val()) {
			fieldConfirmPassword.setCustomValidity("Mật khẩu không hợp lệ!");
		} else {
			fieldConfirmPassword.setCustomValidity("");
		}
	};

	function updatePass () {
		var data = {};
		data["passwordNow"] = $("#passwordNow").val();
		data["passwordNew"] = $("#passwordNew").val();
		$.ajax({
			url: "/profileUpdatePass",
			type: "post",
			contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
			data: JSON.stringify(data), // object json -> string json

			dataType: "json", // dữ liệu từ web-service trả về là json.
			success: function (jsonResult) { // được gọi khi web-service trả về dữ liệu.
				if (jsonResult.statusCode == 200) {
					console.log(jsonResult.data);
					alert(jsonResult.data);
					window.location.href = "/cai-nay-la-thuoc-tinh-href-trong-the-a-logout";
				} else {
					alert(jsonResult.data);
				}
			},
			error : function(jqXhr, textStatus, errorMessage) { // error callback

			}
		});
	};


</script>
