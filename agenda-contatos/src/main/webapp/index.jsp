<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="contacts" class="br.edu.ifsp.dsw1.ContactsBean" scope="application"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contacts</title>
</head>
<body>
	<h1>Contacts List</h1>
	<table border="1">
		<thead>	
			<tr>
				<td>Name:</td>
				<td>Phone:</td>
				<td>E-mail:</td>
				<td>Actions:</td>
			</tr>
		</thead>
		<tbody>
			<% for (var contact : contacts.findAll()) { %>
				<tr>
					<td><%= contact.getName() %></td>
					<td><%= contact.getPhone() %></td>
					<td><%= contact.getName() %></td>
					<td><a href="delete-contact.jsp?id=<%= contact.getId() %>">Delete</a></td>
				</tr>
			<% } %>
		</tbody>
	</table>
</body>
</html>