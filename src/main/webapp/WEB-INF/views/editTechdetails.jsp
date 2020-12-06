


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
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
	$(window).on('scroll',function(){
	    var wscroll = $(this).scrollTop();
	    if(wscroll > 10){
	     $(".navbar").addClass("shrink-nav");
	    }
	    else{
	      $(".navbar").removeClass("shrink-nav");
	    }
	  });
	</script>
<title>Welcome to PathLabs</title>

</head>
<body>
	<h2></h2>
	<br><br>
	<h2></h2>

	<!--Navigation bar-->
	<div id="nav-placeholder"></div>

	<script>
			$(function(){
			  $("#nav-placeholder").load("nav");
			});
			</script>
	<!--end of Navigation bar-->
	<!-- ============= banner ============= -->
	<div id="home" class="banner"
		style="background-image: url(resources/images/lab.jpg);">
		<div class="overlay"></div>
		<div class="banner-content">
			<div class="well well-sm" style="background-color: grey">
				<div class="row">
					<h3 class="display-4">Edit Technician Details Form</h3>
				</div>
			</div>
			
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 text-center">
						<table class="table table-striped">
							<tbody>
								<tr>
									<td colspan="12">
										<form class="well form-horizontal"
											action="/pathapp/editDetails" method="post">
											<fieldset>
												<div class="form-group center">
													<div class="col-sm-offset-2 col-md-8 text-danger">
														${error }</div>
												</div>
												<div class="form-group">
													<label class="col-md-4 control-label">Technician ID</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-user"></i></span><input
																id="fullName" name="t_ID" placeholder="Technician ID"
																class="form-control" required="true" value="${editTech.t_ID }"
																type="text" readonly>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-4 control-label">Full Name</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-user"></i></span><input
																id="fullName" name="name" placeholder="Full Name"
																class="form-control" required="true" value="${editTech.name }"
																type="text" readonly>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-4 control-label">Degree</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-asterisk"></i></span><input
																id="addressline1" name="degree"
																placeholder="mention credentials" class="form-control"
																required="true" value="${editTech.degree}" type="text">
														</div>
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-4 control-label">YearOF
														Passing</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-plus"></i></span><input
																id="addressLine2" name="yearOfPassing"
																placeholder="4 digits, not before 1975"
																class="form-control" required="true" value="${editTech.yearOfPassing }"
																type="number">
														</div>
													</div>
												</div>


												<div class="form-group">
													<label class="col-md-4 control-label">Email Id</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-heart-empty"></i></span><input
																id="emailId" name="emailId"
																placeholder="example@gmail.com" class="form-control"
																value="${editTech.emailId}" type="email">
														</div>
													</div>
												</div>


												</div>

												<div class="form-group">
													<label class="col-md-4 control-label">Contact
														Number</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-earphone"></i></span><input
																id="addressLine2" name="phoneNumber"
																placeholder="phoneNumber (10 digits)"
																class="form-control" required="true" value="${editTech.phoneNumber}"
																type="number">
														</div>
													</div>
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


	<div style="height: 80px;">
	<small class="text-muted">PathLabs is a ISO:1998-2001
			certified sample testing lab under MP government and is maintained by
			private organization</small>
	</div>
</body>
</html>
