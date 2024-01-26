<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HMTL 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete account</title>
<!-- Bootstrap: Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap: Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
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
	
	<!-- MAIN -->
	<div class="container-sm mx-auto p-4 border-bottom">
		<h4 class="text-center text-muted">Delete account?</h4>
		<hr />
		<form action="deleteAccount.do" method="post" onsubmit="return deletionSuccess()">
			<table
				class="container table text-center table-bordered w-50 mx-auto table-dark shadow">
				<tr>
					<td class="p-2 align-middle">Username</td>
					<td align="left"><input type="text" name="username"
						class="w-75 rounded bg-light" placeholder="Enter username" /></td>
				</tr>
				<tr>
					<td class="p-2 align-middle">Password</td>
					<td align="left"><input type="password" name="password"
						class="w-75 rounded bg-light" placeholder="Enter password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-light w-25" onclick="return confirmDelete()">Delete account</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script>
	function confirmDelete(){
		var isConfirmed = confirm("Are you sure you want to delete your account?")
		if(isConfirmed){
			return true;
		}
		else {
			return false;
		}
	}
	function deletionSuccess() {
		alert("Account deleted successfully");
		return true;
	}
</script>
</html>