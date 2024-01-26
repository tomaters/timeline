<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update account</title>
<!-- Bootstrap: Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap: Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="resources/css/styles.css">
</head>
<body>
<div class="d-flex flex-column">
		<!-- TOP LEFT MENU BAR -->
	<div class="container-lg bg-info mx-auto p-4 border-bottom d-flex justify-content-end">
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
	<form action="updateAccount.do" name="updateAccountForm" method="post" onsubmit="return updateSuccess()">
		<div class="d-flex justify-content-center m-3">
			<h4 text-align="center">Update account information</h4>
		</div>
		<div class="container-lg mx-auto m-3 p-3">
			<table class="table table-striped w-50 mx-auto">
				<tr>
					<td>Username</td>
					<td><input class="w-75" type="text" name="username" value="${user.username}"/></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input class="w-75" type="password" name="password" placeholder="Enter password"/></td>
				</tr>
				<tr>
					<td>Name</td>
					<td><input class="w-75" type="text" name="name" value="${user.name}"/></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input class="w-75" type="text" name="email" value="${user.email}"/></td>
				</tr>
				<tr>
					<td>Account creation date</td>
					<td><input class="w-75" type="text" name="reg_date" value="${user.reg_date}" readonly/></td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="d-flex justify-content-center">
							<button type="submit" class="btn btn-light w-50 border-secondary m-2" onclick="checkNull()">Submit</button>
						</div>
					</td>
				</tr>
			</table>
		</div>	
	</form>
</body>
<script>
	function updateSuccess(){
		alert("Account updated successfully");
		return true;
	}
	
	function checkNull() {
		event.preventDefault();
		if(document.updateAccountForm.username.value=="") {
			alert("Please enter a username");
			document.updateAccountForm.username.focus();
			return;
		}
		if(document.updateAccountForm.password.value==""){
			document.updateAccountForm.password.focus();
			alert("Please enter a password");
			return;
		}
		if(document.updateAccountForm.name.value==""){
			document.updateAccountForm.name.focus();
			alert("Please enter a name");
			return;
		}
		if(document.updateAccountForm.email.value==""){
			document.updateAccountForm.email.focus();
			alert("Please enter an email");
			return;
		}
		document.updateAccountForm.submit();
	}
</script>
</html>