<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User event list</title>
<!-- Bootstrap: Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap: Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container-lg bg-info mx-auto p-4 border-bottom">
		<!-- name set as session attribute upon login -->
		<h1 class="text-center text-muted">${user.username} event list</h1>
		<div class="d-flex justify-content-end p-3">
			<div class="mx-2">
				<form action="logout.do" method="get">
					<button type="submit" class="btn btn-light border-secondary">Log out</button>
			    </form>
			</div>
			<div>
				<form action="myAccount.do" method="get">
					<button type="submit" class="btn btn-light border-secondary">View account info</button>
			    </form>
			</div>
	  </div>
	 </div>				

	<div class="container-lg p-3">
		<!-- Search function -->
		<form action="viewEventList.do" method="post">
			<table class="table text-center table-bordered table-striped w-75 mx-auto shadow-lg">
				<tr>
					<td align="right">
						<div class="mx-2 d-flex justify-space-between">
							<div>
							    <input type="checkbox" id="futureEventsCheckbox" name="futureEvents" value="true">
    							<label for="futureEventsCheckbox">Show only future events</label>
							</div>
							<div>
								Search by category
								<select name="searchKeyword">
									<option value="">Select option</option>
									<c:forEach items="${conditionMap}" var="data">
										<option value="${data.value}">${data.key}</option>
									</c:forEach>
								</select>
								<input type="submit" value="Search"/>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>

		<table class="table table-bordered table-hover text-center table-striped table-sm w-75 mx-auto shadow">
			<thead>
				<tr>
					<th>Title</th>
					<th>Date</th>
					<th>Category</th>
				</tr>
			</thead>

			<c:forEach items="${eventList}" var="event">
				<tr>
					<td><a class="text-decoration-none" href="viewEvent.do?event_id=${event.event_id}">${event.event_title}</a></td>
					<td> <fmt:formatDate value="${event.event_date}" pattern="MMMM d, yyyy" /></td>
					<td>${event.event_category}</td>
				</tr>
			</c:forEach>
		</table> 
		<div class="d-flex justify-content-end">
		<form action="createEvent.do" method="get">
	      <button type="submit" class="btn btn-light border-secondary">Create an event</button>
	    </form>
	    </div>
	</div>
	
	<div class="container-fluid bg-light p-5">
	</div>
</body>
</html>