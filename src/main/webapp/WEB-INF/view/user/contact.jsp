<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>


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
							<li class="category13"><strong>Liên Hệ</strong></li>
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
							<h2>Liên Hệ Với Chúng Tôi</h2>
						</div>
						<div class="static-contain">
							<form method="post" action="/contact" >
								<fieldset class="group-select">
									<ul>
										<li id="billing-new-address-form">
											<fieldset>
												<legend>New Address</legend>
												<input path="" type="hidden" name="billing[address_id]"
													id="billing:address_id"/>
												<ul>
													<li>
														<div class="customer-name">
															<div class="input-box name-firstname">
																<label for="firstName"> Họ
																	<span class="required">*</span>
																</label>
																<br>
																<input required id="firstName" type="text" name="billing[firstname]" title="First Name" class="input-text "/>
															</div>
															<div class="input-box">
																<label for="lastName">Tên
																	<span class="required">*</span>
																</label>
																<br>
																<input required id="lastName" type="text"  name="billing[lastName]" title="lastName" class="input-text"/>
															</div>
														</div>
													</li>
													<li>
														<div class="input-box name-lastname">
															<label for="email"> Địa Chỉ Email
																<span class="required">*</span>
															</label>
															<br>
															<input required type="email" id="email" name="billing[lastname]" title="Last Name" class="input-text"/>
														</div>

														<div class="input-box">
															<label for="telephone">Điện Thoại
																<span class="required">*</span>
															</label>
															<br>
															<input required id="telephone" type="tel" name="billing[telephone]" title="telephone" class="input-text"/>
														</div>
													</li>
													<li>
														<label>Địa Chỉ
															<span class="required">*</span>
														</label>
														<br>
														<input required id="address" type="text" title="Street Address" name="billing[street][]" class="input-text"/>
													</li>

													<li class=""><label for="comment">Bình Luận
														<em class="required">*</em>
													</label>
														<br>
														<div style="float: none" class="">
															<textarea required name="comment" id="comment" title="Comment" class="input-text" cols="5" rows="3"></textarea>
														</div>
													</li>
												</ul>
											</fieldset>
										</li>
										<li><span class="require"><em class="required">*
											</em>Phần Bắt Buộc</span>
											<div class="buttons-set">
												<button type="button" title="Submit" onclick="SaveContact()" class="button submit">
													<span> Xác Nhận </span>
												</button>
											</div></li>
									</ul>
								</fieldset>
							</form>
						</div>
					</section>
					<aside class="col-right sidebar col-sm-3">
						<div class="block block-company">
							<div class="block-title">Thông Tin</div>
							<div class="block-content">
								<ol id="recently-viewed-items">
									<li class="item odd"><a href="/aboutUs">Giới Thiệu</a></li>
									<li class="item even"><a href="/storeAddress">Cửa Hàng</a></li>
									<li class="item last"><strong>Liên Hệ</strong></li>
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
	<script type="text/javascript">
		function SaveContact() {
			//javaobject
			var data = {};
			data["first_name"] = $("#firstName").val();
			data["email"] = $("#email").val();	
			data["last_name"] = $("#lastName").val();
			data["telephone"] = $("#telephone").val();	
			data["address"] = $("#address").val();
			data["message"] = $("#comment").val();
			$.ajax({
				url : "/contact",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),

				dataType : "json",
				success : function(jsonResult) {
					if (jsonResult.statusCode == 200) {
						alert(jsonResult.data);
					} else {
						alert(jsonResult.data);
					}
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 

				}
			});
		}
	</script>
</body>

<!-- Tieu Long Lanh Kute -->
</html>
