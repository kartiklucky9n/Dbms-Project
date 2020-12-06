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
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<div class="col-md-6">
							<div class="container">
								<div class="row">
									<div class="col-xs-12 col-sm-6 col-md-6">
										<div class="well well-sm" style="background-color: black">
											<div class="row">
												
												<div class="col-sm-6 col-md-8 col-md-offset-2">
													<h2>OUR HEADS</h2>
												<c:forEach begin="0" end="${nohead }" var="par" items="${head }">
													<h2>${par.name}</h2>
													<small><cite
														title="${par.degree } ${par.yearOfPassing }">${par.degree },
															${par.yearOfPassing } <i
															class="glyphicon glyphicon-book"> </i>
													</cite></small>
													<p>
														<i class="glyphicon glyphicon-envelope"></i>${par.emailId }
														<br /> <i class="glyphicon glyphicon-minus-sign"></i>${par.phoneNumber }
													</p>
													
												</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="col-md-6">
							<div class="container">
								<div class="row">
									<div class="col-xs-12 col-sm-6 col-md-6">
										<div class="well well-sm" style="background-color: black">
											<div class="row">
												
												<div class="col-sm-6 col-md-8 col-md-offset-2 ">
													<h2>Web Administrator</h2>
													<h2>KARTIK RAI</h2>
													<small><cite
														title="Batch">
															Batch:CSE(IDD)<i
															class="glyphicon glyphicon-book"> </i>
													</cite></small>
													<p>
														<i class="glyphicon glyphicon-envelope"></i>Roll: 18074008
														<br /> <i class="glyphicon glyphicon-minus"></i> Contact: 7771839536, 9935697182
													</p>
													
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						<a href="index">
													<button class="btn-primary">Go Back</button>
						</a>
						</div>
						
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
