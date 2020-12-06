


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

</head>
<body>
	<h2></h2>
	<br>
	<br>
	<h2></h2>

	<!--Navigation bar-->
	<div id="nav-placeholder"></div>

	<script>
		$(function() {
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
					<h3 class="display-4">All reports from ${start } to ${end } for ${single.testType }</h3>
					<div class="btn-group-vertical">
								<br>
								<br>

								<button type="button" class="btn btn-primary page-scroll"
									data-toggle="modal" data-target="#search">VIEW</button>
								<a href="goback"><button type="button" class="btn btn-primary page-scroll"
									data-toggle="modal" data-target="#search">GO Back</button></a>

								

							</div>
				</div>
			</div>


		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="modal fade" id="search" tabindex="-1"
					role="dialog" aria-labelledby="myLargeModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4>Completed Reports</h4>

							<div class="table-responsive">


								<form class="well form-horizontal" action="addTestTo"
									method="post">
									<table id="mytable" class="table table-bordred table-striped">

										<thead>
											
											<th class="text-left">Sample ID</th>
											<th class="text-left">Test Report</th>
											<th class="text-left">Verdict</th>
											<th class="text-left">Report Date</th>
										</thead>
										<tbody>
											<c:forEach begin="0" end="${nosearch}" var="par"
												items="${search}">
												<tr>
													<td><c:out value="${par.sampleId }" /></td>
													<td><c:out value="${par.testReport}" /></td>
													<td><c:out value="${par.verdict}" /></td>
													<td><c:out value="${par.reportDate}" /></td>
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

	<div style="height: 80px;">
		<small class="text-muted">PathLabs is a ISO:1998-2001
			certified sample testing lab under MP government and is maintained by
			private organization</small>
	</div>
</body>
</html>
