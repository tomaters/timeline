<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HMTL 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<!-- Bootstrap: Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap: Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div
		class="container-lg bg-info mx-auto p-4 border-bottom d-flex justify-content-end">
		<table>
			<tr>
				<td><form action="home.jsp">
						<button type="submit" class="btn btn-light m-2">Return to Home</button>
					</form></td>
				<td><form action="createAccount.jsp">
						<button type="submit" class="btn btn-light m-2">Create an	Account</button>
					</form></td>
		</table>
	</div>
	<!-- MAIN -->
	<div class="container-sm mx-auto p-4 border-bottom">
		<h4 class="text-center text-muted">Log In</h4>
		<hr />
		<form action="login.do" method="post" name=loginForm>
			<table
				class="container table text-center table-bordered w-75 mx-auto table-striped shadow">
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
						<button type="submit" class="btn btn-light w-25" onclick="checkNull()">Log In</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script>
	function checkNull() {
		event.preventDefault();
		if(document.loginForm.username.value=="") {
			alert("Please enter a username");
			document.loginForm.username.focus();
			return;
		}
		if(document.loginForm.password.value==""){
			document.loginForm.password.focus();
			alert("Please enter a password");
			return;
		}
		document.loginForm.submit();
	}
</script>
</html>