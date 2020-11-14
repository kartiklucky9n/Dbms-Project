<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page isELIgnored="false" %>
<!doctype html>
<html lang ="en">
<head>
	<link rel="stylesheet" href="resources/css/landing.css">
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
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
<h2></h2>

			<!--Navigation bar-->
			<div id="nav-placeholder">
			
			</div>
			
			<script>
			$(function(){
			  $("#nav-placeholder").load("nav");
			});
			</script>
			<!--end of Navigation bar-->

    <!-- ============= banner ============= -->
    <div id="home" class="banner" style="background-image: url(resources/images/lab.jpg);">
      <div class="overlay"></div>
      <div class="banner-content">
        <div class="container">
          <div class="row">
            <div class="col-md-10 col-md-offset-1 text-center">
              <h1>Testing <span>&</span> Reporting</h1>
              <p>Path Labs is a semi-private organization for sample testing.
              </p>
              <a href="patientForm" class="btn btn-primary page-scroll" role="button">Patient Form</a>
              <a href="#" class="btn btn-primary" role="button">Check Completed Reports</a>
            </div>
          </div>
        </div> 
      </div>
    </div>

  
  <div style="height:80px;text-align: center;">
  	 <small class="text-muted" >PathLabs is a ISO:1998-2001 certified sample testing lab under MP government and is maintained by private organization</small>
  </div>
</body>
</html>
