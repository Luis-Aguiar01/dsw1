<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="contacts" class="br.edu.ifsp.dsw1.ContactsBean" scope="application"/>

<%
	var id = request.getParameter("id");
	boolean exclude = false;
	
	if (id != null) {
		Long nId = Long.parseLong(id);
		var contact = contacts.findById(nId);
		contacts.removeContact(contact);
		exclude = true;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css"/>
<title>Delete Contact</title>
</head>
<body>
	<% if (exclude) {%>
		<h1 class="sucess">Contact exclude successfully.</h1>
	<%} else {%>
		<h1 class="erro">Contact not deleted.</h1>
	<%} %>
	
	<a href="index.jsp" class="back-button">
		<button id="button">Back</button>
	</a>
</body>
</html>