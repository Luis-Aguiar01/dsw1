<%@page import="br.edu.ifsp.dsw1.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="contacts" class="br.edu.ifsp.dsw1.ContactsBean" scope="application"/>

<%
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	boolean insert = false;
	
	if (email != null) {
		Contact contact = new Contact(name, phone, email);
		contacts.insertContact(contact);
		insert = true;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	* {
		font-family: monospace;
	}
	
	form {
		display: flex;
		flex-direction: column;
		max-width: 50%;
		margin: 0 auto;
		border: 1px solid #000;
		padding: 20px;
	}
	
	label {
		margin-top: 20px;
	}
	
	input {
		padding: 10px;
	}
	
	#submit {
		margin-top: 10px;
	}
</style>
<title>New Contact</title>
</head>
<body>
	<% if (!insert) { %>
		<form action="new-contact.jsp" method="POST">
			<label for="name">Name:</label>
			<input type="text" id="name" name="name" required>
			
			<label for="phone">Phone:</label>
			<input type="text" id="phone" name="phone" required>
			
			<label for="email">E-mail:</label>
			<input type="email" id="email" name="email" required>
			
			<input type="submit" value="Submit" id="submit">
		</form>
	<% } else { %>
		<h1>Contact insert successfully.</h1>
		<a href="index.jsp">Back</a>
	<% } %>
</body>
</html>