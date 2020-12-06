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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
	integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
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

<style>
body {
	background-image: url('https://i.ibb.co/mBMsDVq/patient.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
}
</style>



</head>
<body>

	<h2></h2>




	<!-- ============= banner ============= -->
	<br><br><br><br><br><br><br><br><br>
	<div class="banner">
		<div class="overlay"></div>
		<div class="banner-content">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						

					</div>
					<div class="col-md-6  text-center">
						<div class="container text-center">
							<div class="row">
								<div class="col-xs-12 col-sm-6 col-md-6">
									<div class="well well-sm" style="background-color: grey">
										<div class="row">
											
											<div class="col-sm-6 col-md-8">
												<h5 >${sample.sampleType }</h5>
												<h6 >${report.t_ID }</h6>
												<p>${report.resultOfReport }</p>
												<a href="gobackto">
													<button class="btn-primary">Go Back</button>
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







	<div style="height: 100px; text-align: center;">
		<small class="text-muted">PathLabs is a ISO:1998-2001
			certified sample testing lab under MP government and is maintained by
			private organization</small>
	</div>







</body>
</html>
