<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Portfolio</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>
            <<c:if test="${loggedout}">
            
                <article id="logoutpopup">
                    <center>
                    <h2 id="loggedsuccess">
                        Logged out successfully
                    </h2>
                    <button onclick="document.getElementById('logoutpopup').style.display='none'" >close</button>
                    </center>
                    
                </article>
          
            </c:if>
            
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
								<a href="index.html" class="logo">
									<span class="symbol"><img src="images/logo.svg" alt="" /></span><span class="title">Brecht Theys</span>
								</a>

							<!-- Nav -->
								<nav>
									<ul>
                                                                             <c:if test="${sessionScope.loginid != null}">
										<li><a href="#menu">Menu</a></li>
                                                                             </c:if>
									</ul>
								</nav>

						</div>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<h2>Menu</h2>
						<ul>
							<li><a href="index.jsp">Home</a></li>
                                                        <c:if test="${sessionScope.user.getRoleString() == 'administrator'}">
							<li><a href="Controller?action=personOverview">Account overview</a></li>
                                                        </c:if>
							<li><a href="generic.html">Tempus etiam</a></li>
							<li><a href="generic.html">Consequat dolor</a></li>
							<li><a href="elements.html">Elements</a></li>
                                                        <li style="margin-top: 100px"><a href="Controller?action=logOut">Log out</a></li>
                                                        <table>
                                                        <tr>
                                                            <td><a href="Controller?action=onlinebutton">Online</a></td>
                                                            <td><a href="Controller?action=awaybutton">Away</a></td>
                                                            <td><a href="Controller?action=offlinebutton">Offline</a></td>
                                                        </tr>
                                                        </table>
                                                        <p><b>Current status:</b> <c:out value='${sessionScope.user.getStatusString()}' /></p>
						</ul>
					</nav>

				<!-- Main -->
					<div id="main">
						<div class="inner">
                            <center>
							<header>
								<h1>Squanch</h1>
							</header>
                            </center>
                            <c:choose>
                                <c:when test="${login || sessionScope.loginid != null}">
                                <c:if test="${error != null}">
                                    <ul class="alert-danger">
                                        <p>${error}</p>
                                    </ul>
                                </c:if>
                                <h2>Welcome <c:out value='${sessionScope.loginid}' /></h2>
                                </c:when>
                                <c:otherwise>
                                <c:if test="${error != null}">
					<ul class="alert-danger">
						<li>${error}</li>
					</ul>
				</c:if>
                                
				<form method="post" action="Controller?action=login">
					<p>
						<label for="userid">User id</label> <input type="text" id="userid"
							name="userid" value="<c:out value='${person.userid}'/>">
					</p>
					<p>
						<label for="password">Password</label> <input type="password"
							id="password" name="password" value="<c:out value=''/>">
					</p>

					<input type="submit" id="log in" name="submit" value="Log in">
                                        <input type="submit" value="Register" name="Submit" formaction="register.jsp"/>
				</form>
                                </c:otherwise>
                            </c:choose>
                                <c:choose>
                            <c:when test="${login || sessionScope.loginid != null}">
                                        
							<section class="tiles">
								<article class="style1">
									<span class="image">
										<img src="images/pic01.jpg" alt="" />
									</span>
									<a href="generic.html">
										<h2>About me</h2>
										<div class="content">
											<p>Who am I?</p>
										</div>
									</a>
								</article>
								<article class="style2">
									<span class="image">
										<img src="images/pic02.jpg" alt="" />
									</span>
									<a href="generic.html">
										<h2>Competentions</h2>
										<div class="content">
											<p>What am I capable of?</p>
										</div>
									</a>
								</article>
								<article class="style4">
									<span class="image">
										<img src="images/pic04.jpg" alt="" />
									</span>
									<a href="personlist.html">
										<h2>Curriculum vitae</h2>
										<div class="content">
											<p>Read or download my resume here.</p>
										</div>
									</a>
								</article>
								<article class="style5">
									<span class="image">
										<img src="images/pic05.jpg" alt="" />
									</span>
									<a href="generic.html">
										<h2>Projects</h2>
										<div class="content">
											<p>Some of my past projects.</p>
										</div>
									</a>
								</article>
							</section>
                            </c:when>
                                                        <c:otherwise></c:otherwise>
                                </c:choose>
                            		</div>
                                            <c:if test="${sessionScope.loginid != null}">
                                              
        <div class="chat_box">
            <div class="chat_head">
                Chatbox
            </div>
            <div class="chat_body">
                <table>
                <c:forEach var="person" items="${sessionScope.user.getArrayFriendList()}">
                <tr class="user_tr">
                <td class="user_td">
                <div class="user">
                    <c:out value='${person.userid}'/>
                </div>
                </td>
                </tr>
                </c:forEach>
                </table>
            </div>
        </div>
        
        <div class="msg_box" style="right:290px">
            <div class="msg_head">Test-user
                <div class="close">X</div>
            </div>
            <div class="msg_wrap">
            <div class="msg_body">
                <div class="msg_insert" id="messages"></div>
            </div>
            <div class="msg_footer">
                <textarea type="text" class="msg_input" id="messageinput" rows="4"></textarea>
            </div>
            <div class="messagebuttons">
            <button type="button" onclick="openSocket();" style="display: inline-block;" >Open</button>
            <button type="button" onclick="send();" style="display: inline-block;" >Send</button>
            <button type="button" onclick="closeSocket();" style="display: inline-block;" >Close</button>
            </div>
            </div>
            <script type="text/javascript">
                var webSocket;
                var messages = document.getElementById("messages");
                var path = "ChatApp";
                
                function openSocket() {
                    webSocket = new WebSocket("ws://localhost:8080/"+path+"/echo");
                    webSocket.onopen = function(event) {
                        writeResponse("Connection opened");
                    };
                    webSocket.onmessage = function(event) {
                        writeResponse(event.data);
                    };
                    webSocket.onclose = function(event) {
                        writeResponse("Connection closed");
                    };
                }
                
                function send() {
                    var text = document.getElementById("messageinput").value;
                    webSocket.send(text);
                }
                
                function closeSocket() {
                    webSocket.close();
                }
                
                function writeResponse(text) {
                    messages.innerHTML += "<div class='msg_a'>" + text + "</div>";
                }
            </script>
        </div>
                                            </c:if>
					</div>

				<!-- Footer
					<footer id="footer">
						<div class="inner">
							<ul class="copyright">
								<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</footer>
                                        -->
			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
                        <script src="assets/js/chatboxscript.js"></script>

	</body>
</html>