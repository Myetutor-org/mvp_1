<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyETutor</title>
</head>
<body>
	<div id="welcome" style="display: ${divWelcomeVisibility}">
		<h1>Welcome ${user.userName} ${user.userSurname}</h1>
		<p>Please note that the next step is the beginning of your
			evaluation. Every question should be answered within the time given
			in the right corner. Based on the question difficulty the time
			increases.</p>
		<p>
			Proceed to question form by pressing <a
				href="<c:url value="/questions" />" class="button-style">here</a>
		</p>
	</div>
	<div id="notification" style="display: ${divNotificationVisibility}">
		<span style="color: red"> ${errorMessage}</span>
	</div>
</body>
</html>