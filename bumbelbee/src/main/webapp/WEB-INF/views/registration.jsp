<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Employee Registration Form</title>

<style>

	.error {
		color: #ff0000;
	}
	.textfeild{
		margin-top:10%;
		margin-bottom:7%;
		margin-left:20%;
		width:150%;
	    border: 0px;
	    border-bottom-width: 1px;
	    border-bottom-color: black;
	    border-bottom-style: solid;
	}
	.textLabel{
		/* margin-left:1%; */
		/* width:50%; */
	}
	
	/* .textfeild:focus{
	    border: 1px solid;
	} */
	
	#maindiv{
		WIDTH:35%;
		margin-left:10%;
		margin-right:10%;
	    /* border-width: 1px;
	    border-color: black;
	    border-style: solid; */
	    box-shadow: 7px 7px 5px #888888;
	}
	.sbmtBtn{
		width:100%;
		margin-bottom:2%;
	}
</style>

</head>

<body>

	<h2>Registration Form</h2>
 
 	<div id="maindiv">
	<form:form method="POST" modelAttribute="employee">
		<form:input type="hidden" path="id" id="id"/>
		<table>
			<tr>
				<td><label for="name" class="textLabel">Name: </label> </td>
				<td><form:input path="name" id="name" class="textfeild" placeholder="John Smith" /></td>
				<td><form:errors path="name" cssClass="error"/></td>
		    </tr>
	    
			<tr>
				<td><label for="joiningDate" class="textLabel">Joining Date: </label> </td>
				<td><form:input path="joiningDate" id="joiningDate" class="textfeild" placeholder="dd/MM/yyyy" /></td>
				<td><form:errors path="joiningDate" cssClass="error"/></td>
		    </tr>
	
			<tr>
				<td><label for="salary" class="textLabel">Salary: </label> </td>
				<td><form:input path="salary" id="salary" class="textfeild" placeholder="20000" /></td>
				<td><form:errors path="salary" cssClass="error"/></td>
		    </tr>
	
			<tr>
				<td><label for="ssn" class="textLabel">SSN: </label> </td>
				<td><form:input path="ssn" id="ssn" class="textfeild" placeholder="KGV77-552-GGR"/></td>
				<td><form:errors path="ssn" cssClass="error"/></td>
		    </tr>
	
			<tr>
				<td colspan="3">
					<c:choose>
						<c:when test="${edit}">
							<input type="submit" value="Update" class="sbmtBtn"/>
						</c:when>
						<c:otherwise>
							<input type="submit" value="Register" class="sbmtBtn"/>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
	</form:form>
	
	</div>
	
	<br/>
	<br/>
	Go back to <a href="<c:url value='/list' />">List of All Employees</a>
</body>
</html>