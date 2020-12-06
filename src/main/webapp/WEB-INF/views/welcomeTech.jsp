<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Technician Home</title>
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
<title>Welcome to PathLabs</title>
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
			$("#nav-placeholder").load("navtech");
		});
	</script>
	<!--end of Navigation bar-->

	<!-- ============= banner ============= -->
	<div id="home" class="banner"
		style="background-image: url(resources/images/sample.jpg);">
		<div class="overlay"></div>
		<div class="banner-content">
			<div class="container">
				<div class="row">
					<div class="col-md-10 text-center">
						<div class="col-md-6">
							<br>
							<br>
							<br>
							<div class="btn-group-vertical">
								<button type="button" class="btn btn-success"
									data-toggle="modal" data-target="#viewsamples">View
									Alloted Samples</button>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#notrecievedsample">Confirm
									Sample Received</button>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#addtestreport">Add test
									report to received samples</button>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#addfinalreport">Add
									final report to samples</button>

							</div>


						</div>
						<div class="col-md-6">
							<div class="container">
								<div class="row">
									<div class="col-xs-12 col-sm-6 col-md-6">
										<div class="well well-sm" style="background-color: black">
											<div class="row">
												<div class="col-sm-6 col-md-4">
													<img src="https://i.ibb.co/zV1DnZL/profile.png" alt=""
														class="img-rounded img-responsive" />
												</div>
												<div class="col-sm-6 col-md-8">
													<h2 class="text-muted">My Profile</h2>
													<h4 class="text-success">${technician.name }</h4>
													
													<small><cite
														title="${technician.degree } ${technician.yearOfPassing }">${technician.degree },
															${technician.yearOfPassing } <i
															class="glyphicon glyphicon-book"> </i>
													</cite></small>
													<p>
														<i class="glyphicon glyphicon-envelope"></i>${technician.emailId }
														<br /> <i class="glyphicon glyphicon-minus-sign"></i>${technician.phoneNumber }
													</p>
													<!-- Split button -->
													<div class="btn-group">
														<a href="editdetails/${technician.t_ID }">
															<button type="button" class="btn btn-primary">
																Edit</button>
														</a>
														<!-- Split button -->
														<div class="btn-group">
														<c:if test="${technician.approved==false }">
															<button type="button" class="btn btn-danger">
															NOT AVAILABLE
															</button>
															<button type="button"
																class="btn btn-danger dropdown-toggle"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false">
																<span class="caret"></span> <span class="sr-only">Toggle
																	Dropdown</span>
															</button>
															<ul class="dropdown-menu">
																<li><a href="setattendance/${technician.t_ID }/${1}">Yes</a></li>
																<li><a href="setattendance/${technician.t_ID }/${0}">No</a></li>
																
															</ul>
														</c:if>
														<c:if test="${technician.approved==true }">
															<button type="button" class="btn btn-success">
															AVAILABLE
															</button>
															<button type="button"
																class="btn btn-success dropdown-toggle"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false">
																<span class="caret"></span> <span class="sr-only">Toggle
																	Dropdown</span>
															</button>
															<ul class="dropdown-menu">
																<li><a href="setattendance/${technician.t_ID }/${1}">Yes</a></li>
																<li><a href="setattendance/${technician.t_ID }/${0}">No</a></li>
																
															</ul>
														</c:if>
															
														</div>
													</div>
													<br><br>
									<a href="processTechnicianForm2/${user}"
							class="btn btn-primary btn-warning" role="button">Set New Password</a>
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





	<!-- Technicians modal -->
	<div class="container">
		<div class="row">


			<div class="col-md-6">

				<div class="modal fade" id="viewsamples" tabindex="-1" role="dialog"
					aria-labelledby="myLargeModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4>Technicians</h4>
							<div class="table-responsive">


								<table id="mytable" class="table table-bordred table-striped">

									<thead>


										<th>Sample ID</th>
										<th>Test Id</th>
										<th>Submission Status</th>
										<th>Test Report</th>
									</thead>
									<tbody>

										<c:forEach begin="0" end="${nort}" var="par" items="${rt}">
											<tr>

												<td><c:out value="${par.sampleId }" /></td>
												<td><c:out value="${par.testId}" /></td>
												<td><c:if test="${par.completed == false}">
														<c:out value="Test Not Done" />
													</c:if> <c:if test="${par.completed == true}">
														<c:out value="Test is Done" />
													</c:if></td>
												<td><c:out value="${par.testReport}" /></td>

											</tr>
										</c:forEach>

									</tbody>

								</table>



							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Not recieved Samples -->
	<div class="container">
		<div class="row">


			<div class="col-md-6">

				<div class="modal fade" id="notrecievedsample" tabindex="-1"
					role="dialog" aria-labelledby="myLargeModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4>Confirm if sample recieved</h4>
							<div class="table-responsive">


								<table id="mytable" class="table table-bordred table-striped">

									<thead>


										<th>Sample ID</th>
										<th>Sample Type</th>
										<th>Patient ID</th>
										<th>ADD IN STORAGE</th>
										<th>Received?</th>

									</thead>
									<tbody>



										<c:forEach begin="0" end="${nosample}" var="par"
											items="${sample}">
											<tr>

												<td><c:out value="${par.sampleId }" /></td>
												<td><c:out value="${par.sampleType}" /></td>
												<td><c:out value="${par.p_ID}" /></td>
												<form class="well form-horizontal"
													action="recieve/${par.sampleId}" method="post">
													<fieldset>
														<td><p data-placement="top" data-toggle="tooltip"
																title="Recieved?"></p> <select name="boxId">
																<c:forEach begin="0" end="${nobox}" var="par2"
																	items="${box}">
																	<c:if test="${par2.boxCapacity-par2.noOfSample > 0 }">
																		<option value="${par2.boxId}">${par2.boxId}
																			${ par2.containerType}</option>
																	</c:if>
																</c:forEach>
														</select></td>
														<td>
															<p data-placement="top" data-toggle="tooltip" title="add">
																<button class="btn btn-primary btn-xs" type="submit">
																	<span class="glyphicon glyphicon-plus"></span>
																</button>
															</p>
														</td>

													</fieldset>
												</form>

											</tr>
										</c:forEach>

									</tbody>

								</table>



							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Add test report on recieved Samples -->
	<div class="container">
		<div class="row">


			<div class="col-md-6">

				<div class="modal fade" id="addtestreport" tabindex="-1"
					role="dialog" aria-labelledby="myLargeModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4>Add Report TO Recieved Samples</h4>
							<div class="table-responsive">


								<table id="mytable" class="table table-bordred table-striped">

									<thead>
										<th>Sample ID</th>
										<th>Test Id</th>
										<th>ADD Report</th>

									</thead>
									<tbody>



										<c:forEach begin="0" end="${norecievedtest}" var="par"
											items="${recievedtest}">
											<tr>

												<td><c:out value="${par.sampleId }" /></td>
												<td><c:out value="${par.testId}" /></td>
												<td>
													<p data-placement="top" data-toggle="tooltip"
														title="ADD REPORT">
														<a href="addtestrepo/${par.sampleId}/${par.testId}">
															<button class="btn btn-plus btn-xs"
																data-title="ADD REPORT">
																<span class="glyphicon glyphicon-plus"></span>
															</button>
														</a>
													</p>
												</td>
											</tr>
										</c:forEach>

									</tbody>

								</table>



							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Add final report on  samples with all test done -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">

				<div class="modal fade" id="addfinalreport" tabindex="-1"
					role="dialog" aria-labelledby="myLargeModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4>Add final report to samples with all tests done</h4>
							<div class="table-responsive">

								<form action="addfinalrepo" method="post">

									<table id="mytable" class="table table-bordred table-striped">

										<thead>

											<th>Select sample Id to proceed Sample ID</th>

											<th>ADD Report</th>

										</thead>
										<tbody>
											<tr>
												<fieldset>
													<td><select name="sampleId" class="form-control">
															<c:forEach begin="0" end="${nosampledone}" var="par"
																items="${sampledone}">
																<option value="${par.sampleId }">${par.sampleId }</option>

															</c:forEach>
													</select></td>

													<td><p data-placement="top" data-toggle="tooltip"
															title="ADD REPORT">

															<button class="btn btn-plus btn-xs"
																data-title="ADD REPORT" type="submit">
																<span class="glyphicon glyphicon-plus"></span>
															</button>
														</p></td>
												</fieldset>
											</tr>


										</tbody>

									</table>

								</form>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="height: 100px; text-align: center;">
		<small class="text-muted">PathLabs is a ISO:1998-2001
			certified sample testing lab under MP government and is maintained by
			private organization</small>
	</div>







</body>
</html>
