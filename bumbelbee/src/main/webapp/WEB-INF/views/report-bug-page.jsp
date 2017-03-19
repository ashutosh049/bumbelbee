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
		<title>BumbelBee</title>

		<meta name="description" content="and Validation" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${contextPath}/resources/font-awesome/4.5.0/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="${contextPath}/resources/css/select2.min.css" />

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
		
		<!-- editable -->
		<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap-editable.min.css" />
		
		<!-- ace settings handler -->
		<script src="${contextPath}/resources/js/ace-extra.min.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="${contextPath}/resources/js/html5shiv.min.js"></script>
		<script src="${contextPath}/resources/js/respond.min.js"></script>
		<![endif]-->
			
		<!-- blueim-FILE-UPLOAD -->
<%-- 		<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
		<link rel="stylesheet" href="${contextPath}/resources/css/jquery.fileupload.css"> --%>
		
		<!-- Bootstrap File upload -->
<%-- 		<link href="${contextPath}/resources/bootstrap-fileupload/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" /> --%>

<!-- filer -->
	<link href="${contextPath}/resources/filer/css/jquery.filer.css" rel="stylesheet">
		
<!-- <style type="text/css">
.bar {
    height: 18px;
    background: green;
}
</style> -->		
<style type="text/css">
.page-content {
	background-image: url(${contextPath}/resources/images/avatars/bg_1.gif);
	background-repeat: repeat;
	background-attachment: scroll;
}
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
						
						<!-- /.ace-settings-container -->
						<div class="row">
							<div class="col-sm-6">
								
								<h4 class="pink">
									<i class="ace-icon fa fa-bug green"></i>
									<a href="#modal-form" role="button" class="blue" data-toggle="modal"> Report a bug</a>
								</h4>
								
								<div class="profile-user-info profile-user-info-striped">
									<form:form id="product_summary_form" method="POST" modelAttribute="product" action="${contextPath}/authenticate/admin/registerProduct">
										<fieldset>
										<div class="profile-info-row">
											<div class="profile-info-name"> Product name </div>
		
											<div class="profile-info-value">
												<span class="editable" id="username">alexdoe1</span>
											</div>
										</div>
		
										<div class="profile-info-row">
											<div class="profile-info-name"> Project URL </div>
		
											<div class="profile-info-value">
												<i class="fa fa-github black bigger-110"></i>
												<span class="editable" type="email" name="email" id="email">Netherlands</span>
											</div>
										</div>
		
										<div class="profile-info-row">
											<div class="profile-info-name"> Age </div>
		
											<div class="profile-info-value">
												<span class="editable" id="age">38</span>
											</div>
										</div>
		
										<div class="profile-info-row">
											<div class="profile-info-name"> Joined </div>
		
											<div class="profile-info-value">
												<span class="editable" id="signup">2010/06/20</span>
											</div>
										</div>
		
										<div class="profile-info-row">
											<div class="profile-info-name"> Last Online </div>
		
											<div class="profile-info-value">
												<span class="editable" id="login">3 hours ago</span>
											</div>
										</div>
		
										<div class="profile-info-row">
											<div class="profile-info-name"> About Me </div>
		
											<div class="profile-info-value">
												<span class="editable" id="about">Editable as WYSIWYG</span>
											</div>
										</div>
										</fieldset>
									</form:form>
								</div>
							</div>
							<div class="col-sm-6 widget-container-col" id="widget-container-col-12">
							<div class="widget-box transparent" id="widget-box-12">
								<div class="widget-header">
									<h5 class="widget-title green lighter">Before you report a bug,</h5>

									<div class="widget-toolbar no-border">
										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
										<a href="#" data-action="close">
											<i class="ace-icon fa fa-times"></i>
										</a>
									</div>
								</div>

								<div class="widget-body">
									<div class="widget-main ">
											<blockquote class="">
												<p class="lighter line-height-125">
													<small>make sure to search for similar bugs using the form at the top of the page or our 
													<a href="#">advanced search page</a>. Also, read the instructions for 
													<a href="#">how to report a bug that someone will want to help fix</a>.
													If you aren't sure that what you're about to report is a bug, you should ask for help 
													using one of the means for support <a href="#">listed here</a>.
													Failure to follow these instructions may result in your bug simply being marked as "not a bug".
													</small>
												</p>
											</blockquote>
									</div>
								</div>
							</div>
						</div>
						</div>
						
						<!-- MAIN FORM  -->
						<div id="modal-form" class="modal" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
								<form:form id="forgot_form" method="POST" modelAttribute="project" action="${pageContext.request.contextPath}/auth/project/ceateProject">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="blue bigger">Add a new project</h4>
									</div>

									<div class="modal-body">
										<div class="row">
											<!-- form:start -->
												<div class="col-xs-12 col-sm-7">
													<div class="form-group">
														<label for="form-field-username">Project Name</label>
														<div>
															<form:input type="text" path="projectName" id="form-field-username" placeholder="Project Name" />
														</div>
													</div>
													<div class="space-4"></div>
													<div class="form-group">
														<label for="form-field-username">Project Description</label>
														<div>
															<form:textarea type="text" path="projectDescription" id="form-field-username" placeholder="Project Description" value="alexdoe"></form:textarea>
														</div>
													</div>
													<div class="space-4"></div>
												</div>
										</div>
									</div>

									<div class="modal-footer">
										<button class="btn btn-sm" data-dismiss="modal">
											<i class="ace-icon fa fa-times"></i>
											Cancel
										</button>

										<button class="btn btn-sm btn-primary" type="submit">
											<i class="ace-icon fa fa-check"></i>
											Save
										</button>
									</div>
								</form:form>
								</div>
							</div>
						</div>
						<!-- modal - create project -->
						
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								

								<div class="hr hr-18 hr-double dotted"></div>

									<!-- <div class="widget-header widget-header-blue widget-header-flat">
										<h4 class="widget-title lighter">New Item Wizard</h4>

										<div class="widget-toolbar">
											<label>
												<small class="green">
													<b>Validation</b>
												</small>

												<input id="skip-validation" type="checkbox" class="ace ace-switch ace-switch-4" />
												<span class="lbl middle"></span>
											</label>
										</div>
									</div> -->

									<!-- REPORT-BUG FORM -->
										<form class="form-horizontal message-form" role="form" id="bug-report-form" method="post" enctype="multipart/form-data" action="${contextPath}/filerUpload">
										<input type="hidden" id="_csrf" name="${_csrf.parameterName}"	value="${_csrf.token}" />
										<div class="form-group">
											<div class="row">
												<div class="col-sm-8">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="state">Project</label>
		
													<div class="col-xs-12 col-sm-9">
														<select id="project" name="project" class="select2" data-placeholder="Select a project">
															<option value="ABC" selected>ABC</option>
															<c:forEach var="project" items="${projectList}">
																<option value="${project.projectId}">${project.projectName}</option>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="col-sm-4 pull-right">
													<small class="text-muted blue">Select the name of the project for wich bug is to be reported.
													</small>
												</div>
											</div>
										</div>
										<div class="hr hr-dotted"></div>
										
										<div class="form-group">
											<div class="row">
												<div class="col-sm-8">
											<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="state">OS/Platform :</label>

											<div class="col-xs-12 col-sm-9">
												<select id="platform" name="platform" class="select2" data-placeholder="Choose OS...">
														<option value="">&nbsp;</option>
														<option value="ANY" selected>Any</option>
														<option value="LINUX">Linux</option>
														<option value="WINDOWS">Windows</option>
														<option value="MACOS">Mac OS</option>
														<option value="IOS">iOS</option>
														<option value="ANDROID">Android</option>
												</select>
											</div>
										</div>
												<div class="col-sm-4 pull-right">
													<small class="text-muted blue">Is this issue dependent of a operating system version.If yes provide the platform or else else unselected or select all.
													</small>
												</div>
											</div>
										</div>
										<div class="hr hr-dotted"></div>
										
										<!-- severity -->
										<div class="form-group">
											<div class="row">
												<div class="col-sm-8">
											<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="state">Severity :</label>

											<div class="col-xs-12 col-sm-9">
												<select id="severity" name="severity" class="select2" data-placeholder="Choose severity...">
													<option value="">&nbsp;</option>
													<option value="BLOCKER" selected>BLOCKER</option>
													<option value="CRITICAL">CRITICAL</option>
													<option value="MAJOR">MAJOR</option>
													<option value="NORMAL">NORMAL</option>
													<option value="MINOR">MINOR</option>
													<option value="TRIVIAL">TRIVIAL</option>
													<option value="ENHANCEMENT">ENHANCEMENT</option>
												</select>
											</div>
										</div>
												<div class="col-sm-4 pull-right">
													<small class="text-muted blue">What is the severity level of the bug?
													</small>
												</div>
											</div>
										</div>
										<div class="hr hr-dotted"></div>
										
										<!-- status -->
										<div class="form-group">
											<div class="row">
												<div class="col-sm-8">
											<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="state">Status :</label>

											<div class="col-xs-12 col-sm-9">
												<select id="status" name="status" class="select2" data-placeholder="Choose severity...">
													<option value="OPEN">OPEN</option>
													<option value="CLOSED" disabled="disabled">CLOSED</option>
													<option value="REOPEN" disabled="disabled">RE-OPEN</option>
													<option value="INPROGRESS" disabled="disabled">IN-PROGRESS</option>
													<option value="RESOLVED" disabled="disabled">RESOLVED</option>
													<option value="HOLD" disabled="disabled">HOLD</option>
													<option value="REQUIREDINFO" disabled="disabled">REQUIRED-INFO</option>
													<option value="LIMITATION" disabled="disabled">LIMITATION</option>
													<option value="VERIFIED" disabled="disabled">VERIFIED</option>
													<option value="ACCEPTED" disabled="disabled">ACCEPTED</option>
													<option value="FUNCTIONALDEVIATION" disabled="disabled">FUNCTIONAL-DEVIATION</option>
												</select>
											</div>
										</div>
												<div class="col-sm-4 pull-right">
													<small class="text-muted blue">What is the severity level of the bug?
													</small>
												</div>
											</div>
										</div>
										<div class="hr hr-dotted"></div>
										
										<div class="form-group">
											<div class="row">
												<div class="col-sm-8">
											<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="name">Version :</label>

											<div class="col-xs-12 col-sm-9">
												<div class="clearfix">
													<input type="text" id="version" name="version" class="col-xs-12 col-sm-5" />
												</div>
											</div>
										</div>
												<div class="col-sm-4 pull-right">
													<small class="text-muted blue">Version includes the current build version + majror release + minor release 
													</small>
												</div>
											</div>
										</div>
										<div class="hr hr-dotted"></div>
										
										<!-- Synopsis -->
										<div class="form-group">
											<div class="row">
												<div class="col-sm-8">
											<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="name">Synopsis :</label>

											<div class="col-xs-12 col-sm-9">
												<div class="clearfix">
													<input type="text" id="synopsis" name="synopsis" class="col-xs-12 col-sm-5" />
												</div>
											</div>
										</div>
												<div class="col-sm-4 pull-right">
													<small class="text-muted blue">Provide the initials for the bug as a title.
													</small>
												</div>
											</div>
										</div>
										<div class="hr hr-dotted"></div>
										
										<div class="form-group">
											<div class="row">
												<div class="col-sm-8">
													<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="comment">Description :</label>
													<div class="col-sm-8">
														<div class="widget-box widget-color-blue">
															<div class="widget-body">
																<div class="widget-main no-padding">
																	<textarea id="description" name="description" data-provide="markdown" data-iconlibrary="fa" rows="10">Markdown Editor</textarea>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-sm-4 pull-right">
													<small class="text-muted blue">Markdown uses a very simple formatting syntax to accomplish the same thing that HTML or Rich Text Formatting does. The difference is that it's simpler than HTML and you don't have to worry about opening and closing tags. It also doesn't have all of the menus associated with most text editing programs. To format text, Markdown uses punctuation and characters you're already familiar with.
														<br>For example, to create a header you use hashtags. So, "# HEADLINE" is a large header. "## HEADLINE" would be a little smaller, "### HEADLINE" would be smaller still.
														<br>Want to make a bulleted list? Just type in a "-" "+" or "*" before any item and the list is created automatically. No need to start it, end it, or deal with funky formatting.
														<br>To add emphasis, you can either use an asterisk (*really?*) for italics, or two asterisks for bold (**really!**).
														<br>Press <i class="ace-icon fa fa-expand"></i> icon to edit in full-screen view and press escape or <i class="ace-icon fa fa-compress"></i> to return.
													</small>
												</div>
											</div>
										</div>
										<div class="space-8"></div>
										<div class="hr hr-dotted"></div>
										<div class="space-8"></div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-8">
											<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="name">Assign To :</label>

											<div class="col-xs-12 col-sm-7">
												<div class="clearfix">
													<input type="text" id="assignto" name="assignto" class="col-xs-12 col-sm-5" style="width: auto;"/>
												</div>
											</div>
										</div>
												<div class="col-sm-4 pull-right">
													<small class="text-muted blue">
													Email address of the person or more to whom this bug would be assigned.
													</small>
												</div>
											</div>
										</div>
										<div class="space-8"></div>
										<div class="hr hr-dotted"></div>
										<div class="space-8"></div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-8">
											<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="name">CC To :</label>

											<div class="col-xs-12 col-sm-7">
												<div class="clearfix">
													<input type="text" id="ccto" name="ccto" class="col-xs-12 col-sm-5" style="width: auto;"/>
												</div>
											</div>
										</div>
												<div class="col-sm-4 pull-right">
													<small class="text-muted blue">
													Email address of the person or more to whom this bug would be sent as a carbon copy.
													</small>
												</div>
											</div>
										</div>
										<div class="hr hr-dotted"></div>
										
										<!-- Vulnerability -->
										<div class="form-group">
											<div class="row">
												<div class="col-sm-8">
											<label class="control-label col-xs-12 col-sm-3 no-padding-right">Does this bug report represent a security vulnerability?</label>

											<div class="col-xs-12 col-sm-9">
												<div>
													<label class="line-height-1 blue">
														<input name="securityvulnerability" value="true" type="radio" class="ace" />
														<span class="lbl"> Yes</span>
													</label>
												</div>

												<div>
													<label class="line-height-1 blue">
														<input name="securityvulnerability" value="false" type="radio" class="ace" />
														<span class="lbl"> No</span>
													</label>
												</div>
											</div>
										</div>
												<div class="col-sm-4 pull-right">
													<small class="text-muted blue">
													Is this bug causing any severe security issues ar breach and is harmful?
													</small>
												</div>
											</div>
										</div>
										</form>
										<!-- ATTACHEMENTS -->
								
								<!-- <div class="form-group">
									<div class="row">
										<div class="col-sm-8">
											<label
												class="control-label col-xs-12 col-sm-3 no-padding-right"
												for="name">Attachment :</label>

											<div class="col-sm-9">
										        <input id="attachmentData" type="file" name="attachmentData[]" multiple>
											</div>
										</div>
										<div class="col-sm-4 pull-right">
											<small class="text-muted blue">Provide the initials
												for the bug as a title. </small>
										</div>
									</div>
								</div> -->
								<!-- uploadForm -->
								
								<div class="space-8"></div>
								<div class="space-8"></div>
								<div class="space-8"></div>
								<div class="row">
									<div class="col-sm-8">
										<label class="control-label col-xs-8 col-sm-3 no-padding-right" >
											<h4 class="blue">
												<i class="ace-icon fa fa-file"></i>	
												<span class="lbl">Attachment :</span>
											</h4>
										</label>
										<form:form id="myFormUpload" modelAttribute="uploadForm" action="${contextPath}/myFormUpload" enctype="multipart/form-data">
											<div class="form-group">
												<div class="col-xs-8">
														<form:hidden path="bugId" id="bugId"/>
														<form:input multiple="multiple" type="file" path="myfile" id="id-input-file-3" />
												</div>
											</div>
										</form:form>
									</div>
								</div>
								
								<div class="hr hr-dotted"></div>
																		
										<!-- ACTIPN BUTTONS -->		
										<div class="form-group center">
											<button class="btn" type="reset">
												<i class="ace-icon fa fa-refresh"></i>
												Reset all
											</button>

											<button class="btn btn-success btn-next" data-last="Finish" type="submit" id="bugFireSbmt" onclick="">
												Fire
												<i class="ace-icon fa fa-send icon-on-right"></i>
											</button>
										</div>
									<!-- <!-- REPORT-BUG FORM:end -->

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
		<script src="${contextPath}/resources/js/wizard.min.js"></script>
		<script src="${contextPath}/resources/js/jquery.validate.min.js"></script>
		<script src="${contextPath}/resources/js/jquery-additional-methods.min.js"></script>
		<script src="${contextPath}/resources/js/bootbox.js"></script>
		<script src="${contextPath}/resources/js/jquery.maskedinput.min.js"></script>
		<script src="${contextPath}/resources/js/select2.min.js"></script>
		
		<!-- editable -->
		<script src="${contextPath}/resources/js/bootstrap-editable.min.js"></script>
		<script src="${contextPath}/resources/js/ace-editable.min.js"></script>
		<script src="${contextPath}/resources/js/bootstrap-wysiwyg.min.js"></script>
		
		<!-- ace scripts -->
		<script src="${contextPath}/resources/js/ace-elements.min.js"></script>
		<script src="${contextPath}/resources/js/ace.min.js"></script>
		
		<!-- wysiwyg -->
		<script src="${contextPath}/resources/js/markdown.min.js"></script>
		<script src="${contextPath}/resources/js/bootstrap-markdown.min.js"></script>
		
		<!-- tags -->
		<script src="${contextPath}/resources/js/bootstrap-tag.min.js"></script>
		<script src="${contextPath}/resources/js/autosize.min.js"></script>
		
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
				$('.bmblbnavstabs').removeClass('active');
				$('#reportBugByPManager').addClass('active');
				var attachments=[];
	 			/* $('#id-input-file-3').ace_file_input({
					style: 'well',
					btn_choose: 'Drop files here or click to choose',
					btn_change: null,
					no_icon: 'ace-icon fa fa-cloud-upload',
					droppable: true,
					thumbnail: 'small',
					whitelist:'gif|png|jpg|jpeg',
					blacklist:'exe|php|txt|json|pdf',
					before_change:function(files, dropped) {
						$.each( files, function( key, value ) {
							  console.log(key+"________");
							  var attachment={
									  attachmentId:null,
									  attachmentType:value['type'],
							          attachmentName:value['name'],
							          attachmentData:value
							  };
							  attachments.push(attachment);
							});
						return true;
					},
					preview_error : function(filename, error_code) {
						alert(filename+" : "+error_code);
					}
				}); */
				var attachmentcount = 0;
				$('#id-input-file-3').ace_file_input({
					style: 'well',
					btn_choose: 'Drop files here or click to choose',
					btn_change: null,
					no_icon: 'ace-icon fa fa-cloud-upload',
					droppable: true,
					thumbnail: 'small',
					whitelist:'gif|png|jpg|jpeg',
					blacklist:'exe|php|txt|json|pdf',
					before_change:function(files, dropped) {
						$.each( files, function( key, value ) {
							  attachments.push(value);
							  attachmentcount = key;
							});
						return true;
					},
					preview_error : function(filename, error_code) {
						alert(filename+" : "+error_code);
					}
				});
				
	 			$('#bugFireSbmt').click(function(e){
	 				$('#bug-report-form').submit();
	 			});
				
				$('[data-rel=tooltip]').tooltip();
			
				$('.select2').css('width','200px').select2({allowClear:true})
				.on('change', function(){
					$(this).closest('form').validate().element($(this));
				}); 
			
			
				var $validation = true;
				$('#fuelux-wizard-container')
				.ace_wizard({
					//step: 2 //optional argument. wizard will jump to step "2" at first
					//buttons: '.wizard-actions:eq(0)'
				})
				.on('actionclicked.fu.wizard' , function(e, info){
					if(info.step == 3 && $validation) {
						if(!$('#bug-report-form').valid()) e.preventDefault();
					}
				})
				//.on('changed.fu.wizard', function() {
				//})
				.on('finished.fu.wizard', function(e) {
					bootbox.dialog({
						message: "Thank you! Your information was successfully saved!", 
						buttons: {
							"success" : {
								"label" : "OK",
								"className" : "btn-sm btn-primary"
							}
						}
					});
				}).on('stepclick.fu.wizard', function(e){
					//e.preventDefault();//this will prevent clicking and selecting steps
				});
			
				$.mask.definitions['~']='[+-]';
				$('#phone').mask('(999) 999-9999');
			
				jQuery.validator.addMethod("phone", function (value, element) {
					return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
				}, "Enter a valid phone number.");
				
				
				
				jQuery.validator.addMethod("invalidemail", function (value, element) {
					var emailReg = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
					return this.optional(element) || emailReg.test(value);
				}, "Enter a valid emmail address.");
				
				
				$('#bug-report-form').submit(function(e){
					 e.preventDefault();
					 $('#bug-report-form').validate({
							errorElement: 'div',
							errorClass: 'help-block',
							focusInvalid: false,
							ignore: "",
							rules: {
								project: {
									required: true
								},
								status: {
									required: true
								},
								synopsis: {
									required: true,
									maxlength: 60
								},
								severity: {
									required: true
								},
								version: {
									required: true
								},
								platform: {
									required: true
								},
								securityvulnerability: {
									required: true
								},
								description: {
									required: true
								},
								assignto: {
									required: true
								},
								ccto: {
									required: true
								}
							},
							
							messages: {
								project: {
									required: "Please select the project."
								},
								status: {
									required: "Please provide current bug status."
								},
								synopsis: {
									required: "Please specify the bug title."
								},
								severity: "Please choose severity.",
								version: "Please specify bug reported in verion",
								platform: "Please choose OS Platform.",
								securityvulnerability: "Please select if vulnerable.",
								description: "Please specify the defect description.",
								assignto: {
										required :"Please specify atleast 1 assignee email address.",
									},
								ccto: "Please specify atleast 1 email address."
							},
					
					
							highlight: function (e) {
								$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
							},
					
							success: function (e) {
								$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
								$(e).remove();
							},
					
							errorPlacement: function (error, element) {
								if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
									var controls = element.closest('div[class*="col-"]');
									if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
									else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
								}
								else if(element.is('.select2')) {
									error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
								}
								else if(element.is('.chosen-select')) {
									error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
								}
								else error.insertAfter(element.parent());
							},
					
							submitHandler: function (form) {
								var context = "<%=request.getContextPath()%>";
								var formData = {		
										projectId : $("select#project option:checked").val(),
										synopsis : $("#synopsis").val(),
										severity : $("select#severity option:checked").val(),
										status:$("select#status option:checked").val(),
										version : $("#version").val(),
										platform : $("select#os option:checked").val(),
										securityVulnerability : $('input[name=securityvulnerability]:checked').val(),
										description :$("#description").data('markdown').parseContent(),
										assignto: $("#assignto").val().split(","),
										ccto :$("#ccto").val().split(",")
									};
								$.ajax({
									method : "POST",
									type : "POST",
									url : ''+context+"/filerUpload/"+attachmentcount+"?${_csrf.parameterName}=${_csrf.token}",
									data : JSON.stringify(formData),
// 									headers: {'Content-Type': 'multipart/mixed;boundary=gc0p4Jq0M2Yt08jU534c0p'},
// 								    cache:false,
// 								    processData:false,
// 								    contentType:false,
									contentType : 'application/json; charset=UTF-8',
									dataType : 'json',
									success : function(bugId) {
										if(bug== null){
											console.log('something went wrong.. try again');
										}
										console.log("\n--bug no :"+bugId+"---\n");
									},
									error : function(xhr) {
										console.log('something went wrong.. try again\n'+xhr);
										$.each( xhr, function( key, value ) {
											  console.log(key+" : "+value);
											});
									},
									success:(function(bugId){
										var context = "<%=request.getContextPath()%>";
// 										window.location=context+'/unauth/bug/show-bug?Id='+bug.bugId;
										$('#bugId').val(bugId);
										$('#myFormUpload').submit();
										  
									})
								});
								
								
							},
							invalidHandler: function (form) {
								//alert("in-valid");
							}
						});
					 
					 if($('#bug-report-form').valid()){
							//$.ajaxSetup({headers:{'X-CSRF-TOKEN': $("#_csrf").val()}}); 
							
							//read attachments
							/* $(document).on('change','#attachmentData',function () {
							  sendFile(this.files[0]);
							}); */
					 }else{
						e.preventDefault();
					 }
					 
				});
			
				
				
				
				$('#modal-wizard-container').ace_wizard();
				$('#modal-wizard .wizard-actions .btn[data-dismiss=modal]').removeAttr('disabled');
				
				$(document).one('ajaxloadstart.page', function(e) {
					//in ajax mode, remove remaining elements before leaving page
					$('[class*=select2]').remove();
				});
			})
		</script>
		<script type="text/javascript">
			jQuery(function($) {
				$.fn.editable.defaults.mode = 'inline';
				$.fn.editableform.loading = "<div class='editableform-loading'><i class='ace-icon fa fa-spinner fa-spin fa-2x light-blue'></i></div>";
			    $.fn.editableform.buttons = '<button type="submit" class="btn btn-info editable-submit"><i class="ace-icon fa fa-check"></i></button>'+
			                                '<button type="button" class="btn editable-cancel"><i class="ace-icon fa fa-times"></i></button>';    
				
			    $('#username')
				.editable({
					type: 'text',
					name: 'username'		
			    });
			    $('#myusername')
				.editable({
					type: 'text',
					name: 'myusername'		
			    });
			    $('#about').editable({
					mode: 'inline',
			        type: 'wysiwyg',
					name : 'about',
			
					wysiwyg : {
// 						css : {'max-width':'600px'}
					},
					success: function(response, newValue) {
					}
				});
			    
			 //tags
			 var context = "<%=request.getContextPath()%>";
			 var url=context+'/unauth/getAllEmailIds';
			 var tag_input_assignto = $('#assignto');
			 var tag_input_ccto = $('#ccto');
			 
				try{
					var tagElement = tag_input_assignto.tag(
					  {
						placeholder:tag_input_assignto.attr('placeholder'),
						source: function(query, process) {
							$.get(url).done(function (result_items) {
					      	process(result_items);
						 });
						},
						allowDuplicates:false
					  }
					);
					
					/*  $('#assignto').on('added', function (e, value) {
						var emailReg = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
			      		var isEmail = emailReg.test(value);
						if(!isEmail){
				      		var index = this.inValues(value);
				      		console.log(value+"("+index+") : "+isEmail);
				      		tagElement.siblings('.tag:eq(' + index + ')').remove();
				      		tagElement.trigger('removed', [value]);
						}
					});
					   
				   $('#assignto').on('removed', function (e, value) {
			      		console.log('removed trigerred...');
					}); */
					
					tag_input_ccto.tag(
							  {
								placeholder:tag_input_assignto.attr('placeholder'),
								source: function(query, process) {
									$.get(url).done(function (result_items) {
							      	process(result_items);
								 });
								}
								
							  }
							);
			
					var $tag_obj_assignto = $('#assignto').data('tag');
					$tag_obj_assignto.add('to.someone@email.com');
					
					var index = $tag_obj_assignto.inValues('some tag');
					$tag_obj_assignto.remove(index);
					
					var $tag_obj_ccto = $('#ccto').data('tag');
					$tag_obj_ccto.add('cc.someone@email.com');
					var index = $tag_obj_ccto.inValues('some tag');
					$tag_obj_ccto.remove(index);
					
					
				}
				catch(e) {
					//display a textarea for old IE, because it doesn't support this plugin or another one I tried!
					/* tag_input_assignto.after('<textarea id="'+tag_input_assignto.attr('id')+'" name="'+tag_input_assignto.attr('name')+'" rows="3">'+tag_input_assignto.val()+'</textarea>').remove();
					tag_input_ccto.after('<textarea id="'+tag_input_ccto.attr('id')+'" name="'+tag_input_ccto.attr('name')+'" rows="3">'+tag_input_ccto.val()+'</textarea>').remove();
					autosize($('#assignto'));
					autosize($('#ccto')); */
				}finally{
					$('div.tags').css( "width", "auto" );
				}
			    
			});
		</script>
	</body>
</html>
