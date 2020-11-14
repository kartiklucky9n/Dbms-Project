<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TO BET EDITED!</title>
<link rel="stylesheet" href="resources/css/landing.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
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
<script>
$(document).ready(function() {
    $("#MyModal").modal();
  });

</script>
<script>$(document).ready(function(){
$("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    $("[data-toggle=tooltip]").tooltip();
});</script>


</head>
<body>

<h2></h2>

			<!--Navigation bar-->
			<div id="nav-placeholder">
			
			</div>
			
			<script>
			$(function(){
			  $("#nav-placeholder").load("navtech");
			});
			</script>
			<!--end of Navigation bar-->

   <!-- ============= banner ============= -->
    <div id="home" class="banner" style="background-image: url(resources/images/sample.jpg);">
      <div class="overlay"></div>
      <div class="banner-content">
        <div class="container">
          <div class="row">
            <div class="col-md-10 col-md-offset-1 text-center">
              <button type="button" class="btn btn-success" data-toggle="modal" data-target="#viewsamples">View Alloted Samples</button>
              
              
            </div>
          </div>
        </div> 
      </div>
    </div>
    


    <!-- Technicians modal -->
								 <div class="container">
								<div class="row">
										
								        
								        <div class="col-md-6">
								
								<div class="modal fade" id="viewsamples" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
								  <div class="modal-dialog modal-lg">
								    <div class="modal-content">
								     	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
								    
								
								              	
								       <c:forEach begin="0" end="${nort}" var="par"
																		items="${rt}">
												<tr>
													
													<td><c:out value="${par.sampleId }" /></td>
													<td><c:out value="${par.testId}" /></td>
													<td>
														<c:if test = "${par.completed == false}">
													         <c:out value = "Test Not Done"/>
													    </c:if>
														<c:if test = "${par.completed == true}">
													         <c:out value = "Test is Done"/>
													    </c:if>
													</td>
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
  
  

  <div style="height:100px;text-align: center;">
  	 <small class="text-muted" >PathLabs is a ISO:1998-2001 certified sample testing lab under MP government and is maintained by private organization</small>
  </div>





        

</body>
</html>
