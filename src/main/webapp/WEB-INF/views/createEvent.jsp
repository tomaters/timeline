<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Event</title>
<!-- Bootstrap: Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap: Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">	
</head>
<body>
	<div class="container-sm bg-info mx-auto p-4 border-bottom">
		<h1 class="text-center text-muted">Add an event</h1>
		<div align="right">
			<form action="logout.do">
				<button type="submit" class="btn btn-light m-2">Log Out</button>
			</form>
		</div>
	</div>
	<div class="m-3 p-3">
		<form action="createEvent.do" method="post" name="writeform">
			<!-- hidden input field to hold id value -->
			<input type="hidden" name="username" value="${user.username}"> 
			<table class="table text-center table-bordered table-striped w-75 mx-auto shadow">
				<tr>
					<td>Title</td>
					<td align="left"><input class="w-75 rounded" type="text" name="event_title"></td>
				</tr>
				<tr>
					<td>Username</td>
					<td align="left">${user.username}</td>
				</tr>
				<tr>
					<td>Event date</td>
					<td align="left"> 
        				<input type="date" id="event_date" name="event_date">
				</tr>
				<tr>
					<td>Description</td>
					<td align="left"><textarea name="event_description" rows="10" cols="80" class="p-2 overflow-auto rounded"></textarea></td>
				</tr>
				<tr>
					<td>Category</td>
					<td align="left">
				        <select id="event_category" name="event_category">
				            <option value="">Select category</option>
				            <option value="Reminder">Reminder</option>
				            <option value="Important">Important</option>
				            <option value="Urgent">Urgent</option>
				            <option value="Other">Other</option>
				        </select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="button" class="btn btn-secondary w-25" onclick="checkNull()" value="Add event"/></td>
				</tr>
			</table>
		</form>
	</div> <hr>
		<div class="container-fluid bg-light p-5 d-flex justify-content-end">
			<form action="goToTimeline.do" method="post">
				<button type="submit" class="btn btn-light ms-2 border-secondary">Return to Timeline</button>
			</form>
		</div>
</body>

	<script>
		function checkNull() {
			if(document.writeform.event_title.value=="") {
				alert("Please enter a title");
				document.writeform.event_title.focus();
				return;
			}
			if(document.writeform.username.value==""){
				document.writeform.username.focus();
				alert("Error: you are not logged in");
				return;
			} 
			if(document.writeform.event_date.value==""){
				alert("Please select the event date");
				document.writeform.event_date.focus();
				return;
			}
			if(document.writeform.event_description.value==""){
				alert("Please enter the event description");
				document.writeform.event_description.focus();
				return;
			}
			if(document.writeform.event_category.value==""){
				alert("Please select a category")
				document.writeform.event_category.focus();
				return;
			}
			document.writeform.submit();
		}
	</script>

	<style>
        #event_category option[value="urgent"] {
            text-color: red;
        }

        #event_category option[value="important"] {
            text-color: orange;
        }

        #event_category option[value="reminder"] {
            text-color: yellow;
        }

        #event_category option[value="other"] {
            text-color: green;
        }
    </style>
</html>