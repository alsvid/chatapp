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
							<li><a href="Controller?action=personOverview">Ipsum veroeros</a></li>
                                                        </c:if>
							<li><a href="generic.html">Tempus etiam</a></li>
							<li><a href="generic.html">Consequat dolor</a></li>
							<li><a href="elements.html">Elements</a></li>
                                                        <li style="margin-top: 100px"><a href="Controller?action=logOut">Log out</a></li>
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
					</div>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h2>Get in touch</h2>
								<form method="post" action="mailto:alsvid.git@gmail.com">
									<div class="field half first">
										<input type="text" name="name" id="name" placeholder="Name" />
									</div>
									<div class="field half">
										<input type="email" name="email" id="email" placeholder="Email" />
									</div>
									<div class="field">
										<textarea name="message" id="message" placeholder="Message"></textarea>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Send" class="special" /></li>
									</ul>
								</form>
							</section>
							<section>
								<h2>Follow</h2>
								<ul class="icons">
									<li><a href="#" class="icon style2 fa-facebook"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon style2 fa-envelope-o"><span class="label">Email</span></a></li>
								</ul>
							</section>
							<ul class="copyright">
								<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	</body>
</html>