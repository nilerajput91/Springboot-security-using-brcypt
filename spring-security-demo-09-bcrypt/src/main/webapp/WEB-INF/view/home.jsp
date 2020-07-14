<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>

<head>
<title>Welcome to The Home Page of Luv2Code</title>
</head>
<body>
	<h2>Luv2Code Company Home Page</h2>
	<hr>
	Welcome to the Luv2code Home Page
	<hr>
	<!-- Display the user name and role -->
	<p>
		User:
		<security:authentication property="principal.username" />
		<br> <br> Role(s):
		<security:authentication property="principal.authorities" />

	</p>
	
	<security:authorize access="hasRole('MANAGER')">
		<!-- Add the Link to point to the Leaders....This for the Manager-->
		<p>
			<a href="${pageContext.request.contextPath}/leaders">Leadership
				Meeting</a> (Only for the Mangers People)
		</p>
	</security:authorize>

	<security:authorize access="hasRole('ADMIN')">
		<!--Add the Link to The Point to/System...this is for the admins  -->
		<p>
			<a href="${pageContext.request.contextPath}/systems">IT Systems
				Meetings</a> (Only for the It Peoples)

		</p>
	</security:authorize>


	<hr>


	<!-- Add the Logout Button  -->
	<form:form action="${pageContext.request.contextPath}/logout"
		method="POST">

		<input type="submit" value="Logout" />

	</form:form>

</body>
</html>