


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
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
	<h2>Hello World!</h2>

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
			<br> <br> <br>
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 text-center">
						<table class="table table-striped">
							<tbody>
								<tr>
									<td colspan="12">
										<form class="well form-horizontal" action="processPatientForm"
											method="post">
											<fieldset>

												<div class="form-group">
													<label class="col-md-4 control-label">Full Name</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-user"></i></span><input
																id="fullName" name="name" placeholder="Full Name"
																class="form-control" required="true" value=""
																type="text">
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-4 control-label">Sex</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-asterisk"></i></span><select
																class="form-control" name="sex">
																<option value="Male">MALE</option>
																<option value="Female">FEMALE</option>
																<option value="LGBTQ">LGBTQ</option>

															</select>
														</div>
													</div>
												</div>
												

												<div class="form-group">
													<label class="col-md-4 control-label">Permanent
														Address District</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-home"></i></span><input
																id="addressLine2" name="p_district"
																placeholder="Pemanent address's district"
																class="form-control" required="true" value=""
																type="text">
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-4 control-label">Permanent
														Address State</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-home"></i></span><input
																id="addressLine2" name="p_state"
																placeholder="Pemanent address's State"
																class="form-control" required="true" value=""
																type="text">
														</div>
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-4 control-label">Hospital
														OP/IP Number</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-plus"></i></span><input
																id="addressLine2" name="hospitalOPNumber"
																placeholder="Hospital OP/IP number" class="form-control"
																required="true" value="" type="number">
														</div>
													</div>
												</div>
												<div class="form-group center">
													<div class="col-sm-offset-2 col-md-8 text-danger">
														${error }</div>
												</div>

												<div class="form-group">
													<label class="col-md-4 control-label">DateOF Birth</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-heart-empty"></i></span><input
																id="city" name="DOB" placeholder="" class="form-control"
																required="true" value="" type="date">
														</div>
													</div>
												</div>
												<div class="form-group center">
													<div class="col-sm-offset-2 col-md-8 text-danger">
														${error2 }</div>
												</div>

												<div class="form-group">
													<label class="col-md-4 control-label">Residential
														Address District</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-home"></i></span><input
																id="addressLine2" name="t_district"
																placeholder="Residential address's district"
																class="form-control" required="true" value=""
																type="text">
														</div>
													</div>
												</div>
												
												<div class="form-group">
													<label class="col-md-4 control-label">Residential
														Address State</label>
													<div class="col-md-8 inputGroupContainer">
														<div class="input-group">
															<span class="input-group-addon"><i
																class="glyphicon glyphicon-home"></i></span><input
																id="addressLine2" name="t_state"
																placeholder="Residential address's State"
																class="form-control" required="true" value=""
																type="text">
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
																id="addressLine2" name="contactNumber"
																placeholder="Contact number" class="form-control"
																required="true" value="" type="number">
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


	<div style="height: 80px; text-align: center;">
		<small class="text-muted">PathLabs is a ISO:1998-2001
			certified sample testing lab under MP government and is maintained by
			private organization</small>
	</div>
</body>
</html>
