<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/general.css"/>
<link rel="stylesheet" type="text/css" href="style.css"/>
<meta charset="ISO-8859-1">
<title>Multiplication Table</title>
</head>
<body>

	<form action="multiplication-table.jsp" method="POST">
		<div class="form-content">
			<label for="">Number:</label>
			<input type="number" name="number" id="number" placeholder="Insert the number" required>
		</div>
			
		<div class="form-content">
			<input type="submit" value="Submit" id="button">
		</div>
	</form>

	<%
		String number = request.getParameter("number");
		boolean sucess = true;
		
		if (number != null) {
			int nNumber;
			
			try {
				nNumber = Integer.parseInt(number);
			}
			catch (NumberFormatException e) {
				sucess = false;
				nNumber = 1;
			}		
	%>		
			<% if (sucess) {%>
				<h2 class="message sucess">Multiply Table of <%= nNumber %>:</h2>
				<table border="1">
					<tr>
						<th>Number</th>
						<th>Multiplier</th>
						<th>Result</th>
					</tr>
					<% for (int i = 1; i <= 10; i++) {%>
					<tr>
						<td><%= nNumber %></td>
						<td><%= i %></td>
						<td><%= nNumber * i %></td>
					</tr>
					<% } %>
				</table>
			<%} else { 
					out.println("<p class='message erro'>Erro: Invalid Number.</p>");
				}
			%>
	<% } %>
</body>
</html>