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
		var b = document.ff.pass.value;
		if (a == 0) {
			alert('Please Enter UserId');
			return false;
			document.getElementById("name").focus();
		}
		if (b == 0) {
			alert('Please Enter Password');
			return false;
			document.getElementById("pass").focus();
		}
	}
</script>



</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<h1>
					
				</h1>
				<div class="slogan"><center><font color="white" size="5">A Verifiable Semantic Searching Scheme by Optimal Matching over Encrypted Data in Public Cloud</font></center></div>
			</div>
			<div id="menubar">
				<ul id="menu">
					<!-- put class="current" in the li tag for the selected page - to highlight which page you're on -->

					<li><a class="current" href="index.html">Home</a></li>
					<li class="hvr-sweep-to-bottom"><a href="userlog.jsp">Login</a></li>
					<li class="hvr-sweep-to-bottom"><a href="regpage.jsp">User
							Registration</a></li>
					<li class="hvr-sweep-to-bottom"><a href="registration.jsp">Owner
							Registration</a></li>

				</ul>
			</div>
		</div>
		<div id="site_content">

			<div id="content">
				<!-- insert the page content here -->

				<%
					if (request.getParameter("msgg") != null) {
				%>
				<h1> <%=request.getParameter("msgg")%>  </h1>
				<%
					} else {
				%>
				<h1>Login Here</h1>
				<%
					}
				%>


				<form action="loginaction.jsp" name="ff" method="get"
					onsubmit="return check()">

					<div class="form_settings">
						<p>
							<span>User Id</span><input class="contact" type="text"
								name="user" id="user" />
						</p>
						<p>
							<span>Password</span><input class="contact" type="password"
								name="pass" id="pass" />
						</p>

						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="Login" />
						</p>

					</div>
				</form>

			</div>
		</div>
	</div>
	<div id="footer">
		<p>
			
		</p>
	</div>
</body>
</html>
