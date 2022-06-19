<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>

<html>

<head>
	<title>List Customers</title>
	
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
		integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
		crossorigin="anonymous">
</head>

<body>

	<div class="container">
		<div id="wrapper">
			<div id="header">
				<h2>CRM - Customer Relationship Manager</h2>
				<hr />
			</div>
		</div>
		
		<div id="container">
		
			<div id="content">
			
				<!-- put new button: Add customer -->
				<input type="button" value="Add customer"
					   onclick="window.location.href='showFormForAdd'; return false;"
					   class="btn btn-primary btn-sm mb-3"/>
			
				<!--  add our html table here -->
				<table class="table table-bordered table-striped">
					<thead class="thead-dark">
						<tr>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Action</th>
						</tr>
					</thead>
					
					<tbody>
						<!-- loop over and print our customers -->
						<c:forEach var="tempCustomer" items="${customers}">
						
							<!-- construct an "update" link with customer id -->
							<c:url var="updateLink" value="/customer/showFormForUpdate">
								<c:param name="customerId" value="${tempCustomer.id}" />
							</c:url>					
		
							<!-- construct an "delete" link with customer id -->
							<c:url var="deleteLink" value="/customer/delete">
								<c:param name="customerId" value="${tempCustomer.id}" />
							</c:url>					
							
							<tr>
								<td> ${tempCustomer.firstName} </td>
								<td> ${tempCustomer.lastName} </td>
								<td> ${tempCustomer.email} </td>
								
								<td>
									<!-- display the update link -->
									<a href="${updateLink}">Update</a>
									|
									<a href="${deleteLink}"
									   onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
								</td>
								
							</tr>
						
						</c:forEach>
					<tbody>
					
				</table>
					
			</div>
		
		</div>
	</div>

</body>

</html>









