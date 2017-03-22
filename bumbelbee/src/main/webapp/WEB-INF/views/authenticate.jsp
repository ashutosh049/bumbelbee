<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${contextPath}"/>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Bumbelbee</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
		<link rel="stylesheet" href="resources/font-awesome/4.5.0/css/font-awesome.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="resources/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="resources/css/jquery-ui.custom.min.css" />
		<link rel="stylesheet" href="resources/css/ace.min.css" />
		
		<link rel="stylesheet" href="resources/css/jquery.gritter.min.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="resources/css/ace-part2.min.css" />
		<![endif]-->
<!-- 		<link rel="stylesheet" href="resources/css/ace-rtl.min.css" /> -->
		
		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="resources/css/ace-ie.min.css" />
		<![endif]-->

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="resources/js/html5shiv.min.js"></script>
		<script src="resources/js/respond.min.js"></script>
		<![endif]-->
		
		<!-- Gritter -->
<!-- 		<link rel="stylesheet" href="resources/css/jquery.gritter.min.css" /> -->
<!-- 		<script src="resources/js/ace-extra.min.js"></script> -->

<style>
	.message{
		margin-top: 20px;
		padding: 10px;
		color:#FF0000;
		border: 1px solid;
		border-radius: 2px;
		background-color: #F5F6CE;
		border-color: #FF0000;
	}
</style>

	</head>

	<body class="login-layout light-login">
	   <input type="hidden" id="pagestatus" value="${pagestatus}">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<a href="${contextPath}/" style="text-decoration: none;"><h1>
									<!--<i class="ace-icon fa fa-bug green"></i> -->
									<img alt="" src="resources/images/avatars/bug-2.png" style="height: 48px; width: 48px;">
									<span class="red">Bumbel</span>
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
												<i class="ace-icon fa fa-coffee green"></i>
												Please Enter Your Information
											</h4>

											<div class="space-6"></div>
											<form action="login" method="post">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="Username" id="" name="username" required="required" autofocus="true"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Password" id="" name="password" required="required"/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace" name="remember-me"/>
															<span class="lbl"> Remember Me</span>
														</label>

														<button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">Login</span>
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
												<a class="btn btn-primary">
													<i class="ace-icon fa fa-facebook"></i>
												</a>

												<a class="btn btn-info">
													<i class="ace-icon fa fa-twitter"></i>
												</a>

												<a class="btn btn-danger">
													<i class="ace-icon fa fa-google-plus"></i>
												</a>
											</div>
										</div><!-- /.widget-main -->

										<div class="toolbar clearfix">
											<div>
												<a href="#" data-target="#forgot-box" class="forgot-password-link">
													<i class="ace-icon fa fa-arrow-left"></i>
													I forgot my password
												</a>
											</div>

											<div>
												<a href="#" data-target="#signup-box" class="user-signup-link">
													I want to register
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</div>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i>
												Retrieve Password
											</h4>

											<div class="space-6"></div>
											<p>
												Enter your email and to receive instructions
											</p>

											<form:form method="POST" modelAttribute="user" action="requestPassowrdReset/mail">
												<fieldset>
														<label class="block clearfix">
															<span class="block input-icon input-icon-right">
																<form:input path="email" type="email" class="form-control" placeholder="Email" required="required" autofocus="true"/>
																<i class="ace-icon fa fa-envelope"></i>
															</span>
														</label>
														<div class="help-block col-xs-12 col-sm-reset">
															<form:errors path="email" class="text-danger"/>
														</div>
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
													<div class="clearfix">
														<button type="submit" class="width-35 pull-right btn btn-sm btn-danger">
															<i class="ace-icon fa fa-lightbulb-o"></i>
															<span class="bigger-110">Send Me!</span>
														</button>
													</div>
												</fieldset>
												
											</form:form>
										</div><!-- /.widget-main -->

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												Back to login
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon fa fa-users blue"></i>
												New User Registration
											</h4>

											<div class="space-6"></div>
											<p> Enter your details to begin: </p>
											
											<form:form id="signup_form" method="POST" modelAttribute="user" action="createUser">
												<fieldset>
														<label class="block clearfix">
															<span class="block input-icon input-icon-right">
																<form:input path="email" type="email" class="form-control" placeholder="Email" required="required" autofocus="true"/>
																<i class="ace-icon fa fa-envelope"></i>
															</span>
														</label>
														<div class="help-block col-xs-12 col-sm-reset">
															<form:errors path="email" class="text-danger"/>
														</div>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<form:input path="username" type="text" class="form-control" placeholder="Username" required="required"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>
													<div class="help-block col-xs-12 col-sm-reset">
														<form:errors path="username" class="text-danger"/>
													</div>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<form:input path="password" type="password" class="form-control" placeholder="Password" required="required"/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>
													<div class="help-block col-xs-12 col-sm-reset">
														<form:errors path="password" class="text-danger">
															<span class="text-danger"> Invalid password.</span>
															<ol>
															<li class="text-danger">Must be at least 8 to 16 characters long.</li>
															<li class="text-danger">Must contain a combination of
																<ul class="list-unstyled">
																		<li>
																			<i class="ace-icon fa fa-caret-right red"></i>
																			Capital letters
																		</li>
																		<li>
																			<i class="ace-icon fa fa-caret-right red"></i>
																			Small letters
																		</li>
																		<li>
																			<i class="ace-icon fa fa-caret-right red"></i>
																			Numbers
																		</li>
																		<li>
																			<i class="ace-icon fa fa-caret-right red"></i>
																			Special characters
																		</li>
																	</ul>
															</li>
															
														</ol>
														</form:errors>
													</div>
													

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<form:input path="confirmPassword" type="password" class="form-control" placeholder="Confirm password" required="required"/>
															<i class="ace-icon fa fa-retweet"></i>
														</span>
													</label>
													<div class="help-block col-xs-12 col-sm-reset">
														<form:errors path="confirmPassword" class="text-danger"/>
													</div>

													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="ace-icon fa fa-refresh"></i>
															<span class="bigger-110">Reset</span>
														</button>

														<button type="submit" class="width-65 pull-right btn btn-sm btn-success">
															<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
															<span class="bigger-110">Register</span>
															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>
													
													<div class="space-24"></div>
													
													<label class="block">
														<span class="lbl" style="font-size: 12px;">
															By signing up, you agree to our 
															<a href="#">terms of use, privacy policy,</a>
															and <a href="#">cookie policy.</a> 
														</span>
													</label>
													
													
													
												</fieldset>
											</form:form>
										</div>

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												Back to login
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.signup-box -->
							
							</div><!-- /.position-relative -->
							
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="resources/js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
			<script src="resources/js/jquery-1.11.3.min.js"></script>
		<![endif]-->
		
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		
		<script src="resources/js/jquery.gritter.min.js"></script>
		
		<script type="text/javascript">
			jQuery(function($) {
				
				get_url_parameter("pagestatus");
				function get_url_parameter( param )
				{
					param = param.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
					var r1 = "[\\?&]"+param+"=([^&#]*)";
					var r2 = new RegExp( r1 );
					var r3 = r2.exec( window.location.href );
					if( r3 == null ){
						if($('#pagestatus').val()==='' || $('#pagestatus').val()==='fresh'){
							$('.widget-box.visible').removeClass('visible');
							$('#login-box').addClass('visible');
						}else if($('#pagestatus').val()==='registration-error'){
							$('.widget-box.visible').removeClass('visible');
							$('#signup-box').addClass('visible');
						}else if($('#pagestatus').val()==='registration-success'){
							$('.widget-box.visible').removeClass('visible');
							$('#signup-box').addClass('visible');
							$("#signup_form")[0].reset();
							$.gritter.add({
								title: 'Congratulation!',
								text: 'A verifivcation mail has been sent to your registered email address. <a href="#" class="blue">Please confirm you email address </a>.',
								image: 'resources/images/avatars/bug-1.png',
								sticky: true,
								time: '',
								class_name:'gritter-center',
								after_open: function(){
									var context = "<%=request.getContextPath()%>";
									setTimeout(function() {
										window.location = context + "/";
										}, 2000);
								}
								
							});

						}else if($('#pagestatus').val()==='request-password-error'){
							$('.widget-box.visible').removeClass('visible');
							$('#forgot-box').addClass('visible');
						}else if($('#pagestatus').val()==='request-password-success'){
							$('.widget-box.visible').removeClass('visible');
							$('#forgot-box').addClass('visible');
							$.gritter.add({
								title: 'Reset code sent!',
								text : 'A password reset code has been sent to your registered email address.Note this reset toke is valid for only 1 hour. <a href="#" class="blue">Please confirm you email address before the token expires.</a>.',
								image: 'resources/images/avatars/bug-1.png',
								sticky: false,
								time: '',
								class_name:'gritter-light'
							});
						}
						return "";
					} 
					else{
						var show = "#"+r3[1];
						$('.widget-box.visible').removeClass('visible');
						$(''+show+'').addClass('visible');
						return r3[1];
					} 
				}
				
			 $(document).on('click', '.toolbar a[data-target]', function(e) {
				e.preventDefault();
				var target = $(this).data('target');
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target
			 });
			});
			
		</script>
	</body>
</html>
