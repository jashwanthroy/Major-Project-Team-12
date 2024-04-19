<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.smu.tspell.wordnet.SynsetType"%>
<%@page import="edu.smu.tspell.wordnet.Synset"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.TreeSet"%>
<%@page import="edu.smu.tspell.wordnet.WordNetDatabase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.DbConnector"%>

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
				%>

				<h1>
					Welcome to
					<%=my%></h1>


				<%
					Connection conn = DbConnector.getConnection();
					Statement st = conn.createStatement();
					
					Set<String> sets=new TreeSet<String>();

					String f = null;
					String k = null;
					String owner = null;

					String txt = request.getParameter("search");
					
					sets.add(txt);

					List<List<String>> files = new ArrayList<List<String>>();

					WordNetDatabase database = null;

					System.setProperty("wordnet.database.dir",
							"C:\\Program Files (x86)\\WordNet\\2.1\\dict\\");
					
					database = WordNetDatabase.getFileInstance();

					Synset[] synsets = database.getSynsets(txt, SynsetType.NOUN);

					for (int i = 0; i < synsets.length; i++) 
					{
						String[] wordForms = synsets[i].getWordForms();

						for (int j = 0; j < wordForms.length; j++) {

							String[] splits = wordForms[j].split(" ");

							for (int l = 0; l < splits.length; l++) {

								String keyword = splits[l];
								
								sets.add(keyword);
							}//for

						}//for
					}
					%>


				<%
						Iterator<String> it=sets.iterator();
								
						while(it.hasNext())
						{
							String keyword=it.next();
							
							ResultSet rst = st
									.executeQuery("select * from files where name='"
											+ keyword
											+ "' or title='"
											+ keyword
											+ "' or keyword='"
											+ keyword
											+ "' or cat='"
											+ keyword
											+ "' order by rank_ desc");

							while (rst.next()) {
								
								System.out.println("in first while");
								
								f = rst.getString("name");
								k = rst.getString("key_");
								owner = rst.getString("userid");

								String name = null;

								ResultSet myrs = conn.createStatement()
										.executeQuery(
												"select name from regpage where userid='"
														+ owner + "'");

								while (myrs.next()) {
									
									System.out.println("in second while");
									
									name = myrs.getString("name");
									
									List<String> list = new ArrayList<String>();
									
									list.add(f);
									list.add(k);
									list.add(owner);
									list.add(name);
									
									if(files.size()!=0)
									{
										System.out.println(" in if "+f);
										for(List l : files)
										{
											System.out.println(l.get(0)+"\t"+f);
											
											if(!l.get(0).equals(f))
											{
												files.add(list);	
											}
										}	
									}
									else
									{
										System.out.println(" in else "+f);
										
										files.add(list);
									}
								}
							}
						}
					%>

				<table class="imagetable">

					<tr>
						<th>File Name</th>
						<th>File Owner</th>
						<th>Send Request</th>

					</tr>

					<%		
						for(int x=0;x<files.size();x++)
						{
							List<String> l=files.get(x);
					%>
					<tr>
						<td><%=l.get(0)%></td>
						<td><%=l.get(3)%></td>
						<td>
							<form action="userfileview.jsp">
								<input type="hidden" name="key" value="<%=l.get(1)%>"> 
								<input type="hidden" name="owner" value="<%=l.get(2)%>"> 
								<input type="text" name="description"> 
								<input type="submit" value="Request">
							</form>
						</td>

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
