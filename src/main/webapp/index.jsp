<%@page import="java.util.Date"%>

<html>
<head>
<title>Testing OpenShift Session Replication</title>

<link rel="stylesheet" type="text/css" href="css/styles.css">

</head>
<body>

	<%
		// gear name
		String gearId = System.getenv("OPENSHIFT_GEAR_UUID");
	
		// get counter
		Integer counter = (Integer) session.getAttribute("demo.counter");
		if (counter == null) {
			counter = 0;
			session.setAttribute("demo.counter", counter);
		}

		// check for increment action
		String action = request.getParameter("action");

		if (action != null && action.equals("increment")) {
			// increment number
			counter = counter.intValue() + 1;

			// update session
			session.setAttribute("demo.counter", counter);
			session.setAttribute("demo.timestamp", new Date());
		}
	%>
	<h3>Testing OpenShift Session Replication</h3>
	<hr>

	<br> <b>Session Data</b>

	<br>
	<br>

	Session ID: <%=session.getId()%>

	<br>
	<br>

	<table>
		<tr>
			<th>Description</th>
			<th>Attribute Name</th>
			<th>Attribute Value</th>
		</tr>

		<tr>
			<td>Session counter</td>
			<td>demo.counter</td>
			<td><%= session.getAttribute("demo.counter") %></td>
		</tr>

		<tr>
			<td>Timestamp of last increment</td>
			<td>demo.timestamp</td>
			<td><%= session.getAttribute("demo.timestamp") %></td>
		</tr>
	</table>

	<br>
	<br> Page served by gear: <%= gearId %> at <%= new java.util.Date() %>

	<br>
	<br>

	<a href="index.jsp?action=increment">Increment Counter</a> |
	<a href="index.jsp">Refresh</a>

</body>
</html>