<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Home</title>
<link rel="stylesheet" href="resources/css/landing.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<!------ Include the above in your HEAD tag ---------->


<script>
	$(window).on('scroll', function() {
		var wscroll = $(this).scrollTop();
		if (wscroll > 10) {
			$(".navbar").addClass("shrink-nav");
		} else {
			$(".navbar").removeClass("shrink-nav");
		}
	});
</script>

<script>
	$(document).ready(function() {
		$("#MyModal").modal();
	});
</script>
<script>
	$(document).ready(function() {
		$("#mytable #checkall").click(function() {
			if ($("#mytable #checkall").is(':checked')) {
				$("#mytable input[type=checkbox]").each(function() {
					$(this).prop("checked", true);
				});

			} else {
				$("#mytable input[type=checkbox]").each(function() {
					$(this).prop("checked", false);
				});
			}
		});

		$("[data-toggle=tooltip]").tooltip();
	});
</script>


</head>
<body>

	<h2></h2>

	<!--Navigation bar-->
	<div id="nav-placeholder"></div>

	<script>
		$(function() {
			$("#nav-placeholder").load("navpatient");
		});
	</script>
	<!--end of Navigation bar-->

	<!-- ============= banner ============= -->
	<div id="home" class="banner"
		style="background-image: url(resources/images/patient.jpg);">
		<div class="overlay"></div>
		<div class="banner-content">
			<div class="container">
				<div class="row">
					<div class="col-md-10  text-center">
						<div class="col-md-6">
							<br>
							<br>
							<br>
							<div class="btn-group-vertical">

								<button type="button" class="btn btn-primary page-scroll"
									data-toggle="modal" data-target="#addsample">Add
									Sample</button>
								<button type="button" class="btn btn-primary page-scroll"
									data-toggle="modal" data-target="#viewsample">Add
									Tests</button>
								<button type="button" class="btn btn-primary page-scroll"
									data-toggle="modal" data-target="#onlyviewsample">View
									MY Samples And reports</button>
								<p>${error1}</p>
							</div>


						</div>
						<div class="col-md-6">
							<div class="container">
								<div class="row">
									<div class="col-xs-12 col-sm-6 col-md-6">
										<div class="well well-sm" style="background-color: #000">
											<div class="row">
												<div class="col-sm-6 col-md-4">
													<img src="https://i.ibb.co/zV1DnZL/profile.png" alt=""
														class="img-rounded img-responsive" />
												</div>
												<div class="col-sm-6 col-md-8">
													<h2 class="text-muted">My Profile</h2>
													<h4 class="text-info">${patient.name }</h4>
													<small><cite
														title="${patient.t_district },
															${patient.t_state } ">${patient.t_district },
															${patient.t_state } <i
															class="glyphicon glyphicon-map-marker"> </i>
													</cite></small>
													<p>
														<i class="glyphicon glyphicon-asterisk"></i>${patient.sex }
														<br /> <i class="glyphicon glyphicon-gift"></i>${patient.DOB }
													</p>
													<!-- Split button -->
													<div class="btn-group">
														<a href="edit/${technician.t_ID }">
															
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>



		<!-- Add Sample modal -->
		<div class="container">
			<div class="row">


				<div class="col-md-6">

					<div class="modal fade" id="addsample" tabindex="-1" role="dialog"
						aria-labelledby="myLargeModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="false">&times;</span>
								</button>
								<div class="col-md-10 col-md-offset-1 text-center">
									<table class="table table-striped">
										<tbody>
											<tr>
												<td colspan="12">
													<form class="well form-horizontal"
														action="processPatientSample/${patient.p_ID }"
														method="post">
														<fieldset>

															<div class="form-group">
																<label class="col-md-4 control-label">Patient ID</label>
																<div class="col-md-8 inputGroupContainer">
																	${patient.p_ID }</div>
															</div>
															<div class="form-group">
																<label class="col-md-4 control-label">Hospital
																	OP/IP Number</label>
																<div class="col-md-8 inputGroupContainer">
																	${patient.hospitalOPNumber }</div>
															</div>
															<div class="form-group">
																<label class="col-md-4 control-label">Permanent
																	Address Pincode</label>
																<div class="col-md-8 inputGroupContainer">

																	<label for="sel1">Select sample from list:</label>
																	<div class="input-group">
																		<span class="input-group-addon"><i
																			class="glyphicon glyphicon-plus"></i></span> <select
																			class="form-control" name="sel1">
																			<option value="BLOOD">BLOOD</option>
																			<option value="NASALSWAB">NASALSWAB</option>
																			<option value="STOOL">STOOL</option>

																		</select>
																	</div>
																</div>
															</div>


															<div class="form-group center">
																<div class="col-sm-offset-2 col-md-8 text-danger">
																	${error1 }</div>
															</div>



															<div class="form-group center">
																<div class="col-sm-offset-4 col-sm-2">
																	<button type="submit" class="btn btn-primary">Submit</button>
																</div>
															</div>

														</fieldset>
													</form>
												</td>

											</tr>
										</tbody>
									</table>
								</div>



							</div>
						</div>
					</div>
				</div>
			</div>
		</div>






		<!-- View Sample and add tests modal -->
		<div class="container">
			<div class="row">


				<div class="col-md-6">

					<div class="modal fade" id="viewsample" tabindex="-1" role="dialog"
						aria-labelledby="myLargeModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<div class="col-md-10 col-md-offset-1 text-center">
									<table class="table table-striped">
										<tbody>
											<tr>
												<td colspan="12">
													<form class="well form-horizontal" action="requestTest"
														method="post">
														<fieldset>

															<div class="form-group">
																<label class="col-md-4 control-label">Patient
																	Name</label>
																<div class="col-md-8 inputGroupContainer">
																	${patient.name }</div>
															</div>
															<div class="form-group">
																<label class="col-md-4 control-label">Patient ID</label>
																<div class="col-md-8 inputGroupContainer">
																	${patient.p_ID }</div>
															</div>
															<div class="form-group">
																<label class="col-md-4 control-label">My Samples</label>
																<div class="col-md-8 inputGroupContainer">

																	<label for="sel1">Select sample from list:</label>
																	<div class="input-group">
																		<span class="input-group-addon"><i
																			class="glyphicon glyphicon-plus"></i></span> <select
																			class="form-control" name="sampleId" id="sel1">
																			<c:forEach begin="0" end="${nosamples}" var="par"
																				items="${samples}">
																				<option value=${par.sampleId }
																					label="${par.sampleType }" />
																			</c:forEach>
																		</select>
																	</div>
																</div>
															</div>
															<div class="form-group">
																<label class="col-md-4 control-label">Available
																	Tests</label>
																<div class="col-md-8 inputGroupContainer">

																	<label for="sel1">Select Test from list(as
																		mentioned by your doctor):</label>
																	<div class="input-group">
																		<span class="input-group-addon"><i
																			class="glyphicon glyphicon-plus"></i></span> <select
																			class="form-control" name="testId" id="sel1">
																			<c:forEach begin="0" end="${notests}" var="par"
																				items="${tests}">
																				<option value=${par.testId }
																					label="${par.testType }" />
																			</c:forEach>
																		</select>
																	</div>
																</div>
															</div>




															<div class="form-group center">
																<div class="col-sm-offset-2 col-md-8 text-danger">
																	${error2 }</div>
															</div>



															<div class="form-group center">
																<div class="col-sm-offset-4 col-sm-2">
																	<button type="submit" class="btn btn-primary">Submit</button>
																</div>
															</div>

														</fieldset>
													</form>
												</td>

											</tr>
										</tbody>
									</table>
								</div>



							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<!-- View Samples and reports -->
		<div class="container">
			<div class="row">


				<div class="col-md-6">

					<div class="modal fade" id="onlyviewsample" tabindex="-1"
						role="dialog" aria-labelledby="myLargeModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<div class="col-md-10 col-md-offset-1 text-center">
									<table class="table table-striped">
										<tbody>
											<tr>
												<td colspan="12">
													<form class="well form-horizontal"
														action="/pathapp/viewReport" method="post">
														<fieldset>

															<div class="form-group">
																<label class="col-md-4 control-label">Patient
																	Name</label>
																<div class="col-md-8 inputGroupContainer">
																	${patient.name }</div>
															</div>
															<div class="form-group">
																<label class="col-md-4 control-label">Patient ID</label>
																<div class="col-md-8 inputGroupContainer">
																	${patient.p_ID }</div>
															</div>
															<div class="form-group">
																<label class="col-md-4 control-label">My Samples</label>
																<div class="col-md-8 inputGroupContainer">


																	<div class="input-group">
																		<span class="input-group-addon"><i
																			class="glyphicon glyphicon-plus"></i></span>
																		<c:if test="${nosamples ==0}">
																			<c:out value="NO samples" />
																		</c:if>
																		<c:if test="${nosamples >0}">
																			<select class="form-control" name="sampleId">
																				<c:forEach begin="0" end="${nosamples}" var="par"
																					items="${samples}">
																					<option value=${par.sampleId }
																						label="${par.sampleType }" />
																				</c:forEach>
																			</select>
																		</c:if>
																	</div>
																</div>
															</div>
															<div class="form-group">
																<label class="col-md-4 control-label">View
																	report of selected sample</label>
																<div class="col-md-8 inputGroupContainer">


																	<div class="input-group">

																		<button type="submit" class="btn btn-primary">View</button>
																	</div>
																</div>
															</div>

														</fieldset>
													</form>
												</td>

											</tr>
										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div style="height: 100px; text-align: center;">
			<small class="text-muted">PathLabs is a ISO:1998-2001
				certified sample testing lab under MP government and is maintained
				by private organization</small>
		</div>
</body>
</html>
