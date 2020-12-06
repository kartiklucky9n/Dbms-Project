<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Head Home</title>
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


</head>
<body>

	<h2></h2>

	<!--Navigation bar-->
	<div id="nav-placeholder"></div>

	<script>
		$(function() {
			$("#nav-placeholder").load("navhead");
		});
	</script>
	<!--end of Navigation bar-->

	<!-- ============= banner ============= -->
	<div id="home" class="banner"
		style="background-image: url(resources/images/head.jpg);">
		<div class="overlay"></div>
		<div class="banner-content">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 text-center">
						<div class="col-md-6">
							<div class="btn-group-vertical">
								<br> <br>

								<button type="button" class="btn btn-primary page-scroll"
									data-toggle="modal" data-target="#tech">View and
									Delete Technicians</button>


								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#test">Allot and
									delete Tests</button>

								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#addtest">Add Tests</button>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#incompletetest">Incompleted
									Tests and respective technicians</button>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#allpatients">All
									Patient details</button>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#notrecievedsample">Confirm
									Sample Received</button>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#search">View Reports
									by date</button>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#search2">View
									Reports by Tests</button>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#addbox">Add Box</button>
								<br> <br> <a href="technicianRegistration"
									class="btn btn-primary btn-warning" role="button">Technician
									Registration</a>

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
													</div>
													<a href="processTechnicianForm2/${user}"
														class="btn btn-primary btn-warning" role="button">Set
														New Password</a>
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

				<div class="modal fade" id="tech" tabindex="-1" role="dialog"
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


										<th>Technician ID</th>
										<th>Name</th>
										<th>Degree</th>
										<th>Year Of Passing Degree</th>
										<th>Email</th>
										<th>Phone Number</th>
										<th>Availiblity</th>
										<th>Delete</th>
									</thead>
									<tbody>



										<c:forEach begin="0" end="${noTech}" var="par" items="${tech}">
											<tr>

												<td><c:out value="${par.t_ID }" /></td>
												<td><c:out value="${par.name}" /></td>
												<td><c:out value="${par.degree}" /></td>
												<td><c:out value="${par.yearOfPassing}" /></td>
												<td><c:out value="${par.emailId}" /></td>
												<td><c:out value="${par.phoneNumber}" /></td>
												<td><c:out value="${par.approved}" /></td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Delete">
														<a href="delete/${par.t_ID}">
															<button class="btn btn-danger btn-xs" data-title="Delete"
																data-toggle="modal" data-target="#delete">
																<span class="glyphicon glyphicon-trash"></span>
															</button>
														</a>
													</p></td>
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


	<!-- Tests modal -->
	<div class="container">
		<div class="row">


			<div class="col-md-6">

				<div class="modal fade" id="test" tabindex="-1" role="dialog"
					aria-labelledby="myLargeModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">


							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4>Tests</h4>
							<div class="table-responsive">


								<table id="mytable" class="table table-bordred table-striped">

									<thead>


										<th>Test ID</th>
										<th>Test Type/Name</th>
										<th>Handling Technician</th>

										<th>Edit Handling Technician ID</th>
										<th>Delete</th>
									</thead>
									<tbody>
										<c:forEach begin="0" end="${noTest}" var="par" items="${test}">
											<tr>

												<td><c:out value="${par.testId }" /></td>
												<td><c:out value="${par.testType}" /></td>
												<td><c:out value="${par.t_ID}" /></td>
												<td>
													<form class="well form-horizontal"
														action="editTech/${par.testId}" method="post">

														<fieldset>
															<div class="form-group">


																<div class="input-group">
																	<span class="input-group-addon"><i
																		class="glyphicon glyphicon-user"></i></span><select
																		name="t_ID" class="form-control">
																		<option value="${par.t_ID }">${par.t_ID }-select
																			to edit current</option>
																		<c:forEach begin="0" end="${noTech}" var="car"
																			items="${tech}">
																			<option value="${car.t_ID }">${car.t_ID }-
																				${car.name }</option>
																		</c:forEach>
																	</select>
																</div>
																<p data-placement="right" data-toggle="tooltip"
																	title="Edit">
																	<button class="btn btn-primary btn-xs" type="submit">
																		<span class="glyphicon glyphicon-pencil"></span>
																	</button>
																</p>

															</div>

														</fieldset>
													</form>
												</td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Delete">
														<a href="deleteT/${par.testType}">
															<button class="btn btn-danger btn-xs" data-title="Delete"
																data-toggle="modal" data-target="#delete">
																<span class="glyphicon glyphicon-trash"></span>
															</button>
														</a>
													</p></td>
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
	<!-- Add Tests modal -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="modal fade" id="addtest" tabindex="-1" role="dialog"
					aria-labelledby="myLargeModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">


							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>

							<h4>ADD Tests</h4>

							<div class="table-responsive">


								<form class="well form-horizontal" action="addTestTo"
									method="post">
									<table id="mytable" class="table table-bordred table-striped">

										<thead>
											<th class="text-center">Test Type/Name</th>
											<th class="text-center">Handling Technician</th>
											<th class="text-center">Submit</th>

										</thead>
										<tbody>

											<tr>
												<fieldset>
													<td>
														<div class="form-group">

															<div class="col-md-12 inputGroupContainer">
																<div class="input-group">
																	<span class="input-group-addon"><i
																		class="glyphicon glyphicon-plus"></i></span><input
																		id="testType" name="testType"
																		placeholder="Test Type[MAX 6 letters]"
																		class="form-control" required="true" value=""
																		type="text">
																</div>

															</div>
														</div>
													</td>
													<td>
														<div class="form-group">

															<div class="col-md-12 inputGroupContainer">
																<div class="input-group">
																	<span class="input-group-addon"><i
																		class="glyphicon glyphicon-user"></i></span> <select
																		name="t_ID" class="form-control">
																		<c:forEach begin="0" end="${noTech}" var="par"
																			items="${tech}">
																			<option value="${par.t_ID }">${par.t_ID }-
																				${par.name }</option>
																		</c:forEach>
																	</select>

																</div>
															</div>
														</div>
													</td>
													<td>
														<div class="text-center">

															<button class="btn btn-primary btn-lg" type="submit">Add</button>
														</div>
													</td>
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

	<!-- Incompleted tests modal -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="modal fade" id="incompletetest" tabindex="-1"
					role="dialog" aria-labelledby="myLargeModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4>Incompleted Tests</h4>

							<div class="table-responsive">


								<form class="well form-horizontal" action="addTestTo"
									method="post">
									<table id="mytable" class="table table-bordred table-striped">

										<thead>
											<th class="text-left">Technician ID</th>
											<th class="text-left">Sample ID</th>
											<th class="text-left">Patient ID</th>
											<th class="text-left">Test ID</th>
											<th class="text-left">Allotment Date to technician</th>
										</thead>
										<tbody>
											<c:forEach begin="0" end="${noit}" var="par" items="${it}">
												<tr>
													<td><c:out value="${par.t_ID }" /></td>
													<td><c:out value="${par.sampleId}" /></td>
													<td><c:out value="${par.p_ID}" /></td>
													<td><c:out value="${par.testId}" /></td>
													<td><c:out value="${par.dateOfAllotment}" /></td>
												</tr>
											</c:forEach>
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


	<!-- View Patients modal -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="modal fade" id="allpatients" tabindex="-1" role="dialog"
					aria-labelledby="myLargeModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">


							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>

							<h4>All patients details</h4>

							<div class="table-responsive">


								<form class="well form-horizontal" action="addTestTo"
									method="post">
									<table id="mytable" class="table table-bordred table-striped">

										<thead>
											<th class="text-left">Patient Id</th>
											<th class="text-left">Name</th>
											<th class="text-left">Sex</th>
											<th class="text-left">Permanent District</th>
											<th class="text-left">Permanent State</th>
											<th class="text-left">Hospital OP/IP Number</th>
											<th class="text-left">DOB</th>
											<th class="text-left">Residential District</th>
											<th class="text-left">Residential State</th>
											<th class="text-left">Contact Number</th>

										</thead>
										<tbody>
											<c:forEach begin="0" end="${noPatient}" var="par"
												items="${patients}">
												<tr>

													<td><c:out value="${par.p_ID }" /></td>
													<td><c:out value="${par.name}" /></td>
													<td><c:out value="${par.sex}" /></td>
													<td><c:out value="${par.p_district}" /></td>
													<td><c:out value="${par.p_state}" /></td>
													<td><c:out value="${par.hospitalOPNumber}" /></td>
													<td><c:out value="${par.DOB}" /></td>
													<td><c:out value="${par.t_district}" /></td>
													<td><c:out value="${par.t_state}" /></td>
													<td><c:out value="${par.contactNumber}" /></td>
												</tr>
											</c:forEach>

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
							<h4>Confirm if sample received</h4>
							<div class="table-responsive">


								<table id="mytable" class="table table-bordred table-striped">

									<thead>


										<th>Sample ID</th>
										<th>Sample Type</th>
										<th>Patient ID</th>
										<th>ADD IN STORAGE</th>
										<th>Recieved?</th>

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

	<!-- Storage modal -->
	<div class="container">
		<div class="row">


			<div class="col-md-6">

				<div class="modal fade" id="addbox" tabindex="-1" role="dialog"
					aria-labelledby="myLargeModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4>Storage Area</h4>
							<div class="table-responsive">
								<table id="mytable" class="table table-bordred table-striped">

									<thead>
										<th>BOX ID</th>
										<th>STORAGE CAPACITY</th>
										<th>STORAGE TYPE</th>
										<th>NO OF SAMPLES STORED</th>
									</thead>
									<tbody>
										<c:forEach begin="0" end="${nobox}" var="par" items="${box}">
											<tr>
												<td><c:out value="${par.boxId}" /></td>
												<td><c:out value="${par.boxCapacity}" /></td>
												<td><c:out value="${par.containerType}" /></td>
												<td><c:out value="${par.noOfSample}" /></td>
											</tr>
										</c:forEach>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td><p data-placement="top" data-toggle="tooltip"
													title="Add box">

													<button class="btn btn-danger btn-xs" data-title="add"
														data-toggle="modal" data-target="#add">
														<span class="glyphicon glyphicon-plus"></span>
													</button>
												</p></td>
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

	<!-- add box storage capacity modal -->
	<div class="modal fade" id="add" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<form class="well form-horizontal" action="addbox" method="post">

					<fieldset>
						<div class="form-group">

							<div class="col-md-8 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-plus"></i></span> <select
										class="form-control" name="containerType">
										<option value="BLOOD" name="BLOOD" />
										<option value="NASALSWAB" name="NASALSWAB" />
										<option value="STOOL" name="STOOL" />
									</select>

								</div>

								<button class="btn btn-primary btn-lg" type="submit">Add
									box</button>

							</div>
						</div>

					</fieldset>
				</form>
			</div>
		</div>
	</div>


	<!-- Search Reports -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="modal fade" id="search" tabindex="-1" role="dialog"
					aria-labelledby="myLargeModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">


							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>

							<h4>View Reports By Date</h4>

							<div class="table-responsive">


								<form class="well form-horizontal" action="allreport"
									method="post">
									<table id="mytable" class="table table-bordred table-striped">

										<thead>
											<th class="text-center">START DATE</th>
											<th class="text-center">END DATE</th>
											<th class="text-center">Submit</th>

										</thead>
										<tbody>

											<tr>
												<fieldset>
													<td>
														<div class="form-group">

															<div class="col-md-12 inputGroupContainer">
																<div class="input-group">
																	<span class="input-group-addon"><i
																		class="glyphicon glyphicon-calendar"></i></span><input
																		id="city" name="startdate" placeholder=""
																		class="form-control" required="true" value=""
																		type="date">
																</div>

															</div>
														</div>
													</td>
													<td>
														<div class="form-group">

															<div class="col-md-12 inputGroupContainer">
																<div class="input-group">
																	<span class="input-group-addon"><i
																		class="glyphicon glyphicon-calendar"></i></span> <input
																		id="city" name="enddate" placeholder=""
																		class="form-control" required="true" value=""
																		type="date">

																</div>
															</div>
														</div>
													</td>
													<td>
														<div class="text-center">

															<button class="btn btn-primary btn-lg" type="submit">Search</button>
														</div>
													</td>
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

	<!-- Search Reports -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="modal fade" id="search2" tabindex="-1" role="dialog"
					aria-labelledby="myLargeModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4>View Reports by Tests</h4>
							<div class="table-responsive">
								<form class="well form-horizontal" action="allreport2"
									method="post">
									<table id="mytable" class="table table-bordred table-striped">

										<thead>
											<th class="text-center">START DATE</th>
											<th class="text-center">END DATE</th>
											<th class="text-center">Select Test</th>
											<th class="text-center">Verict</th>
											<th class="text-center">Submit</th>

										</thead>
										<tbody>

											<tr>
												<fieldset>
													<td>
														<div class="form-group">

															<div class="col-md-12 inputGroupContainer">
																<div class="input-group">
																	<span class="input-group-addon"><i
																		class="glyphicon glyphicon-calendar"></i></span><input
																		id="city" name="startdate" placeholder=""
																		class="form-control" required="true" value=""
																		type="date">
																</div>

															</div>
														</div>
													</td>
													<td>
														<div class="form-group">

															<div class="col-md-12 inputGroupContainer">
																<div class="input-group">
																	<span class="input-group-addon"><i
																		class="glyphicon glyphicon-calendar"></i></span> <input
																		id="city" name="enddate" placeholder=""
																		class="form-control" required="true" value=""
																		type="date">

																</div>
															</div>
														</div>
													</td>
													<td>
														<div class="form-group">

															<div class="col-md-12 inputGroupContainer">
																<div class="input-group">
																	<span class="input-group-addon"><i
																		class="glyphicon glyphicon-calendar"></i></span> <select
																		name="testId" class="form-control">
																		<c:forEach begin="0" end="${noTest}" var="par"
																			items="${test}">
																			<option value="${par.testId }">${par.testId }-
																				${par.testType }</option>
																		</c:forEach>
																	</select>
																</div>
															</div>
														</div>
													</td>
													<td>
														<div class="radio">
															<label><input type="radio" name="optradio"
																value="Positive" checked>Positive</label>
														</div>
														<div class="radio">
															<label><input type="radio" name="optradio"
																value="Negative">Negative</label>
														</div>

													</td>
													<td>
														<div class="text-center">

															<button class="btn btn-primary btn-lg" type="submit">Search</button>
														</div>
													</td>
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
