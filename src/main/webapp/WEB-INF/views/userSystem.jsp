<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${user }Login</title>
<link rel="stylesheet" href="resources/css/form.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>
<body>


	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first">
				<h3>${user}</h3>
				<img src="resources/images/user.jpg" id="icon" alt="User Icon" />

			</div>

			<!-- Login Form -->
			<form action="processUserForm" method="post">
				<input type="number" id="login" class="fadeIn second"
					name="technicianUId" placeholder="TechnicianId"> <input
					type="password" id="login" class="fadeIn third" name="password"
					placeholder="password"> <input type="submit"
					class="fadeIn fourth" value="Log In">
					
			</form>

			<!-- Remind Passowrd -->
			<div id="formFooter">
				<a class="underlineHover" href="#">${error}</a>
				<a class="fadeIn fifth" href="index">Go Back</a>
				
			</div>

		</div>
	</div>
</body>
</html>