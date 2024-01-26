<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${user.username}</title>
<!-- Bootstrap: Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap: Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="resources/css/styles.css">
</head>
<body>
	<!-- TOP LEFT MENU BAR -->
	<div class="container-lg bg-info mx-auto p-4 d-flex justify-content-end">
		<table>
			<tr>
			<td><form action="logout.do">
				<button type="submit" class="btn btn-light m-2">Log Out</button>
			</form></td>
			<td><form action="goToTimeline.do">
				<button type="submit" class="btn btn-light m-2">View Timeline</button>
			</form></td>
		</table>
	</div>
	
	<!--  extra space -->
	<div class="m-5"></div>
	
	<!-- USER INFO -->
	<div class="container-lg mx-auto p-4 d-flex justify-content-center">
		<div id="profile_greeting" class="text-center"><h3>Hello, ${user.name}!	</h3></div>
	</div>
	<div id="account_info" class="container-lg mx-auto p-4 d-flex flex-row justify-content-around align-items-center">
		<div id="acocunt_info_pic" class="p-4">
			<div style="padding: 10px;" class="d-flex justify-content-center"><img src="images/${profpic_path}" alt="Profile picture" class="img-fluid"></div>
			<div style="margin-top: 5px; font-weight: bold; text-align: center;">
				<p>Upload Profile Picture</p>
				<form action="submitProfpic.do" method="post" enctype="multipart/form-data">
					<div class="d-flex flex-row align-items-center justify-content-center">
						<div><input type="file" class="form-control" name="profpicFile"/></div>
						<div><button type="submit" class="btn btn-light ms-2 border-secondary">Submit</button></div>
					</div>
				</form>
			</div>
		</div>
		<div id="account_info_text" class="d-flex flex-column">
			<div>
				<table class="table table-striped table-hover">
					<tr>
						<td>Username</td>
						<td>${user.username}</td>
					</tr>
					<tr>
						<td>Email</td>
						<td>${user.email}</td>
					</tr>
					<tr>
						<td>Account creation date</td>
						<td>${user.reg_date}</td>
					</tr>
				</table>
			</div>
			<div class="d-flex align-items-center justify-content-center">
				<div>
					<form action="updateAccount.do" method="get">
						<button type="submit" class="btn btn-light ms-2 border-secondary">Edit account details</button>
					</form>
				</div>
				<div>
					<form action="deleteAccount.do" method="get">
						<button type="submit" class="btn btn-light ms-2 border-secondary">Delete account</button>
					</form>
				</div>
			</div>	
		</div>
	</div>
	<hr>
	<div id="event_schedule_info" class="d-flex flex-row align-items-center justify-content-center">
		<div id="event_info">
			<form action="viewEventList.do" method="post">
				<button type="submit" class="btn btn-light ms-2 border-secondary">View my events</button>
			</form>
		</div>
		<div id="schedule_info">
			<form action="viewSchedule.do" method="get">
				<button type="submit" class="btn btn-light ms-2 border-secondary">View my schedule</button>
			</form>
		</div>
	</div>
	<hr>
	<div id="footer" class="container-fluid bg-light p-5">
	</div>
</body>
</html>