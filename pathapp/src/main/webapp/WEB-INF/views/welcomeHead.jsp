<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Head Home</title>
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
			  $("#nav-placeholder").load("navhead");
			});
			</script>
			<!--end of Navigation bar-->

   <!-- ============= banner ============= -->
    <div id="home" class="banner" style="background-image: url(resources/images/head.jpg);">
      <div class="overlay"></div>
      <div class="banner-content">
        <div class="container">
          <div class="row">
            <div class="col-md-10 col-md-offset-1 text-center">
              <button type="button" class="btn btn-primary page-scroll" data-toggle="modal" data-target="#tech">View and Delete Technicians</button>
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#test">Allot and delete Tests</button>
              <br>
              <br>
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addtest">Add Tests</button>
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#incompletetest">Incompleted Tests and respective technicians</button>
              <br>
              <br>
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#allpatients">All Patient details</button>
              
            </div>
          </div>
        </div> 
      </div>
    </div>
    


    <!-- Technicians modal -->
								 <div class="container">
								<div class="row">
										
								        
								        <div class="col-md-6">
								
								<div class="modal fade" id="tech" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
								  <div class="modal-dialog modal-lg">
								    <div class="modal-content">
								     	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								        	<span aria-hidden="true">&times;</span>
       									</button>
								        <h4>Technicians</h4>
								        <div class="table-responsive">
								
								                
								              <table id="mytable" class="table table-bordred table-striped">
								                   
								                   <thead>
								                   
								                      <th><input type="checkbox" id="checkall" /></th>
								                      <th>Technician ID</th>
								                      <th>Name</th>
								                      <th>Degree</th>
								                      <th>Year Of Passing Degree</th>
								                      <th>Email</th>
								                      <th>Phone Number</th> 
								                      <th>Edit</th>
								                      <th>Delete</th> 
								                   </thead>
								    <tbody>
								    
								
								              	
								       <c:forEach begin="0" end="${noTech}" var="par"
																		items="${tech}">
												<tr>
													<td><input type="checkbox" class="checkthis" /></td>
													<td><c:out value="${par.t_ID }" /></td>
													<td><c:out value="${par.name}" /></td>
													<td><c:out value="${par.degree}" /></td>
													<td><c:out value="${par.yearOfPassing}" /></td>
													<td><c:out value="${par.emailId}" /></td>
													<td><c:out value="${par.phoneNumber}" /></td>
													<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
																<td><p data-placement="top" data-toggle="tooltip" title="Delete">
																<a href="delete/${par.t_ID}" >
																<button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button>
																</a></p></td>
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
								
								<div class="modal fade" id="test" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
								  <div class="modal-dialog modal-lg">
								    <div class="modal-content">
								     
								        
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								        	<span aria-hidden="true">&times;</span>
       									</button>
       									<h4>Tests</h4>
								        <div class="table-responsive">
								
								                
								              <table id="mytable" class="table table-bordred table-striped">
								                   
								                   <thead>
								                   
								                      <th><input type="checkbox" id="checkall" /></th>
								                      <th>Test ID</th>
								                      <th>Test Type/Name</th>
								                      <th>Handling Technician</th>
								                      
								                      <th>Edit Handling Technician</th>
								                      <th>Delete</th> 
								                   </thead>
												    <tbody>								              	
												       <c:forEach begin="0" end="${noTest}" var="par"
																						items="${test}">
																<tr>
																	<td><input type="checkbox" class="checkthis" /></td>
																	<td><c:out value="${par.testId }" /></td>
																	<td><c:out value="${par.testType}" /></td>
																	<td><c:out value="${par.t_ID}" /></td>
																	<td>
																			<form class ="well form-horizontal" action="editTech/${par.testId}" method ="post">
						
																	        	<fieldset>
															                         <div class="form-group">
															                            <label class="col-md-4 control-label">Technician Id</label>
															                            <div class="col-md-8 inputGroupContainer">
															                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span><input id="t_ID" name="t_ID" class="form-control" required="true" value="${par.t_ID }" type="number"></div>
															                            		<p data-placement="top" data-toggle="tooltip" title="Edit">
															                         				<button class="btn btn-primary btn-xs" type="submit" ><span class="glyphicon glyphicon-pencil"></span></button>
															                  		 			</p>
															                            </div>
															                         </div>
															                         
															                  </fieldset>
																		   </form>
																			
																		
																		
																	</td>
																	<td><p data-placement="top" data-toggle="tooltip" title="Delete">
																		<a href="deleteT/${par.testType}" >
																			<button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button>
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
<!-- Add Tests modal -->
				<div class="container">
					<div class="row">
						<div class="col-md-6">
								<div class="modal fade" id="addtest" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
								  <div class="modal-dialog modal-lg">
								    <div class="modal-content">
								     
								        
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								        	<span aria-hidden="true">&times;</span>
       									</button>
       									
       									<h4>		ADD Tests</h4>
       									
								        <div class="table-responsive">
								
								               
											<form class ="well form-horizontal" action="addTestTo" method ="post">
								              <table id="mytable" class="table table-bordred table-striped">
								                   
								                   <thead>
								                      <th class="text-center" >Test Type/Name</th>
								                      <th class="text-center">Handling Technician</th>
								                      <th class="text-center">Submit</th>
								       
								                   </thead>
												    <tbody>								              	
												       
													<tr>
															
															
														
	
												        	<fieldset>
												        	<td>
										                         <div class="form-group">
										                            
										                            <div class="col-md-12 inputGroupContainer">
										                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span><input id="testType" name="testType" placeholder="Test Type[MAX 6 letters]" class="form-control" required="true" value="" type="text"></div>
										                            		
										                            </div>
										                         </div>
										                     </td>
										                     <td>
										                         <div class="form-group">
										                            
										                            <div class="col-md-12 inputGroupContainer">
										                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span><input id="t_ID" name="t_ID" placeholder="Technician Id(only the available technitians)" class="form-control" required="false" value="" type="number"></div>
										                            </div>
										                         </div>
										                     </td>
										                     <td>
										                     <div class="text-center">
										                        
										                         				<button class="btn btn-primary btn-lg" type="submit" >Add</button>
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
								<div class="modal fade" id="incompletetest" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
								  <div class="modal-dialog modal-lg">
								    <div class="modal-content">
								     
								        
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								        	<span aria-hidden="true">&times;</span>
       									</button>
       									
       									<h4>		Incompleted Tests and respective patients</h4>
       									
								        <div class="table-responsive">
								
								               
											<form class ="well form-horizontal" action="addTestTo" method ="post">
								              <table id="mytable" class="table table-bordred table-striped">
								                   
								                   <thead>
								                      <th class="text-left" >Technician ID</th>
								                      <th class="text-left">Sample ID</th>
								                      <th class="text-left">Patient ID</th>
								       				  <th class="text-left">Test ID</th>
								                   </thead>
												   <tbody>								              	
													   <c:forEach begin="0" end="${noit}" var="par"
																			items="${it}">
																<tr>
																	
																	<td><c:out value="${par.t_ID }" /></td>
																	<td><c:out value="${par.sampleId}" /></td>
																	<td><c:out value="${par.p_ID}" /></td>
																	<td><c:out value="${par.testId}" /></td>
																	
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


<!-- Incompleted tests modal -->
				<div class="container">
					<div class="row">
						<div class="col-md-6">
								<div class="modal fade" id="allpatients" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
								  <div class="modal-dialog modal-lg">
								    <div class="modal-content">
								     
								        
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								        	<span aria-hidden="true">&times;</span>
       									</button>
       									
       									<h4>		All patients details</h4>
       									
								        <div class="table-responsive">
								
								               
											<form class ="well form-horizontal" action="addTestTo" method ="post">
								              <table id="mytable" class="table table-bordred table-striped">
								                   
								                   <thead>
								                      <th class="text-left" >Patient Id</th>
								                      <th class="text-left">Name</th>
								                      <th class="text-left">Sex</th>
								       				  <th class="text-left">Permanent Pincode</th>
								       				  <th class="text-left">Permanent District</th>
								       				  <th class="text-left">Hospital OP/IP Number</th>
								       				  <th class="text-left">DOB</th>
								       				  <th class="text-left">Residential Pincode</th>
								       				  <th class="text-left">Residential District</th>
								       
								       				  <th class="text-left">Contact Number</th>
								       				  
								                   </thead>
												   <tbody>								              	
													   <c:forEach begin="0" end="${noPatient}" var="par"
																			items="${patients}">
																<tr>
																	
																	<td><c:out value="${par.p_ID }" /></td>
																	<td><c:out value="${par.name}" /></td>
																	<td><c:out value="${par.sex}" /></td>
																	<td><c:out value="${par.p_pincode}" /></td>
																	<td><c:out value="${par.p_district}" /></td>
																	<td><c:out value="${par.hospitalOPNumber}" /></td>
																	<td><c:out value="${par.DOB}" /></td>
																	<td><c:out value="${par.t_pincode}" /></td>
																	<td><c:out value="${par.t_district}" /></td>
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
  <div style="height:100px;text-align: center;">
  	 <small class="text-muted" >PathLabs is a ISO:1998-2001 certified sample testing lab under MP government and is maintained by private organization</small>
  </div>





        

</body>
</html>
