<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="messages" var="msg" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/images/avatars/bug-48-48.png">
<title><spring:message code="app.name" /></title>

<meta name="description" content="User login page" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${contextPath}/resources/font-awesome/4.5.0/css/font-awesome.min.css" />

<!-- text fonts -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/fonts.googleapis.com.css" />

<!-- ace styles -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/jquery-ui.custom.min.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/ace.min.css" />

<link rel="stylesheet"
	href="${contextPath}/resources/css/jquery.gritter.min.css" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="${contextPath}/resources/css/ace-part2.min.css" />
		<![endif]-->
<link rel="stylesheet"
	href="${contextPath}/resources/css/ace-rtl.min.css" />

<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${contextPath}/resources/css/ace-ie.min.css" />
		<![endif]-->

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src="resources/js/html5shiv.min.js"></script>
		<script src="resources/js/respond.min.js"></script>
		<![endif]-->

<!-- Gritter -->
<!-- 		<link rel="stylesheet" href="${contextPath}/resources/css/jquery.gritter.min.css" /> -->
<!-- 		<script src="resources/js/ace-extra.min.js"></script> -->
<link rel="stylesheet" href="${contextPath}/resources/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />

<style>
.message {
	margin-top: 20px;
	padding: 10px;
	color: #FF0000;
	border: 1px solid;
	border-radius: 2px;
	background-color: #F5F6CE;
	border-color: #FF0000;
}
</style>

</head>

<body class="login-layout light-login">
	<input type="hidden" id="pagestatus" value="${pagestatus}">
	<input type="hidden" id="actionstatus" value="${actionstatus}">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<a href="${contextPath}/" style="text-decoration: none;"><h1>
									<!--<i class="ace-icon fa fa-bug green"></i> -->
									<img alt=""
										src="${contextPath}/resources/images/avatars/bug-2.png"
										style="height: 48px; width: 48px;"
										class="icon-animated-wrench"> <span class="green">Bumbel</span>
									<span class="grey" id="id-text2">Bee</span>
								</h1></a>
							<h4 class="blue" id="id-company-text">&copy; Company Name</h4>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">

							<div id="login-box" class="login-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<!-- <i class="ace-icon fa fa-bug green icon-animated-bell"></i> -->
											<fmt:message key="login.welcome.message" bundle="${msg}" />
										</h4>

										<div class="space-6"></div>
										<form id="login_form" action="${contextPath}/login" method="post">
											<c:if test="${param.error != null}">
												<div class="alert alert-danger">
													<button type="button" class="close" data-dismiss="alert">
														<i class="ace-icon fa fa-times"></i>
													</button>
													<spring:message code="${param.error}"></spring:message>
													<br />
												</div>
											</c:if>
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />
											<fieldset>
												<div
													class="form-group ${param.error != null ? 'has-error' : 'has-success'}">
													<label class="block clearfix"> <span
														class="block input-icon input-icon-right"> <input
															type="text" class="form-control" placeholder="Username"
															id="" name="username" required="required"
															autofocus="true" /> <i class="ace-icon fa fa-user"></i>
													</span>
													</label> <label class="block clearfix"> <span
														class="block input-icon input-icon-right"> <input
															type="password" class="form-control"
															placeholder="Password" id="" name="password"
															required="required" /> <i class="ace-icon fa fa-lock"></i>
													</span>
													</label>
												</div>
												<div class="space"></div>

												<div class="clearfix">
													<label class="inline"> <input type="checkbox"
														class="ace" name="remember-me" /> <span class="lbl">
															Remember Me</span>
													</label>
													<button type="submit"
														class="width-35 pull-right btn btn-sm btn-primary"
														id="loginbtn"
														data-loading-text="<i class='ace-icon fa fa-spinner fa-spin bigger-100'></i> Logging in">
														<i class="ace-icon fa fa-key"></i> <span
															class="bigger-110">Login</span>
													</button>
													<span>${error}</span>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

										<div class="social-or-login center">
											<span class="bigger-110">Or Login Using</span>
										</div>

										<div class="space-6"></div>

										<div class="social-login center">
											<a class="btn btn-primary"> <i
												class="ace-icon fa fa-facebook"></i>
											</a> <a class="btn btn-info"> <i
												class="ace-icon fa fa-twitter"></i>
											</a> <a class="btn btn-danger"> <i
												class="ace-icon fa fa-google-plus"></i>
											</a>
										</div>
									</div>
									<!-- /.widget-main -->

									<div class="toolbar clearfix">
										<div>
											<a href="#" data-target="#forgot-box"
												class="forgot-password-link"> <i
												class="ace-icon fa fa-arrow-left"></i> I forgot my password
											</a>
										</div>

										<div>
											<a href="#" data-target="#signup-box"
												class="user-signup-link"> I want to register <i
												class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.login-box -->

							<div id="forgot-box" class="forgot-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header red lighter bigger">
											<i class="ace-icon fa fa-key"></i> Retrieve Password
										</h4>

										<div class="space-6"></div>
										<p>Enter your email and to receive instructions</p>

										<form:form id="forgot_form" method="POST"
											modelAttribute="user"
											action="${contextPath}/unauth/requestPassowrdReset/mail">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <form:input
															path="email" type="email" class="form-control"
															placeholder="Email" required="required" autofocus="true" />
														<i class="ace-icon fa fa-envelope"></i>
												</span>
												</label>
												<div class="help-block col-xs-12 col-sm-reset">
													<form:errors path="email" class="text-danger" />
												</div>
												<div class="clearfix">
													<button id="forgotbtn" type="submit"
														class="width-35 pull-right btn btn-sm btn-danger"
														data-loading-text="<i class='ace-icon fa fa-spinner fa-spin bigger-100'></i> Sending..">
														<i class="ace-icon fa fa-lightbulb-o"></i> <span
															class="bigger-110">Send Me!</span>
													</button>
												</div>
											</fieldset>

										</form:form>
									</div>
									<!-- /.widget-main -->

									<div class="toolbar center">
										<a href="#" data-target="#login-box"
											class="back-to-login-link"> 
											<i class="ace-icon fa fa-arrow-left"></i>
											Back to login 
										</a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.forgot-box -->

							<div id="signup-box" class="signup-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="ace-icon fa fa-users blue"></i> New User
											Registration
										</h4>

										<div class="space-6"></div>
										<p>Enter your details to begin:</p>

										<form:form id="signup_form" method="POST"
											modelAttribute="user"
											action="${contextPath}/unauth/createUser">
											<fieldset>
												<label class="block clearfix"> 
													<span class="block input-icon input-icon-right"> 
														<form:input path="email" type="email" class="form-control" placeholder="Email" required="required" autofocus="true" />
														<i class="ace-icon fa fa-envelope"></i>
													</span>
												</label>
												<div class="help-block col-xs-12 col-sm-reset">
													<form:errors path="email" class="text-danger" />
												</div>

												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <form:input
															path="username" type="text" class="form-control"
															placeholder="Username" required="required" /> <i
														class="ace-icon fa fa-user"></i>
												</span>
												</label>
												<div class="help-block col-xs-12 col-sm-reset">
													<form:errors path="username" class="text-danger" />
												</div>

												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <form:input maxlength="100"
															path="password" type="password" class="form-control"
															placeholder="Password" required="required" /> <i
														class="ace-icon fa fa-lock"></i>
												</span>
												</label>
												<div class="help-block col-xs-12 col-sm-reset">
													<form:errors path="password" class="text-danger">
														<span class="text-danger"> Invalid password.</span>
														<ol>
															<li class="text-danger">Must be at least 8 to 16
																characters long.</li>
															<li class="text-danger">Must contain a combination
																of
																<ul class="list-unstyled">
																	<li><i class="ace-icon fa fa-caret-right red"></i>
																		Capital letters</li>
																	<li><i class="ace-icon fa fa-caret-right red"></i>
																		Small letters</li>
																	<li><i class="ace-icon fa fa-caret-right red"></i>
																		Numbers</li>
																	<li><i class="ace-icon fa fa-caret-right red"></i>
																		Special characters</li>
																</ul>
															</li>

														</ol>
													</form:errors>
												</div>


												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <form:input maxlength="100"
															path="confirmPassword" type="password"
															class="form-control" placeholder="Confirm password"
															required="required" /> <i class="ace-icon fa fa-retweet"></i>
												</span>
												</label>
												<div class="help-block col-xs-12 col-sm-reset">
													<form:errors path="confirmPassword" class="text-danger" />
												</div>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="ace-icon fa fa-refresh"></i> <span
															class="bigger-110">Reset</span>
													</button>

													<button id="signupbtn" type="submit"
														class="width-65 pull-right btn btn-sm btn-success"
														data-loading-text="<i class='ace-icon fa fa-spinner fa-spin bigger-100'></i> Processing..">
														<span class="bigger-110">Register</span> <i
															class="ace-icon fa fa-arrow-right icon-on-right"></i>
													</button>
												</div>

												<div class="space-24"></div>

												<label class="block"> <span class="lbl"
													style="font-size: 12px;"> By signing up, you agree
														to our <a href="#">terms of use, privacy policy,</a> and <a
														href="#">cookie policy.</a>
												</span>
												</label>



											</fieldset>
										</form:form>
									</div>

									<div class="toolbar center">
										<a href="#" data-target="#login-box"
											class="back-to-login-link"> <i
											class="ace-icon fa fa-arrow-left"></i> Back to login
										</a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.signup-box -->

						</div>
						<!-- /.position-relative -->

						<div class="navbar-fixed-top align-right">
							<br /> &nbsp; <a href="${contextPath}/?locale=en"><img
								src="${contextPath}/resources/images/localesicon/en.png" />&nbsp;English</a>
							&nbsp; <span class="blue">|</span> &nbsp; 
						<a href="${contextPath}/?locale=fr"><img
								src="${contextPath}/resources/images/localesicon/fr.png" />&nbsp;French</a>
							&nbsp;
						</div>
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<jsp:include page="contents/footer.jsp"/>
	<!-- basic scripts -->

	<!--[if !IE]> -->
	<script src="${contextPath}/resources/js/jquery-2.1.4.min.js"></script>

	<!-- <![endif]-->

	<!--[if IE]>
			<script src="resources/js/jquery-1.11.3.min.js"></script>
		<![endif]-->

	<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${contextPath}/resources/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/bootbox.js"></script>



	<script src="${contextPath}/resources/js/jquery.gritter.min.js"></script>

	<script type="text/javascript">
			jQuery(function($) {
				
				var actionstatus = $('#actionstatus').val();
				var pagestatus = $('#pagestatus').val();
				var showpage='login-box';
				if(actionstatus==='regs'){
					$("#signup_form")[0].reset();
					$.gritter.add({
						title: '<i class="ace-icon fa fa-check green"></i> Congratulation!',
						text: 'A verifivcation mail has been sent to your registered email address. <a href="#" class="blue">Please confirm you email address </a>.',
						sticky: true,
						class_name: 'gritter-light'
						});
				}else if(actionstatus==='rps'){
					$("#forgot_form")[0].reset();
					$.gritter.add({
							title : '<i class="ace-icon fa fa-check green"></i> Password reset code sent!',
							text : 'A password reset code has been sent to your registered email address.Note this reset toke is valid for only 1 hour. <a href="#" class="blue">Please confirm you email address before the token expires.</a>.',
							sticky : true,
							class_name : 'gritter-light'
						});
				}else if(actionstatus==='rsps'){
					$("#forgot_form")[0].reset();
					$.gritter.add({
							title : '<i class="ace-icon fa fa-check green"></i> Password reset successful!',
							text : 'your password has been successfully reset. <a href="#" class="blue">Login again to continue.</a>.',
							sticky : true,
							class_name : 'gritter-light'
						});
				}
				
				if(pagestatus==='registration-error'){
					$('.widget-box.visible').removeClass('visible');
					$('#signup-box').addClass('visible');
				} else if (pagestatus === 'request-password-error') {
					$('.widget-box.visible').removeClass('visible');
					$('#forgot-box').addClass('visible');
				}else if(get_url_parameter("showpage")!=null && get_url_parameter("showpage")!=""){
					$('.widget-box.visible').removeClass('visible');
					$("#"+showpage+'').addClass('visible');
				}else{
					$('.widget-box.visible').removeClass('visible');
					$('#login-box').addClass('visible');
				}
				
				function get_url_parameter( param ){
					var param = param.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
					var r1 = "[\\?&]"+param+"=([^&#]*)";
					var r2 = new RegExp( r1 );
					var r3 = r2.exec( window.location.href );
					if( r3 == null ){
						return null;
					}
					else {
						showpage = r3[1];
						return r3[1];
					}
				}
				
			$(document).on('click', '.toolbar a[data-target]', function(e) {
				e.preventDefault();

				$('.form-group').removeClass('has-error').addClass('has-success');
				$('.close').click();
				$('#login_form')[0].reset();
				$("#signup_form")[0].reset();
				$("#forgot_form")[0].reset();

				var target = $(this).data('target');
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target

			});

		});
	</script>

	<script type="text/javascript">
		jQuery(function($) {
			//${param.error != null}
			$("#login_form").on('submit', function(e) {
				$('#loginbtn').button('loading');
				$(this).submit();
				$.ajax({
					data : "{}",
					success : function(r) {
						$('#loginbtn').button('reset');
					}
				});
			});
			$("#signup_form").on('submit', function(e) {
				$('#signupbtn').button('loading');
				$(this).submit();
				$.ajax({
					data : "{}",
					success : function(r) {
						$('#signupbtn').button('reset');
					}
				});
			});
			$("#forgot_form").on('submit', function(e) {
				$('#forgotbtn').button('loading');
				$(this).submit();
				$.ajax({
					data : "{}",
					success : function(r) {
						$('#signupbtn').button('reset');
					}
				});
			});
		});
	</script>
	
	<script type="text/javascript">
	var context = "<%=request.getContextPath()%>";
	 /* $.get(context+'/unauth/getdata?param=mydata')
	     .done(function (data) {
	      alert(data);
     }); */
    /*  var url = 'https://dev.min.esteeonline.com/rpc/api/v1_1/loyalty/userprofile/lookup?brand=1&region=0&email_address=test@example.com';
    
     $.get(url)
     	.done(function (data) {
      	console.log(data);
	 });
     $.ajax({
 	    type: 'GET',
 	    dataType: "text",
 	    crossDomain: true,
 	    url: url,
 	    success: function (responseData, textStatus, jqXHR) {
 	        var authResult = JSON.parse(
 	            responseData.replace(
 	                '{"AuthenticateUserResult":"', ''
 	            ).replace('}"}', '}')
 	        );
 	        console.log("in");
 	    },
 	    error: function (responseData, textStatus, errorThrown) {
 	        alert('POST failed.');
 	    }
 	});
      */
	 //http://www.javased.com/index.php?source_dir=Bit4Tat/Bit4Tat/src/com/Bit4Tat/PaymentProcessorForMtGox.java
	
		
	 <%-- after_open: function(){
			var context = "<%=request.getContextPath()%>";
				setTimeout(function() {
					window.location = context + "/";
				}, 2000);
			} --%>
		</script>
</body>
</html>
