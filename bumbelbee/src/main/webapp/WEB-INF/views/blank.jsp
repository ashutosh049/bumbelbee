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
		<title>Blank Page - BumbelBee</title>

		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${contextPath}/resources/font-awesome/4.5.0/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="${contextPath}/resources/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="${contextPath}/resources/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="${contextPath}/resources/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="${contextPath}/resources/css/ace-skins.min.css" />
		<link rel="stylesheet" href="${contextPath}/resources/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${contextPath}/resources/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="${contextPath}/resources/js/ace-extra.min.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="${contextPath}/resources/js/html5shiv.min.js"></script>
		<script src="${contextPath}/resources/js/respond.min.js"></script>
		<![endif]-->


<style>

</style>

</head>

	<body class="no-skin">
		<jsp:include page="contents/navbar-topmenu.jsp"/>

		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>

			<jsp:include page="contents/sidebar-topmenu.jsp"/>

			<div class="main-content">
				<div class="main-content-inner">

					<div class="page-content">

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								
								<div class="col-sm-4">
											<div class="widget-box">
												<div class="widget-header">
													<h4 class="widget-title">Custom File Input</h4>

													<div class="widget-toolbar">
														<a href="#" data-action="collapse">
															<i class="ace-icon fa fa-chevron-up"></i>
														</a>

														<a href="#" data-action="close">
															<i class="ace-icon fa fa-times"></i>
														</a>
													</div>
												</div>

												<div class="widget-body">
													<div class="widget-main">
														<form:form id="myFormUpload" modelAttribute="uploadForm" action="${contextPath}/myFormUpload" enctype="multipart/form-data">
															<div class="form-group">
																<div class="col-xs-12">
																		<%--<form:input type="file" path="myfile" id="id-input-file-2" /> --%>
																		<form:input multiple="multiple" type="file" path="myfile" id="id-input-file-3" />
																</div>
															</div>
															<label>
																<input type="checkbox" name="file-format" id="id-file-format" class="ace" />
																<span class="lbl"> Allow only images</span>
															</label>
															<input type="submit" value="upload" />
														</form:form>
													</div>
													<button type="button" id="sendfile">SEND</button>
												</div>
											</div>
										</div>


								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<jsp:include page="contents/footer.jsp"/>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="${contextPath}/resources/js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="${contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->

		<!-- ace scripts -->
		<script src="${contextPath}/resources/js/ace-elements.min.js"></script>
		<script src="${contextPath}/resources/js/ace.min.js"></script>
		
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		jQuery(function($) {
			
			$('#id-input-file-1 , #id-input-file-2').ace_file_input({
				no_file:'No File ...',
				btn_choose:'Choose',
				btn_change:'Change',
				droppable:false,
				onchange:null,
				thumbnail:false //| true | large
				//whitelist:'gif|png|jpg|jpeg'
				//blacklist:'exe|php'
				//onchange:''
				//
			});
			
 			$('#id-input-file-3').ace_file_input({
				style: 'well',
				btn_choose: 'Drop files here or click to choose',
				btn_change: null,
				no_icon: 'ace-icon fa fa-cloud-upload',
				droppable: true,
				thumbnail: 'small',
				preview_error : function(filename, error_code) {}
		
			}).on('change', function(){
			});
 			
			
			$('#modal-form input[type=file]').ace_file_input({
					style:'well',
					btn_choose:'Drop files here or click to choose',
					btn_change:null,
					no_icon:'ace-icon fa fa-cloud-upload',
					droppable:true,
					thumbnail:'large'
				});
			
		/* ajax upload */	
			var context = "<%=request.getContextPath()%>";

			$('#sendfile').on('click',function(e){
				//$('#myFormUpload').submit();
				var data = new FormData();
				
				jQuery.each(jQuery('#id-input-file-3')[0].files, function(i, file) {
				    data.append('file-'+i, file);
				});
				
				 $.ajax({
					method : "POST",
					url : ''+context+"/myFormUpload?_csrf=${_csrf.token}",
					data : JSON.stringify(data),
					contentType : 'application/json; charset=UTF-8',
					dataType : 'json',
					success : function(bug) {
						if(bug== null){
							console.log('something went wrong.. try again');
						}
						console.log("\n--success---\n");
						$.each( bug, function( key, value ) {
							  console.log(key+" : "+value);
							});
					},
					error : function(xhr) {
						console.log('something went wrong.. try again\n'+xhr);
						$.each( xhr, function( key, value ) {
							  console.log(key+" : "+value);
							});
					},
					success:(function(bug){
						var context = "<%=request.getContextPath()%>";
						window.location=context+'/unauth/bug/show-bug?Id='+bug.bugId;
						  
					})
				});
			});
			
			
		});
		</script>
	
	</body>
</html>
