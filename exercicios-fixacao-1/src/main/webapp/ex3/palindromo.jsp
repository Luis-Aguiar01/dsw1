<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/general.css"/>
<title>Palindrome</title>
</head>
<body>
	
	<form action="palindromo.jsp" method="POST">
		<div class="form-content">
			<label for="value">Write the word:</label>
			<input type="text" name="value" id="value" placeholder="Write the word" class="input">
		</div>
		
		<div class="form-content">
			<input type="submit" value="Submit" id="button">
		</div>
	</form>
	
	<% 
		String word = request.getParameter("value");
		
		if (word != null) {
			
			int size = word.length();
			boolean isPalindrome = true;
			int i = 0;
			
			while (isPalindrome && i != size / 2) {
				if (word.charAt(i) != word.charAt(size - 1 - i)) {
					isPalindrome = false;
				}
				i++;
			}
		
			String result;
			
			if (isPalindrome) {
				result = "A palavra \"" + word + "\" é um palíndromo.";
				out.println("<p class='message sucess'>" + result + "</p>");
			}
			else {
				result = "A palavra \"" + word + "\" não é um palíndromo.";
				out.println("<p class='message erro'>" + result + "</p>");
			}	
		}
	%>
</body>
</html>