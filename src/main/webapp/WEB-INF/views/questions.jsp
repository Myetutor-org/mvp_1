<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to the Test</title>
</head>
<body>
	<h1>Question ${questionID}:</h1>
	<h3>${questionText}</h3>
	<div id="form">
		<P>Enter your Answer:</P>
		<form:form modelAttribute="newUserAnswer" method="POST" action="questions"> 
			<div id="answer"><form:input path="useranswerText" /></div>
			<div id="explanation" style="display: ${questionExplanation}">
			<p>Explanation</p>
			<form:input path="useranswerExplanation" /></div>
			<input type="submit" value="Answer" />
		</form:form>
	</div>
</body>
</html>