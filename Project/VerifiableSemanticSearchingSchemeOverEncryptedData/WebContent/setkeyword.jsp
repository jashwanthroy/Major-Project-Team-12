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
		var a = document.ff.name.value;
		var b = document.ff.user.value;
		var c = document.ff.pass.value;

		if (a == 0) {
			alert('Please Enter Title');
			document.getElementById("name").focus();
			return false;
		}
		if (b == 0) {
			alert('Please Enter Keyword');
			document.getElementById("user").focus();
			return false;

		}
		if (c == 0) {
			alert('Please Enter Category');
			document.getElementById("pass").focus();
			return false;
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
			
				<%
					String ke = session.getAttribute("nn").toString();
				%>

				<form action="update.jsp" name="ff" method="get"
					onsubmit="return check()">

					<input type="hidden" value="<%=ke%>" name="key">

					<div class="form_settings">
						<p>
							<span>Enter Title</span><input class="contact" type="text"
								name="tit" id="name" />
						</p>
						<p>
							<span>Enter Keyword</span><input class="contact" type="text"
								name="keyword" id="user" />
						</p>

						<p>
							<span>Category</span><input class="contact" type="text"
								name="cat" id="pass" />
						</p>


						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit" value="Save"
								name="contact_submitted" />
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
