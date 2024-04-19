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

<script>
	function check() {
		var a = document.ff.user.value;
		if (a == 0) {
			alert('Please Enter The Keyword..!');
			return false;
			document.getElementById("user").focus();
		}
	}
</script>


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

					<li class="current"><a href="userpage.jsp">Home</a></li>
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
		<div id="site_content">

			<div id="content">
				<!-- insert the page content here -->

				<%
					String my = session.getAttribute("me").toString();

					if (request.getParameter("dwn") != null) {
				%>
				<h1>Success fully download</h1>
				<%
					} else {
				%>
				<h1>
					Welcome to
					<%=my%></h1>
				<%
					}
				%>


				<form action="search.jsp" name="ff" method="get"
					onsubmit="return check()">

					<div class="form_settings">
						<p>
							<span>Enter Keyword </span><input class="contact" type="text"
								name="search" id="user" />
						</p>

						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="Search" />
						</p>

					</div>
				</form>

			</div>
		</div>
		<div id="footer">
			<p>
				
			</p>
		</div>
	</div>
</body>
</html>



