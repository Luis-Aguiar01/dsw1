<%@page import="java.time.Year"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/general.css"/>
<title>Greeting</title>
</head> 
<body>
	<form action="greeting.jsp" method="GET">
		<div class="form-content">
			<label for="name">Name:</label>
			<input type="text" id="name" name="name" placeholder="Name" required>
		</div>
		
		<div class="form-content">
			<label for="email">Email:</label>
			<input type="text" id="email" name="email" placeholder="E-mail" required>
		</div>
		
		<div class="form-content">
			<label for="year-birth">Year of Birth:</label>
			<input type="number" id="year-birth" name="year-birth" placeholder="Year of Birth" required>
		</div>
		
		<div class="form-content">
			<input type="submit" value="Submit" id="button">
		</div>
	</form>
	
	<%
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String yearOfBirth = request.getParameter("year-birth");
		
		if (name != null && email != null && yearOfBirth != null) {
			int year;
			
			try {
				year = Integer.parseInt(yearOfBirth);
			}
			catch (NumberFormatException e) {
				year = 0;
			}
			
			int age = Year.now().getValue() - year;
			
			out.println("<p class='message sucess'>Bem vindo, " + name + "! Seu e-mail é " + email + " e você tem " + age + " anos.</p>");
		}
	%>
</body>
</html>