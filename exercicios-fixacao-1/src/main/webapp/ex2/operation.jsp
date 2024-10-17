<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/general.css"/>
<title>Operation</title>
</head>
<body>
	<form action="operation.jsp" method="POST">
		
		<div class="form-content">
			<label for="number1">First Number:</label>
			<input type="number" id="number1" name="number1" placeholder="First Number" required>
		</div>

		<div class="form-content">
			<label for="number2">Second Number:</label>
			<input type="number" id="number2" name="number2" placeholder="Second Number" required>
		</div>

		<div class="form-content form-checkbox">
			<label for="sum">
				<input type="radio" name="operation" id="sum" value="+" required> +
			</label>
			
			<label for="minus">
				<input type="radio" name="operation" id="minus" value="-" required> -
			</label>
			
			<label for="multiply">
				<input type="radio" name="operation" id="multiply" value="*" required> *
			</label>
			
			<label for="division">
				<input type="radio" name="operation" id="division" value="/" required> /
			</label>
		</div>
			
		<div class="form-content">
			<input type="submit" value="Submit" id="button">
		</div>
	</form>
	
	<% 
		String firstNumber = request.getParameter("number1");
		String secondNumber = request.getParameter("number2");
		String operation = request.getParameter("operation");
	
		if (firstNumber != null && secondNumber != null && operation != null) {
			int first;
			int second;
			boolean isValid = true;
					
			try {
				first = Integer.parseInt(firstNumber);
				second = Integer.parseInt(secondNumber);
			}
			catch (NumberFormatException e) {
				first = 0;
				second = 0;
				isValid = false;
				out.println("<p class='message erro'>Erro: Invalid number format.</p>");
			}
			
			if (isValid) {
				int result = 0;
				boolean isError = false;
				
				switch(operation) {
					case "+": 
						result = first + second;
						break;
					case "-": 
						result = first - second;
						break;
					case "*":
						result = first * second;
						break;
					case "/": 
						if (second == 0) {
							isError = true;
							out.println("<p class='message erro'>Erro: Cannot divide by zero.</p>");
						}
						else {
							result = first / second;
						}
						break;
					default: 
						isError = true;
						out.println("<p class='message erro'>Erro: Invalid operation.</p>");
				}
				
				if (!isError) {
					out.println("<p class='message sucess'>"+ "Resultado: " + first + " " + operation + " " + second + " = " + result + "</p>");
				}
			}
		}
	%>
</body>
</html>