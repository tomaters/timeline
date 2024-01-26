<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Timeline</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap: Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<!-- CSS -->
<link rel="stylesheet" href="resources/css/styles.css">

<body>
	<!-- TOP LEFT MENU BAR -->
	<div class="container-lg bg-info mx-auto p-4 border-bottom d-flex justify-content-end">
		<table>
			<tr>
			<td><form action="logout.do">
				<button type="submit" class="btn btn-light m-2">Log Out</button>
			</form></td>
			<td><form action="myAccount.do">
				<button type="submit" class="btn btn-light m-2">My Account</button>
			</form></td>
		</table>
	</div>
	
	<!--  extra space -->
	<div class="m-5"></div>
	
	<!-- USER INFO -->
	<div class="container-lg mx-auto p-4 d-flex justify-content-end">
		<div id="welcome_profile" class="p-3">
				<div id="profile_greeting" class="text-center">Hello, ${user.name}</div>
				<div class=""><img src="images/${profpic_path}" alt="Profile picture" class="img-fluid"></div>
		</div>
	</div> <hr>
	
	<!-- TIMELINE -->
	<div class="container-fluid mx-auto p-4 d-flex justify-content-end">
	    <h1 class="mx-auto">Timeline</h1>
	    <form action="createEvent.do" method="get">
	        <button type="submit" class="btn btn-light border-secondary">Create an event</button>
	    </form>
	    <div class="d-flex justify-content-center flex-row align-items-center">
	    	<div>
	    	</div>
	    </div>
	</div> <hr>
	<div class="container-fluid bg-light p-4">
	</div>
</body>
</html>