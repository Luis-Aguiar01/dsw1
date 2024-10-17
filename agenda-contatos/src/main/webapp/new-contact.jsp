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
<link rel="stylesheet" type="text/css" href="style.css"/>
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
			
			<input type="submit" value="Submit" id="button">
		</form>
	<% } else { %>
		<h1 class="sucess">Contact insert successfully.</h1>
	<% } %>
	
	<a href="index.jsp" class="back-button">
		<button id="button">Back</button>
	</a>
</body>
</html>