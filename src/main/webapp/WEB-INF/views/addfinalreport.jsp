<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Technician Report Page</title>
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
	<div id="nav-placeholder"></div>

	<script>
			$(function(){
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
					<div class="col-md-10 col-md-offset-1 text-center">
						<h4>Add Report TO The Sample</h4>
						<div class="table-responsive">


							<form class="well form-horizontal"
								action="/pathapp/addfinalreport/${sampleId }" method="post">
								<table id="mytable" class="table table-bordred table-striped">

									<thead>
										<th class="text-left">Sample ID</th>
										<th class="text-left">Test Reports of this sample</th>
										<th class="text-left">Write Report for the sample</th>
										<th class="text-left">SUBMIT Report</th>

									</thead>
									<tbody>

										<tr>




											<fieldset>
												<td>
													<div class="form-group">

														<div class="col-md-12 inputGroupContainer">
															<div class="input-group">${sampleId }</div>

														</div>
													</div>
												</td>

												
												<td>
												<div class="form-group">													
													<c:if test="${nosamplereports >0}">
														
															<c:forEach begin="0" end="${nosamplereports}" var="par"
																items="${samplereports}" varStatus="loop">
																<c:out value="${loop.index }-${par.testReport }" /><br>
															</c:forEach>
														
													</c:if>
													<c:if test="${nosamplereports ==0}">
															<c:out value="There were no reports requested for this sample" />
															
														
													</c:if>														
												</div>
												</td>
												<td>
													<div class="form-group">

														<div class="col-md-12 inputGroupContainer">
															<div class="input-group">
																<textarea id="resultOfReport" name="resultOfReport"
																	class="form-control" placeholder="input report" rows=10
																	cols=50></textarea>
															</div>

														</div>
													</div>
												</td>
												<td>
													<div class="form-group">

														<div class="col-md-12 inputGroupContainer">
															<div class="input-group">
																<div class="text-center">

																	<button class="btn btn-primary btn-lg" type="submit">Add</button>
																</div>
															</div>

														</div>
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






	<div style="height: 100px; text-align: center;">
		<small class="text-muted">PathLabs is a ISO:1998-2001
			certified sample testing lab under MP government and is maintained by
			private organization</small>
	</div>







</body>
</html>
