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

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src="${contextPath}/resources/js/html5shiv.min.js"></script>
		<script src="${contextPath}/resources/js/respond.min.js"></script>
		<![endif]-->

<style type="text/css">
#main_content {
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
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->

							<!-- BUG DESCRIPTION -->
							<div class="row" id="bug_content">
								<div class="col-xs-12 col-sm-9">
									
									<div class="widget-box transparent">
										<div class="widget-header widget-header-bg">
											<h3 class="widget-title smaller">
												<i class="ace-icon fa fa-bug bigger-110"></i>
												<a
													href="${contextPath}/unauth/bug/show-bug?Id=${searchedBug.bugId}">
													<b><u>Bug#${searchedBug.bugId}</u></b> <span class="black">${searchedBug.synopsis}</span>
												</a> 
												<span class="widget-toolbar"> 
													<a href="#" data-action="reload">
														<i class="ace-icon fa fa-refresh"></i>
													</a>
												</span>
												<span class="widget-toolbar black">
												<small> 2017-02-22 17:34:07 IST</small></span> 

											</h3>
										</div>

										<div class="widget-body">

											<div class="widget-toolbox" id="widget-toolbox-1"
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
											</div>

											<div class="widget-main">
												
												<!-- Assigned to -->
												<span class="blue">Assigned To:</span><br>
												<c:forEach var="asgn" items="${searchedBug.assignto}">
													<span class="badge"><c:out value="${asgn}"/></span>
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
													<div class="attachment-title">
														<span class="blue bolder bigger-110">Attachments</span>
														&nbsp; <span class="grey">(2 files, 4.5 MB)</span>

														<div class="inline position-relative">
															<a href="#" data-toggle="dropdown"
																class="dropdown-toggle"> &nbsp; <i
																class="ace-icon fa fa-caret-down bigger-125 middle"></i>
															</a>

															<ul class="dropdown-menu dropdown-lighter">
																<li><a href="#">Download all as zip</a></li>

																<li><a href="#">Display in slideshow</a></li>
															</ul>
														</div>
													</div>

													&nbsp;
													<ul class="attachment-list pull-left list-unstyled">
														<li><a href="#" class="attached-file"> <i
																class="ace-icon fa fa-file-o bigger-110"></i> <span
																class="attached-name">Document1.pdf</span>
														</a> <span class="action-buttons"> <a href="#"> <i
																	class="ace-icon fa fa-download bigger-125 blue"></i>
															</a> <a href="#"> <i
																	class="ace-icon fa fa-trash-o bigger-125 red"></i>
															</a>
														</span></li>

														<li><a href="#" class="attached-file"> <i
																class="ace-icon fa fa-film bigger-110"></i> <span
																class="attached-name">Sample.mp4</span>
														</a> <span class="action-buttons"> <a href="#"> <i
																	class="ace-icon fa fa-download bigger-125 blue"></i>
															</a>
														</span></li>
													</ul>

													<div class="attachment-images pull-right">
														<div class="vspace-4-sm"></div>

														<div>
															<img width="36" alt="image 4"
																src="${contextPath}/resources/images/gallery/thumb-4.jpg" />
															<img width="36" alt="image 3"
																src="${contextPath}/resources/images/gallery/thumb-3.jpg" />
															<img width="36" alt="image 2"
																src="${contextPath}/resources/images/gallery/thumb-2.jpg" />
															<img width="36" alt="image 1"
																src="${contextPath}/resources/images/gallery/thumb-1.jpg" />
														</div>
													</div>
												</div>

												<br/><br/><br/><br/><br/>
												<!-- comments................ -->
												<div class="hr hr-18 hr-double bold"></div>
												
												<!-- TIMELINE-2 -->
												<div class="row">
													<div class="col-xs-12 col-sm-8">
														<div class="widget-box transparent">
															<div class="widget-header widget-header-small">
																<h5 class="widget-title smaller">
																	<a href="#" class="blue">Yayati</a>
																	<!--<span class="grey">reviewed a product</span> -->
																</h5>

																<span class="widget-toolbar"> <a href="#"
																	data-action="collapse"> <i
																		class="ace-icon fa fa-chevron-up"></i>
																</a>
																</span> <span class="widget-toolbar no-border">
																	2017-02-22 17:34:07 IST </span>
															</div>

															<div class="widget-body"
																style="background-color: #dcdcdc99;">
																<div class="widget-main">
																	<p>Build: 1.1.9</p>

																	<p>Store: 100 Reg: 1</p>

																	<p>Actual: User is landed directly on to Manually
																		authorize the Check screen. &quot;To manually
																		authorize the Check, call 1-800- CREDITCARD&quot;
																		message is displayed.</p>

																	<p>
																		Expected: The tender authorization process is
																		currently offline screen should be displayed where
																		user can select Manual button to authorize manually.<br />&quot;To
																		manually authorize the Check, call 1-800- CHECK&quot;
																		message should be displayed.
																	</p>

																	<p>Please find the attached screen shots from ABC
																		V15 , Base V15 and Xstore log.</p>
																	<div class="space-6"></div>
																</div>
															</div>
														</div>
														&nbsp;

														<!-- COMMENT 2 -->
														<div class="widget-box transparent">
															<div class="widget-header widget-header-small">
																<h3 class="widget-title smaller">
																	<a href="#" class="blue">Ashutosh</a>
																	<!--<span class="grey">reviewed a product</span> -->
																</h3>

																<span class="widget-toolbar"> <a href="#"
																	data-action="collapse"> <i
																		class="ace-icon fa fa-chevron-up"></i>
																</a>
																</span> <span class="widget-toolbar no-border">
																	2017-02-22 18:02:07 IST </span>
															</div>

															<div class="widget-body"
																style="background-color: #dcdcdc99;">
																<div class="widget-main">
																	<p>Basic useful feature list:</p>

																	<ul>
																		<li>Ctrl+S / Cmd+S to save the file</li>
																		<li>Ctrl+Shift+S / Cmd+Shift+S to choose to save
																			as Markdown or HTML</li>
																		<li>Drag and drop a file into here to load it</li>
																		<li>File contents are saved in the URL so you can
																			share files</li>
																	</ul>

																	<p>I&#39;m no good at writing sample / filler text,
																		so go write something yourself.</p>

																	<p>Look, a list!</p>

																	<p>
																		<code>javascript $(function(){
																			$(&#39;div&#39;).html(&#39;I am a div.&#39;); }); </code>
																	</p>

																	<p>
																		This is <a
																			href="https://github.com/jbt/markdown-editor">on
																			GitHub</a> so let me know if I&#39;ve b0rked it
																		somewhere.
																	</p>

																	<h5>Stuff used to make this:</h5>

																	<ul>
																		<li><a
																			href="https://github.com/markdown-it/markdown-it">markdown-it</a>
																			for Markdown parsing</li>
																		<li><a href="http://codemirror.net/">CodeMirror</a>
																			for the awesome syntax-highlighted editor</li>
																		<li><a
																			href="http://softwaremaniacs.org/soft/highlight/en/">highlight.js</a>
																			for syntax highlighting in output code blocks</li>
																		<li><a
																			href="https://github.com/dankogai/js-deflate">js-deflate</a>
																			for gzipping of data to make it fit in URLs</li>
																	</ul>
																	<div class="space-6"></div>
																	<div class="message-attachment clearfix">
													<div class="attachment-title">
														<span class="blue bolder bigger-110">Attachments</span>
														&nbsp; <span class="grey">(2 files, 4.5 MB)</span>

														<div class="inline position-relative">
															<a href="#" data-toggle="dropdown"
																class="dropdown-toggle"> &nbsp; <i
																class="ace-icon fa fa-caret-down bigger-125 middle"></i>
															</a>

															<ul class="dropdown-menu dropdown-lighter">
																<li><a href="#">Download all as zip</a></li>

																<li><a href="#">Display in slideshow</a></li>
															</ul>
														</div>
													</div>

													&nbsp;
													<ul class="attachment-list pull-left list-unstyled">
														<li><a href="#" class="attached-file"> <i
																class="ace-icon fa fa-file-o bigger-110"></i> <span
																class="attached-name">Xstore config doc.pdf</span>
														</a> <span class="action-buttons"> <a href="#"> <i
																	class="ace-icon fa fa-download bigger-125 blue"></i>
															</a> <a href="#"> <i
																	class="ace-icon fa fa-trash-o bigger-125 red"></i>
															</a>
														</span></li>

														<li><a href="#" class="attached-file"> <i
																class="ace-icon fa fa-film bigger-110"></i> <span
																class="attached-name">xstore-log.txt</span>
														</a> <span class="action-buttons"> <a href="#"> <i
																	class="ace-icon fa fa-download bigger-125 blue"></i>
															</a> <a href="#"> <i
																	class="ace-icon fa fa-trash-o bigger-125 red"></i>
															</a>
														</span></li>
													</ul>

													<div class="attachment-images pull-right">
														<div class="vspace-4-sm"></div>

														<div>
															<img width="36" alt="image 4"
																src="${contextPath}/resources/images/avatars/avatar.png" />
															<img width="36" alt="image 3"
																src="${contextPath}/resources/images/avatars/avatar1.png" />
															<img width="36" alt="image 2"
																src="${contextPath}/resources/images/avatars/avatar3.png" />
															<img width="36" alt="image 1"
																src="${contextPath}/resources/images/avatars/avatar4.png" />
														</div>
													</div>
												</div>
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

	<script type="text/javascript">
		jQuery(function($) {

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

</body>

</html>
