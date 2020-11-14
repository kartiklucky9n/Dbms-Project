
    
    
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
<h2>Hello World!</h2>

<nav class="navbar navbar-inverse navbar-fixed-top transition main-nav">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.html">
            <img src="resources/images/logo.jpg" alt="logo image" class="transition img-responsive" height="10" width="30">
          </a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a class="page-scroll" href="#home">Home</a></li>
            <li><a class="page-scroll" href="#about">About</a></li>
            <li><a class="page-scroll" href="#services">Services</a></li>
            <li><a class="page-scroll" href="#projects">Projects</a></li>
            <li><a class="page-scroll" href="#clients">Patients</a></li>
            <li><a class="page-scroll" href="#contact">Contact</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav><!-- /navbar -->

    <!-- ============= banner ============= -->
    <div id="home" class="banner" style="background-image: url(resources/images/lab.jpg);">
      <div class="overlay"></div>
      <div class="banner-content">
        <div class="container">
          <div class="row">
            <div class="col-md-10 col-md-offset-1 text-center">
              <table class="table table-striped">
			          <tbody>
			             <tr>
			                <td colspan="12">
			                   <form class="well form-horizontal" action="processPatientForm" method="post">
			                      <fieldset>
				                      
			                         <div class="form-group">
			                            <label class="col-md-4 control-label">Full Name</label>
			                            <div class="col-md-8 inputGroupContainer">
			                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span><input id="fullName" name="name" placeholder="Full Name" class="form-control" required="true" value="" type="text"></div>
			                            </div>
			                         </div>
			                         <div class="form-group">
			                            <label class="col-md-4 control-label">Sex</label>
			                            <div class="col-md-8 inputGroupContainer">
			                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-asterisk"></i></span><input id="addressline1" name="sex" placeholder="Male/Female/LGBTQ (no other format accepted)" class="form-control" required="true" value="" type="text"></div>
			                            </div>
			                         </div>
			                         <div class="form-group">
			                            <label class="col-md-4 control-label">Permanent Address Pincode</label>
			                            <div class="col-md-8 inputGroupContainer">
			                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span><input id="addressLine2" name="p_pincode" placeholder="Pemanent address's pincode" class="form-control" required="true" value="" type="number"></div>
			                            </div>
			                         </div>
			                     
			                         <div class="form-group">
			                            <label class="col-md-4 control-label">Permanent Address District</label>
			                            <div class="col-md-8 inputGroupContainer">
			                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span><input id="addressLine2" name="p_district" placeholder="Pemanent address's district" class="form-control" required="true" value="" type="text"></div>
			                            </div>
			                         </div>
			                         
			                         <div class="form-group">
			                            <label class="col-md-4 control-label">Hospital OP/IP Number</label>
			                            <div class="col-md-8 inputGroupContainer">
			                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span><input id="addressLine2" name="hospitalOPNumber" placeholder="Hospital OP/IP number" class="form-control" required="true" value="" type="number"></div>
			                            </div>
			                         </div>
			                         <div class="form-group center">
				                      		<div class="col-sm-offset-2 col-md-8 text-danger">
	        									${error }
	     									</div>   
				                      </div>
			                        
			                         <div class="form-group">
			                            <label class="col-md-4 control-label">DateOF Birth</label>
			                            <div class="col-md-8 inputGroupContainer">
			                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-heart-empty"></i></span><input id="city" name="DOB" placeholder="" class="form-control" required="true" value="" type="date"></div>
			                            </div>
			                         </div>
			                         
			                      <div class="form-group">
			                            <label class="col-md-4 control-label">Residential Address Pincode</label>
			                            <div class="col-md-8 inputGroupContainer">
			                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span><input id="addressLine2" name="t_pincode" placeholder="Residential address's pincode" class="form-control" required="true" value="" type="number"></div>
			                            </div>
			                         </div>
			                     
			                         <div class="form-group">
			                            <label class="col-md-4 control-label">Residential Address District</label>
			                            <div class="col-md-8 inputGroupContainer">
			                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span><input id="addressLine2" name="t_district" placeholder="Residential address's district" class="form-control" required="true" value="" type="text"></div>
			                            </div>
			                         </div>
			                         
			                         <div class="form-group">
			                            <label class="col-md-4 control-label">Contact Number</label>
			                            <div class="col-md-8 inputGroupContainer">
			                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span><input id="addressLine2" name="contactNumber" placeholder="Contact number" class="form-control" required="true" value="" type="number"></div>
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

  
  <div style="height:50px;"></div>
</body>
</html>
    