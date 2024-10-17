<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="contacts" class="br.edu.ifsp.dsw1.ContactsBean" scope="application"/>
<jsp:useBean id="contact" class="br.edu.ifsp.dsw1.Contact" scope="request"/>
<jsp:setProperty name="contact" property="id" param="id"/>
<jsp:setProperty name="contact" property="name" param="name"/>
<jsp:setProperty name="contact" property="phone" param="phone"/>
<jsp:setProperty name="contact" property="email" param="email"/>

<% 
	Long id = contact.getId();
	String name = contact.getName();
	String phone = contact.getPhone();
	String email = contact.getEmail();
	boolean wasUpdated = false;
	
	if (name != null) {
		
		try {
			
			var findContact = contacts.findById(id);
			
			findContact.setEmail(email);
			findContact.setName(name);
			findContact.setPhone(phone);
			
			wasUpdated = true;
		}
		catch (IllegalArgumentException e) {
			out.println(e.getMessage());
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css"/>
<title>Update Contact</title>
</head>
<body>
	<% if (!wasUpdated) { %>
		<form action="update-contact.jsp?id=<%= id %>" method="POST">
			<label for="name">Name:</label>
			<input type="text" id="name" name="name" required>
			
			<label for="phone">Phone:</label>
			<input type="text" id="phone" name="phone" required>
			
			<label for="email">E-mail:</label>
			<input type="email" id="email" name="email" required>
			
			<input type="submit" value="Submit" id="button">
		</form>
	<% } else { %>
		<h1 class="sucess">Contact updated successfully.</h1>
	<% } %>
	
	<a href="index.jsp" class="back-button">
		<button id="button">Back</button>
	</a>
</body>
</html>