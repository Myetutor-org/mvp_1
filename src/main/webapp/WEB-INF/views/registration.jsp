<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>MyETutor</title>
<link href="<c:url value="/resources/css/style.css" />"
		rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<h1>Welcome to the MyeTutor</h1>
	<div id="form">
		<P>Please note that this is an alpha version of the evaluation
			form of the myetutor.org platform.</P>
		<form:form modelAttribute="userForm" method="POST" action="register"> 
			<div id="name">Name:<form:input path="userName" /></div>
			<br />
			<br /> 
			<div id="surname">Surname:<form:input path="userSurname" /></div>
			<br />
			<br />
			<div id="email">E-mail:<form:input path="userEmail" /></div>
			<br />
			<br />
			<div id="telno">Telephone No:<form:input path="userTelNo" /></div>
			<br />
			<br />
			<input type="submit" value="Register" />
		</form:form>
	</div>
</body>
</html>
