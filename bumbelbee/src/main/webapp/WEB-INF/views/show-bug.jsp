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
<title>Form Wizard - BumbelBee</title>

<meta name="description" content="and Validation" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${contextPath}/resources/font-awesome/4.5.0/css/font-awesome.min.css" />

<!-- page specific plugin styles -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/select2.min.css" />

<!-- text fonts -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/fonts.googleapis.com.css" />

<!-- ace styles -->
<link rel="stylesheet" href="${contextPath}/resources/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="${contextPath}/resources/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
<link rel="stylesheet"
	href="${contextPath}/resources/css/ace-skins.min.css" />
<link rel="stylesheet"
	href="${contextPath}/resources/css/ace-rtl.min.css" />

<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${contextPath}/resources/css/ace-ie.min.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- editable -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/bootstrap-editable.min.css" />

<!-- ace settings handler -->
<script src="${contextPath}/resources/js/ace-extra.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/jquery.gritter.min.css" />
<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src="${contextPath}/resources/js/html5shiv.min.js"></script>
		<script src="${contextPath}/resources/js/respond.min.js"></script>
		<![endif]-->

<style type="text/css">
.page-content {
	background-image: url(${contextPath}/resources/images/avatars/bg_1.gif);
	background-repeat: repeat;
	background-attachment: scroll;
}
</style>

</head>

<body class="no-skin">
	<jsp:include page="contents/navbar-topmenu.jsp" />

	<div class="main-container ace-save-state" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.loadState('main-container')
			} catch (e) {
			}
		</script>

		<jsp:include page="contents/sidebar-topmenu.jsp" />

		<div class="main-content">
			<div class="main-content-inner">


				<div class="page-content" id="main_content">
				
				<div class="ace-settings-container" id="ace-settings-container">
							<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
								<i class="ace-icon fa fa-cog bigger-130"></i>
							</div>

							<div class="ace-settings-box clearfix" id="ace-settings-box">
								<div class="pull-left width-50">
									<div class="ace-settings-item">
										<div class="pull-left">
											<select id="skin-colorpicker" class="hide">
												<option data-skin="no-skin" value="#438EB9">#438EB9</option>
												<option data-skin="skin-1" value="#222A2D">#222A2D</option>
												<option data-skin="skin-2" value="#C6487E">#C6487E</option>
												<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
											</select>
										</div>
										<span>&nbsp; Choose Skin</span>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar" autocomplete="off" />
										<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar" autocomplete="off" />
										<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-breadcrumbs" autocomplete="off" />
										<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" autocomplete="off" />
										<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-add-container" autocomplete="off" />
										<label class="lbl" for="ace-settings-add-container">
											Inside
											<b>.container</b>
										</label>
									</div>
								</div><!-- /.pull-left -->

								<div class="pull-left width-50">
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" autocomplete="off" />
										<label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" autocomplete="off" />
										<label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" autocomplete="off" />
										<label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
									</div>
								</div><!-- /.pull-left -->
							</div><!-- /.ace-settings-box -->
						</div>
				
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->

							<!-- BUG DESCRIPTION -->
							<div class="row" id="bug_content">
								<div class="col-xs-12 col-sm-9">
									
									<div class="widget-box transparent">
										<div class="widget-header widget-header-bg">
											<h3 class="widget-title smaller">
												
												<a
													href="${contextPath}/unauth/bug/show-bug?Id=${searchedBug.bugId}">
													<span class="black">${searchedBug.synopsis}</span>
												</a> 
												<span class="widget-toolbar"> 
														<h4><span class="editable" id="bugStatus" bugid="${searchedBug.bugId}" currentstatus="${searchedBug.status}">${searchedBug.status}</span></h4>											
												</span>
												<span class="widget-toolbar black">
													<h4><a href="${contextPath}/unauth/bug/show-bug?Id=${searchedBug.bugId}"><b>#${searchedBug.bugId}</b></a></h4>
												</span> 

											</h3>
										</div>

										<div class="widget-body">

											<!-- <div class="widget-toolbox" id="widget-toolbox-1"
												style="background: none; border: none;">
												<div class="btn-toolbar">
													<div class="btn-group">
														<button class="btn btn-sm btn-success btn-white btn-round">
															<i class="ace-icon fa fa-check bigger-110 green"></i>
															Approve
														</button>

														<button class="btn btn-sm btn-danger btn-white btn-round">
															<i class="ace-icon fa fa-times bigger-110 red2"></i>
															Reject
														</button>
													</div>

													<div data-toggle="buttons" class="btn-group">
														<label class="btn btn-sm btn-default btn-white btn-round">
															<i class="icon-only ace-icon fa fa-bold bigger-110"></i>

															<input type="checkbox" value="1" />
														</label> <label class="btn btn-sm btn-default btn-white btn-round">
															<i class="icon-only ace-icon fa fa-italic bigger-110"></i>

															<input type="checkbox" value="2" />
														</label>
													</div>

													<div data-toggle="buttons" class="btn-group">
														<label class="btn btn-sm btn-primary btn-white btn-round">
															<i class="icon-only ace-icon fa fa-align-left bigger-110"></i>

															<input type="radio" value="1" />
														</label> <label class="btn btn-sm btn-primary btn-white btn-round">
															<i
															class="icon-only ace-icon fa fa-align-center bigger-110"></i>

															<input type="radio" value="2" />
														</label> <label class="btn btn-sm btn-primary btn-white btn-round">
															<i
															class="icon-only ace-icon fa fa-align-right bigger-110"></i>

															<input type="radio" value="3" />
														</label>
													</div>
												</div>
											</div> -->

											<div class="widget-main">
												
												<!-- Assigned to -->
												<span class="blue">Assigned To:</span><br>
												<c:forEach var="asgn" items="${searchedBug.assignto}">
													<span class="badge"><c:out value="${asgn}"/></span>
												</c:forEach>
												<br>
												<span class="blue">Cced To:</span><br>
												<c:forEach var="ccto" items="${searchedBug.ccto}">
													<span class="badge"><c:out value="${ccto}"/></span>
												</c:forEach>
												
												<br><br><br>
												
												<!-- DESCRIPTION-BODY -->
												<p>${searchedBug.description}</p>
												
												<!-- BUG-ATTRIBUTES -->
												<!-- <div class="widget-toolbox" id="widget-toolbox-1"
													style="background: none; border: none;">
													<div class="btn-toolbar">
														<div class="btn-group">
															<button
																class="btn btn-sm btn-success btn-white btn-round">
																<i class="ace-icon fa fa-check bigger-110 green"></i>
																Approve
															</button>

															<button class="btn btn-sm btn-danger btn-white btn-round">
																<i class="ace-icon fa fa-times bigger-110 red2"></i>
																Reject
															</button>
														</div>

														<div data-toggle="buttons" class="btn-group">
															<label class="btn btn-sm btn-default btn-white btn-round">
																<i class="icon-only ace-icon fa fa-bold bigger-110"></i>

																<input type="checkbox" value="1" />
															</label> <label
																class="btn btn-sm btn-default btn-white btn-round">
																<i class="icon-only ace-icon fa fa-italic bigger-110"></i>

																<input type="checkbox" value="2" />
															</label>
														</div>

														<div data-toggle="buttons" class="btn-group">
															<label class="btn btn-sm btn-primary btn-white btn-round">
																<i
																class="icon-only ace-icon fa fa-align-left bigger-110"></i>

																<input type="radio" value="1" />
															</label> <label
																class="btn btn-sm btn-primary btn-white btn-round">
																<i
																class="icon-only ace-icon fa fa-align-center bigger-110"></i>

																<input type="radio" value="2" />
															</label> <label
																class="btn btn-sm btn-primary btn-white btn-round">
																<i
																class="icon-only ace-icon fa fa-align-right bigger-110"></i>

																<input type="radio" value="3" />
															</label>
														</div>
													</div>
												</div> -->
												<!-- BUG-ATTRIBUTES:END -->

												<!-- Attachments -->
												<div class="message-attachment clearfix">
													&nbsp;
													<ul class="attachment-list pull-left list-unstyled">
														<c:forEach items="${attachmentList}" var="attachment">
															<li>
																<a href="${contextPath}/unauth/bug/download/attachment/${attachment.key}" class="attached-file"> 
																	<i class="ace-icon fa fa-paperclip bigger-110"></i> 
																	<span class="attached-name">${attachment.value}</span>
																</a> 
																<span class="action-buttons">
																	 <a href="${contextPath}/unauth/bug/download/attachment/${attachment.key}"> 
																	 	<i class="ace-icon fa fa-download bigger-125 gray"></i>
																	</a>
																</span>
															</li>
														</c:forEach>
													</ul>
													
												</div>

												<br/><br/><br/><br/><br/>
												<!-- comments................ -->
												<div class="hr hr-18 hr-double bold"></div>
												
												<!-- TIMELINE-2 -->
												<div class="row">
													<div class="col-xs-12 col-sm-8">
														
														&nbsp;

														<!-- COMMENTS -->
														<c:forEach var="comment" items="${commentList}">
															<div class="widget-box transparent">
																<div class="widget-header widget-header-small">
																	<h5 class="widget-title smaller">
																		<a href="#" class="blue">${comment.commentedBy}</a>
																		<!--<span class="grey">reviewed a product</span> -->
																	</h5>

																	<span class="widget-toolbar"> <a href="#"
																		data-action="collapse"> <i
																			class="ace-icon fa fa-chevron-up"></i>
																	</a>
																	</span> <span class="widget-toolbar no-border">
																		${comment.createDate} </span>
																</div>

																<div class="widget-body"
																	style="background-color: #dcdcdc99;">
																	<div class="widget-main">
																		${comment.description}
																		<div class="space-6"></div>
																		<div class="message-attachment clearfix">
																			&nbsp;
																			<ul class="attachment-list pull-left list-unstyled">
																				<c:forEach items="${comment.attachments}" var="cmtattachment">
																					<c:if test="${cmtattachment.attachmentName != ''}">
																						<li>
																							<a href="${contextPath}/unauth/bug/download/attachment/${cmtattachment.attachmentId}" class="attached-file">
																								 <i class="ace-icon fa fa-paperclip bigger-110"></i> 
																								 <span class="attached-name">${cmtattachment.attachmentName}</span>
																							</a> 
																							<span class="action-buttons"> 
																								<a href="${contextPath}/unauth/bug/download/attachment/${attachment.attachmentId}">
																										<i class="ace-icon fa fa-download bigger-125 gray"></i>
																								</a>
																							</span>
																						</li>																					
																					</c:if>
																				</c:forEach>
																			</ul>
																		</div>
																	</div>
																</div>
															</div>
														</c:forEach>



														<!-- COMMENT NEW -->
														<div class="space-6"></div>
														<div class="space-6"></div>
														<div class="widget-box transparent">
															<div class="widget-header widget-header-small">
																<h5 class="widget-title smaller">
																	<a href="#" class="blue">Add comment :</a>
																</h5>

																<span class="widget-toolbar"> <a href="#"
																	data-action="collapse"> <i
																		class="ace-icon fa fa-chevron-up"></i>
																</a>
																</span>
															</div>

															<div class="widget-body"
																style="background-color: #dcdcdc99;">
																<div class="widget-main">
																	<textarea id="commentdescription" name="commentdescription" data-provide="markdown" data-iconlibrary="fa" rows="10" placeholder="Enter your comments..."></textarea>
																	<form:form id="bugcommentform" modelAttribute="commentForm" action="${contextPath}/unauth/bug/postcomment/${searchedBug.bugId}" enctype="multipart/form-data">
																		<div class="form-group">
																				<form:hidden path="description" id="description" />
																				<form:input multiple="multiple" type="file" path="myfile" id="id-input-file-3" />
																				<button class="btn btn-success btn-sm" type="submit" id="bugcommentsbmt">
																					Post
																					<i class="ace-icon fa fa-send icon-on-right"></i>
																				</button>
																		</div>
																	</form:form>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!-- TIMELINE-2 :END-->

											</div>
										</div>


									</div>
								</div>


							</div>


							<!-- TIMELINE -->


							<!-- PAGE CONTENT ENDS -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<jsp:include page="contents/footer.jsp" />

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<!--[if !IE]> -->
	<script src="${contextPath}/resources/js/jquery-2.1.4.min.js"></script>

	<!-- <![endif]-->

	<!--[if IE]>
<script src="${contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<![endif]-->
	<script type="text/javascript">
		if ('ontouchstart' in document.documentElement)
			document
					.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
							+ "<"+"/script>");
	</script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

	<!-- page specific plugin scripts -->
	<script src="${contextPath}/resources/js/wizard.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.validate.min.js"></script>
	<script
		src="${contextPath}/resources/js/jquery-additional-methods.min.js"></script>
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

	<script src="${contextPath}/resources/js/tree.min.js"></script>
	<script src="${contextPath}/resources/js/select2.min.js"></script>
	<script src="${contextPath}/resources/js/jquery-ui.custom.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.ui.touch-punch.min.js"></script>
	<script src="${contextPath}/resources/js/holder.min.js"></script>
	
	<script src="${contextPath}/resources/js/jquery.gritter.min.js"></script>

	<script type="text/javascript">
		jQuery(function($) {
			$('.bmblbnavstabs').removeClass('active');
			$('#show-bug').addClass('active');
			
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
					return true;
				},
				preview_error : function(filename, error_code) {
					alert(filename+" : "+error_code);
				}
			});
			
			//data for tree element
			var category = {

				'vehicles' : {
					text : 'Micros : Point of sale',
					type : 'item'
				},
				'rentals' : {
					text : 'Micros : Support',
					type : 'item'
				},
				'component' : {
					text : 'Component',
					type : 'folder'
				},
				'status' : {
					text : 'Status',
					type : 'folder'
				}
			}
			category['component']['additionalParameters'] = {
				'children' : {
					'appliances' : {
						text : 'Config',
						type : 'item'
					},
					'arts-crafts' : {
						text : 'Image',
						type : 'item'
					},
					'clothing' : {
						text : 'Locate',
						type : 'item'
					},
					'computers' : {
						text : 'Payment',
						type : 'item'
					},
					'jewelry' : {
						text : 'Relate',
						type : 'item'
					},
					'office-business' : {
						text : 'Xstore',
						type : 'item'
					},
					'sports-fitness' : {
						text : 'XAdmin',
						type : 'item'
					}
				}
			}

			category['status']['additionalParameters'] = {
				'children' : {
					'unconfirmed' : {
						text : 'UN-CONFIRMED',
						type : 'item'
					},
					'inprogress' : {
						text : 'IN-PROGRESS',
						type : 'item'
					},
					'open' : {
						text : 'OPEN',
						type : 'item'
					},
					'resolved' : {
						text : 'RESOLVED',
						type : 'item'
					},
					'verified' : {
						text : 'VERIFIED',
						type : 'item'
					},
					'reopen' : {
						text : 'RE-OPEN',
						type : 'item'
					},
					'srraised' : {
						text : 'SR-RAISED',
						type : 'item'
					},
					'closed' : {
						text : 'CLOSED',
						type : 'item'
					},
					'limitation' : {
						text : 'Limitation',
						type : 'item'
					},
					'funtionaldeviation' : {
						text : 'Functional Deviation',
						type : 'item'
					},
					'requiredinfo' : {
						text : 'Required-Info',
						type : 'item'
					}
				}
			}

			var dataSource1 = function(options, callback) {
				var $data = null
				if (!("text" in options) && !("type" in options)) {
					$data = category;//the root tree
					callback({
						data : $data
					});
					return;
				} else if ("type" in options && options.type == "folder") {
					if ("additionalParameters" in options
							&& "children" in options.additionalParameters)
						$data = options.additionalParameters.children || {};
					else
						$data = {}//no data
				}

				callback({
					data : $data
				})
			}

			$('#cat-tree')
					.ace_tree(
							{
								dataSource : dataSource1,
								multiSelect : true,
								cacheItems : true,
								'open-icon' : 'ace-icon tree-minus',
								'close-icon' : 'ace-icon tree-plus',
								'itemSelect' : true,
								'folderSelect' : false,
								'selected-icon' : 'ace-icon fa fa-check',
								'unselected-icon' : 'ace-icon fa fa-times',
								loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>'
							});

			$('.tree-container').ace_scroll({
				size : 250,
				mouseWheelLock : true
			});
			$('#cat-tree').on(
					'closed.fu.tree disclosedFolder.fu.tree',
					function() {
						$('.tree-container').ace_scroll('reset').ace_scroll(
								'start');
					});

			//select2 location element
			$('.select2').css('min-width', '150px').select2({
				allowClear : true
			});

			//jQuery ui distance slider
			$("#slider-range")
					.css('width', '150px')
					.slider(
							{
								range : true,
								min : 0,
								max : 100,
								values : [ 17, 67 ],
								slide : function(event, ui) {
									var val = ui.values[$(ui.handle).index() - 1]
											+ "";

									if (!ui.handle.firstChild) {
										$(
												"<div class='tooltip bottom in' style='display:none;left:-6px;top:14px;'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>")
												.prependTo(ui.handle);
									}
									$(ui.handle.firstChild).show().children()
											.eq(1).text(val);
								}
							}).find('span.ui-slider-handle').on('blur',
							function() {
								$(this.firstChild).hide();
							});

			//this is for demo only
			$('.thumbnail').on('mouseenter', function() {
				$(this).find('.info-label').addClass('label-primary');
			}).on('mouseleave', function() {
				$(this).find('.info-label').removeClass('label-primary');
			});

			//toggle display format buttons
			$('#toggle-result-format .btn').tooltip({
				container : 'body'
			}).on(
					'click',
					function(e) {
						$(this).siblings().each(
								function() {
									$(this).removeClass(
											$(this).attr('data-class'))
											.addClass('btn-grey');
								});
						$(this).removeClass('btn-grey').addClass(
								$(this).attr('data-class'));
					});

			////////////////////
			//show different search page
			$('#toggle-result-page .btn').on('click', function(e) {
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				$('.search-page').parent().addClass('hide');
				$('#search-page-' + which).parent().removeClass('hide');
			});
		});
	</script>

	<script type="text/javascript">
		jQuery(function($) {
			
			$('#bugcommentsbmt').click(function(e){
				$(this).attr('disabled','disabled');
				e.preventDefault();
				var desc = $("#commentdescription").data('markdown').parseContent();
				console.log(desc);
				$("#description").val(desc);
				$('#bugcommentform').submit();
			});
		});
	</script>
	<script type="text/javascript">
		jQuery(function($) {
			
			var statusall = [];
		    $.each({ 
		    		"OPEN": "OPEN", 
		    		"CLOSED": "CLOSED", 
		    		"REOPEN": "REOPEN", 
		    		"INPROGRESS": "IN-PROGRESS", 
		    		"RESOLVED": "RESOLVED",
		    		"HOLD": "HOLD",
		    		"REQUIREDINFO": "REQUIRED-INFO",
		    		"LIMITATION": "LIMITATION",
		    		"VERIFIED": "VERIFIED",
		    		"ACCEPTED": "ACCEPTED",
		    		"RESOLVED": "RESOLVED",
		    		"FUNCTIONALDEVIATION": "FUNCTIONAL-DEVIATION",
		    		}, 
		    	function(k, v) {
		    		statusall.push({id: k, text: v});
		    });
		    
			var currentValue = "OPEN";
		    var bugid = $('#bugStatus').attr('bugid');
		    var currentstatus = $('#bugStatus').attr('currentstatus');
			$('#bugStatus').editable({
				type: 'select2',
				value : 'OPEN',
				//onblur:'ignore',
		        source: statusall,
				select2: {
					'width': 200
				},		
				success: function(response, newstatus) {
					if(currentValue == newstatus) return;
					currentValue = newstatus;
					 var context = "<%=request.getContextPath()%>";
					 var url=context+'/unauth/bug/update/status/'+bugid+'/'+currentstatus+'/'+newstatus+'?${_csrf.parameterName}=${_csrf.token}';
					$.post(url).done(function (result) {
				      	if(result=='SUCCESS'){
					      	$.gritter.add({
								title : '<i class="ace-icon fa fa-check green"> Status updated successful!</i> ',
								text : '<a href="#" class="blue"><u>Bug#'+bugid+'</u></a>  changed to <b>'+newstatus+'</b>',
								sticky : true,
								class_name : 'gritter-light'
							});				      		
				      	}else if(result=='COLLISION'){
				      		$.gritter.add({
								title: '<i class="ace-icon fa fa-exclamation-triangle bigger-120"></i> Mid air collision!',
								text: 'Your changes can not be saved.Mid air collision detected.Try refresing the page.<br><u><a href="#" class="white">Read more..</a></u>',
								sticky: true,
								class_name: 'gritter-warning'
							});
				      	}else if(result=='ERROR'){
				      		$.gritter.add({
								title: '<i class="ace-icon fa fa-exclamation-triangle bigger-120"></i> Something went wrong!',
								text: 'There seems to be problem updating status of <a href="#" class="blue">#'+bugid+'. Please try again',
								sticky: true,
								class_name: 'gritter-error gritter-light'
							});
				      	} 

					 });
				}
		    });
			
		});
	</script>
</body>

</html>
