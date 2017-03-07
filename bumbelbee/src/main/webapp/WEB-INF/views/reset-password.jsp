<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Bumbelbee</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/font-awesome/4.5.0/css/font-awesome.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.custom.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ace.min.css" />
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.gritter.min.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ace-part2.min.css" />
		<![endif]-->
<!-- 		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ace-rtl.min.css" /> -->
		
		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ace-ie.min.css" />
		<![endif]-->

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="${pageContext.request.contextPath}/resources/js/html5shiv.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/respond.min.js"></script>
		<![endif]-->
		
		<!-- Gritter -->
<!-- 		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.gritter.min.css" /> -->
<!-- 		<script src="${pageContext.request.contextPath}/resources/js/ace-extra.min.js"></script> -->
	</head>

	<body class="login-layout light-login">
	   <input type="hidden" id="pagestatus" value="${pagestatus}">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<a href="${pageContext.request.contextPath}/" style="text-decoration: none;"><h1>
									<img alt="" src="${pageContext.request.contextPath}/resources/images/avatars/bug-2.png" style="height: 48px; width: 48px;">
									<span class="red">Bumbel</span>
									<span class="grey" id="id-text2">Bee</span>
								</h1></a>
								<h4 class="blue" id="id-company-text">&copy; Company Name</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">

								<div id="pwdResetForm" class="signup-box widget-box no-border visible">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon ace-icon fa fa-key green"></i>
												${user.username}
											</h4>

											<div class="space-6"></div>
											<p> Enter new password: </p>
											
											<form:form id="signup_form" method="POST" modelAttribute="user" action="${pageContext.request.contextPath}/unauth/savePassword/${Id}/${passwordResetToken}">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<form:input path="password" type="password" class="form-control" placeholder="Password" required="required" autofocus="true"/>
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
														<button type="submit" class="btn btn-sm btn-success btn-block">
															<span class="bigger-110">Change password</span>
															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>
													
<!-- 													<div class="space-24"></div> -->
													
												</fieldset>
											</form:form>
										</div>

											<!-- <div class="toolbar center">
												<a href="#" data-target="#login-box" class="back-to-login-link">
													<i class="ace-icon fa fa-arrow-left"></i>
													Back to login
												</a>
											</div> -->
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
		<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
			<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
		<![endif]-->
		
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery.gritter.min.js"></script>
		
		<script>
		$(document).on('submit', '#pwdResetForm', function(e) {
			function ajaxcall() {
					var xmlhttp;
					if (window.XMLHttpRequest) {
						xmlhttp = new XMLHttpRequest();
					} else if (window.ActiveXObject) {
						xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
					} else {
						swal("Your browser does not support XMLHTTP!");
					}

					var URL = context
							+"resetpasssword"
							+ username;

					xmlhttp.open("Post", URL, true);

					xmlhttp.onreadystatechange = function() {
						if (xmlhttp.readyState == 4) {
							$("#login_error").html("");
							$("#login_error").html(getErrorMessage(xmlhttp.responseText));

						}
					};
					var form =  $('#famaforgetpswdform');
					form[0].reset();
					xmlhttp.send(null);

			}
			function clearMessage(){
				$("#login_error").html("");
			}
			
		});
	</script>
		
	</body>
</html>
