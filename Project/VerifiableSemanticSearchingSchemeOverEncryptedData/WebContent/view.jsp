<%@page import="pack.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE HTML>
<html>

<head>
<title></title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Tangerine&amp;v1" />
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" />
<link rel="stylesheet" type="text/css" href="style/style.css" />

</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div class="slogan"><center><font color="white" size="5">A Verifiable Semantic Searching Scheme by Optimal Matching over Encrypted Data in Public Cloud</font></center></div>
			</div>
			<div id="menubar">
				<ul id="menu">
					<!-- put class="current" in the li tag for the selected page - to highlight which page you're on -->

					<li><a class="current" href="adminpage.jsp">Home</a></li>
					<li class="hvr-sweep-to-bottom"><a href="view.jsp">View
							Data Details</a></li>
					<li class="hvr-sweep-to-bottom"><a href="viewreq.jsp">View
							User Request</a></li>
					<li class="hvr-sweep-to-bottom"><a href="logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
		<div id="site_content">
			<div id="content">

				<table class="imagetable">

					<tr>
						<th>FILE NAME</th>
						<th>RANK</th>
						<th>PUBLIC KEY</th>
						<th>TITLE</th>
						<th>KEYWORD</th>
						<th>CATEGORY</th>


					</tr>

					<%
						String fname = null, r = null, k = null, t = null, key = null, cat = null;

						String userid = (String) request.getSession().getAttribute("me");

						Class.forName("com.mysql.jdbc.Driver");
						Connection conn = DbConnector.getConnection();
						Statement st1 = conn.createStatement();

						ResultSet rs1 = st1
								.executeQuery("select * from  files where userid='"
										+ userid + "'");

						while (rs1.next()) {
							fname = rs1.getString("name");
							r = rs1.getString("rank_");
							k = rs1.getString("key_");
							t = rs1.getString("title");
							key = rs1.getString("keyword");
							cat = rs1.getString("cat");
					%>
					<tr>
						<td><label><%=fname%></label></td>

						<td align="center"><%=r%></td>
						<td align="center"><%=k%></td>
						<td align="center"><%=t%></td>
						<td align="center"><%=key%></td>
						<td align="center"><%=cat%></td>
					</tr>
					<%
						}
					%>

				</table>

			</div>
		</div>
		<div id="footer">
			<p>
				
			</p>
		</div>
	</div>
</body>
</html>
