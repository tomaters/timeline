<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Event</title>
<!-- Bootstrap: Latest compiled and minified CSS -->
<link	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap: Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container-sm bg-info mx-auto p-4 border-bottom">
		<h1 class="text-center text-muted">Update event</h1>
		<form action="logout.do">
			<div class="d-flex justify-content-end">
				<button type="submit" class="btn btn-light m-2">Log Out</button>
			</div>
		</form>
	</div>
		<form action="updateEvent.do" method="post" name="updateEventForm" onsubmit="return updateEventSuccess()">
			<input name="event_id" type="hidden" value="${event.event_id}">
			<input name="username" type="hidden" value="${username}">
			<div class="m-3">
				<table class="table table-bordered table-striped container-sm text-center w-75 mx-auto shadow">
					<tr>
						<td>Title</td>
						<td align="left"><input class="w-75 rounded" name="event_title" type="text" value="${event.event_title}"></td>
					</tr>
					<tr>
						<td>Username</td>
						<td align="left">${event.username}</td>
					</tr>
					<tr>
						<td>Event category</td>
						<td align="left">
							<div id="category_color">
								${event.event_category}
							</div>
							<div>
								<select id="event_category" name="event_category">
						            <option value="${event.event_category}">${event.event_category}</option>
						            <option value="Reminder">Reminder</option>
						            <option value="Important">Important</option>
						            <option value="Urgent">Urgent</option>
						            <option value="Other">Other</option>
				        		</select>
							</div>
						</td>
					</tr>
					<tr>
						<td>Description</td>
						<td align="left"><textarea class="p-2 overflow-auto rounded"
								name="event_description" cols="80" rows="10">${event.event_description}</textarea></td>
					</tr>
					<tr>
						<td>Event date</td>
						<td align="left">
							<div><fmt:formatDate value="${event.event_date}" pattern="MMMM d, yyyy" /></div>
							<div>
								<input type="date" name="event_date" id="event_date" value="${event.event_date}"/>
							</div>
						</td>
					</tr>
					<tr>
						<td>Creation date</td>
						<td align="left">${event.creation_date}</td>
					</tr>
					<tr>
						<td>Last modified date</td>
						<td align="left">${event.modified_date}</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><button type="submit" class="btn btn-light w-25 border-secondary" onclick="checkNull()">Update event</button></td>
					</tr>
				</table>
			</div>
		</form>
		<div class="d-flex justify-content-end p-5">
			<form action="deleteEvent.do" method="post">
				<input name="event_id" type="hidden" value="${event.event_id}">
				<input name="username" type="hidden" value="${username}">
				<button type="submit" class="btn btn-light ms-2 border-secondary">Delete this event</button>
			</form>
		</div>
	<hr>
	<div class="container-fluid bg-light p-5 d-flex justify-content-end">
		<form action="goToTimeline.do" method="post">
			<button type="submit" class="btn btn-light ms-2 border-secondary">Return to Timeline</button>
		</form>
	</div>
</body>
<script>
	function updateEventSuccess(){
		alert("Event updated successfully");
		return true;
	}
	
	function checkNull() {
		event.preventDefault();
		if(document.updateEventForm.event_title.value=="") {
			alert("Please enter a title");
			document.updateEventForm.event_title.focus();
			return;
		}
		if(document.updateEventForm.event_description.value==""){
			document.updateEventForm.event_description.focus();
			alert("Please enter a description");
			return;
		}
		document.updateEventForm.submit();
	}
</script>
</html>