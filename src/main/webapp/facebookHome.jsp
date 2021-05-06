<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 5/3/21
  Time: 12:46 PM
  To change this template use File | Settings | File Templates.
--%>

<%
	//List<String> posts = (List<String>) request.getAttribute("posts");
	//Map<Post, List<Comment>> posts = (Map<Post, List<Comment>>) request.getAttribute("posts");

//    HttpSession session = request.getSession();
	String posts = (String)session.getAttribute("post");
	pageContext.setAttribute("posts", posts);

	String comment = (String)session.getAttribute("comment");
	pageContext.setAttribute("comment", comment);
%>



<!DOCTYPE html>
<html lang="en">
<head>

<style>


	/* custom template */
	html, body {
		height: 100%;
		font-family:verdana,arial,sans-serif;
		color:#555555;
	}

	.nav {
		font-family:Arial,sans-serif;
		font-size:13px;
	}

	a {
		color:#222222;
	}

	a:hover {
		text-decoration:none;
	}

	hr {
		border-color:#dedede;
	}

	.wrapper, .row {
		height: 100%;
		margin-left:0;
		margin-right:0;
	}

	.wrapper:before, .wrapper:after,
	.column:before, .column:after {
		content: "";
		display: table;
	}

	.wrapper:after,
	.column:after {
		clear: both;
	}

	.column {
		height: 100%;
		overflow: auto;
		*zoom:1;
	}

	.column .padding {
		padding: 20px;
	}

	.full{
		padding-top:70px;
	}

	.box {
		bottom: 0; /* increase for footer use */
		left: 0;
		position: absolute;
		right: 0;
		top: 0;
		background-color:#444444;
		/*
          background-image:url('/assets/example/bg_suburb.jpg');
          background-size:cover;
          background-attachment:fixed;
        */
	}

	.divider {
		margin-top:32px;
	}

	.navbar-blue {
		border-width:0;
		background-color:#3B5999;
		color:#ffffff;
		font-family:arial,sans-serif;
		top:0;
		position:fixed;
		width:inherit;
	}

	.navbar-blue li > a,.navbar-toggle  {
		color:#efefef;
	}

	.navbar-blue .dropdown-menu li a {color:#2A4888;}
	.navbar-blue .dropdown-menu li > a {padding-left:30px;}

	.navbar-blue li>a:hover, .navbar-blue li>a:focus, .navbar-blue .open, .navbar-blue .open>a, .navbar-blue .open>a:hover, .navbar-blue .open>a:focus {
		background-color:#2A4888;
		color:#fff;
	}

	#main {
		background-color:#e9eaed;
		padding-left:0;
		padding-right:0;
	}
	#main .img-circle {
		margin-top:18px;
		height:70px;
		width:70px;
	}

	#sidebar {
		padding:0px;
		padding-top:15px;
	}

	#sidebar, #sidebar a, #sidebar-footer a {
		color:#ffffff;
		background-color:transparent;
		text-shadow:0 0 2px #000000;
		padding-left:5px;
	}
	#sidebar .nav li>a:hover {
		background-color:#393939;
	}

	.logo {
		display:block;
		padding:3px;
		background-color:#fff;
		color:#3B5999;
		height:28px;
		width:28px;
		margin:9px;
		margin-right:2px;
		margin-left:15px;
		font-size:20px;
		font-weight:700;
		text-align:center;
		text-decoration:none;
		text-shadow:0 0 1px;
		border-radius:2px;
	}
	#sidebar-footer {
		background-color:#444;
		position:absolute;
		bottom:5px;
		padding:5px;
	}
	#footer {
		margin-bottom:20px;
	}

	/* bootstrap overrides */

	h1,h2,h3 {
		font-weight:800;
	}

	.navbar-toggle, .close {
		outline:0;
	}

	.navbar-toggle .icon-bar {
		background-color: #fff;
	}

	.btn-primary,.label-primary,.list-group-item.active, .list-group-item.active:hover, .list-group-item.active:focus  {
		background-color:#3B5999;
		color:#fffffe;
	}
	.btn-default {
		color:#666666;
		text-shadow:0 0 1px rgba(0,0,0,.3);
	}
	.form-control {

	}

	.panel textarea, .well textarea, textarea.form-control
	{
		resize: none;
	}

	.badge{
		color:#3B5999;
		background-color:#fff;
	}
	.badge:hover, .badge-inverse{
		background-color:#3B5999;
		color:#fff;
	}

	.jumbotron {
		background-color:transparent;
	}
	.label-default {
		background-color:#dddddd;
	}
	.page-header {
		margin-top: 55px;
		padding-top: 9px;
		border-top:1px solid #eeeeee;
		font-weight:700;
		text-transform:uppercase;
		letter-spacing:2px;
	}

	.panel-default .panel-heading {
		background-color:#f9fafb;
		color:#555555;
	}

	.col-sm-9.full {
		width: 100%;
	}

	.modal-header, .modal-footer {
		background-color:#f2f2f2;
		font-weight:800;
		font-size:12px;
	}

	.modal-footer i, .well i {
		font-size:20px;
		color:#c0c0c0;
	}

	.modal-body {
		padding:0px;
	}

	.modal-body textarea.form-control
	{
		resize: none;
		border:0;
		box-shadow:0 0 0;
	}

	small.text-muted {
		font-family:courier,courier-new,monospace;
	}

	/* adjust the contents on smaller devices */
	@media (max-width: 768px) {

		.column .padding {
			padding: 7px;
		}

		.full{
			padding-top:20px;
		}

		.navbar-blue {
			background-color:#3B5999;
			top:0;
			width:100%;
			position:relative;
		}

	}


	/*
     * off canvas sidebar
     * --------------------------------------------------
     */
	@media screen and (max-width: 768px) {
		.row-offcanvas {
			position: relative;
			-webkit-transition: all 0.25s ease-out;
			-moz-transition: all 0.25s ease-out;
			transition: all 0.25s ease-out;
		}

		.row-offcanvas-left.active {
			left: 33%;
		}

		.row-offcanvas-left.active .sidebar-offcanvas {
			left: -33%;
			position: absolute;
			top: 0;
			width: 33%;
			margin-left: 5px;
		}

		#sidebar, #sidebar a, #sidebar-footer a {
			padding-left:3px;
		}
	}



</style>


<%--	<title>Facebook Theme Demo</title>--%>

	<!-- Bootstrap 4.5 CSS-->
	<link
			rel="stylesheet"
			href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
			integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
			crossorigin="anonymous"
	/>

	<!-- Bootstrap JS Requirements -->
	<script
			src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
			crossorigin="anonymous"
	></script>
	<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
			integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
			crossorigin="anonymous"
	></script>

	<link ref="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.esm.min.js">
	<!-- html JS Requirements -->
	<link href="bootstrap.css" rel="stylesheet">

	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">


</head>

<body>

<div class="wrapper">
	<div class="box">
		<div class="row row-offcanvas row-offcanvas-left">

			<!-- sidebar -->
			<div class="column col-sm-2 col-xs-1 sidebar-offcanvas" id="sidebar">

				<ul class="nav">
					<li><a href="#" data-toggle="offcanvas" class="visible-xs text-center"><i class="glyphicon glyphicon-chevron-right"></i></a></li>
				</ul>

<%--				<ul class="nav hidden-xs" id="lg-menu">--%>
<%--					<li class="active"><a href="#featured"><i class="glyphicon glyphicon-list-alt"></i> Featured</a></li>--%>
<%--					<li><a href="#stories"><i class="glyphicon glyphicon-list"></i> Stories</a></li>--%>
<%--					<li><a href="#"><i class="glyphicon glyphicon-paperclip"></i> Saved</a></li>--%>
<%--					<li><a href="#"><i class="glyphicon glyphicon-refresh"></i> Refresh</a></li>--%>
<%--				</ul>--%>
<%--				<ul class="list-unstyled hidden-xs" id="sidebar-footer">--%>
<%--					<li>--%>
<%--						<a href="http://usebootstrap.com/theme/facebook"><h3>Bootstrap</h3> <i class="glyphicon glyphicon-heart-empty"></i> Bootply</a>--%>
<%--					</li>--%>
<%--				</ul>--%>

				<!-- tiny only nav-->
				<ul class="nav visible-xs" id="xs-menu">
					<li><a href="#featured" class="text-center"><i class="glyphicon glyphicon-list-alt"></i></a></li>
					<li><a href="#stories" class="text-center"><i class="glyphicon glyphicon-list"></i></a></li>
					<li><a href="#" class="text-center"><i class="glyphicon glyphicon-paperclip"></i></a></li>
					<li><a href="#" class="text-center"><i class="glyphicon glyphicon-refresh"></i></a></li>
				</ul>

			</div>
			<!-- /sidebar -->

			<!-- main right col -->
			<div class="column col-sm-10 col-xs-11" id="main">

				<!-- top nav -->
				<div class="navbar navbar-blue navbar-static-top">
					<div class="navbar-header">
<%--						--%>
					</div>
					<button type="submit" value="logout" class="btn text-right"> <a href="index.jsp">Log Out</a></button><p></p>

				</div>
				<!-- /top nav -->

				<div class="padding">
					<div class="full col-sm-9">

						<!-- content -->
						<div class="row">

							<!-- main col left -->
							<div class="col-sm-5">

								<div class="panel panel-default">
									<div class="panel-thumbnail"><img src="../assets/img/bg_5.jpg" alt=""  class="img-circle"  /></div>
									<div class="panel-body">
										<p class="lead">Your Profile Picture</p>
										<p>45 Friends</p>

										<p>
											<img src="./img/uFp_tsTJboUY7kue5XAsGAs28.png" height="28px" width="28px">
										</p>
									</div>
								</div>


								<div class="panel panel-default">
									<div class="panel-heading"><a href="#" class="pull-right">View all</a> <h4>Your recent activities</h4></div>
									<div class="panel-body">
										<ul class="list-group">
											<li class="list-group-item"><%=java.util.Calendar.getInstance().getTime()%></li>
										</ul>
										<div class="list-group">
											<a href="" class="list-group-item">Activities</a>
											<a href="" class="list-group-item">Acticities</a>
											<a href="" class="list-group-item">Activities</a>
										</div>
									</div>
									<form>
										<div class="input-group">
											<div class="input-group-btn">
												<button class="btn btn-default">like</button>
											</div>
											<input class="form-control" placeholder="Add a comment.." type="text">
										</div>
									</form>

								</div>



								<div class="panel panel-default">

								</div>

								<div class="panel panel-default">

								</div>



							</div>

							<!-- main col right -->
							<div class="col-sm-7">


								<div class="well">
										<form class="form-horizontal" role="form" action="PostDAO" method="post">
											<h4>What's on your mind?</h4>
											<div class="form-group" style="padding:14px;">
												<textarea class="form-control" name="post" placeholder="Update your status"></textarea>
											</div>
											<button class="btn btn-primary pull-right" type="submit">Post</button><ul class="list-inline"><li><a href=""><i class="glyphicon glyphicon-upload"></i></a></li><li><a href=""><i class="glyphicon glyphicon-camera"></i></a></li><li><a href=""></a></li></ul>
<%--											<div class="panel-heading"><a href="bugcheck.jsp" class="pull-right">View all bug post</a> </div>--%>
										</form>
								</div>

								<c:forEach items="${posts}">
	<div class="well">
		<div class="panel-heading"><a href="#" class="pull-right">View all</a> <h4>Your Post</h4></div>
		<div class="panel-body">
			<div class="list-group">
				<h3><a href="" class="list-group-item">${posts}</a></h3>
			</div>
			<form action="CommentDAO" method="post">
				<div class="input-group">
					<div class="input-group-btn">
						<button class="btn btn-default">like</button>
					</div>
					<input class="form-control" placeholder="Add a comment.." type="text">
				</div>
<%--				<button class="btn btn-default">post</button>--%>
<%--				<ul class="list-group">--%>
				<h3><a href="" class="list-group-item">${comment}</a></h3>
					<li class="list-group-item"><%=java.util.Calendar.getInstance().getTime()%></li>
<%--				</ul>--%>
			</form>
		</div>
	</div>
								</c:forEach>





<%--								<div class="panel panel-default">--%>
<%--									<div class="panel-thumbnail"><img src="./img/bg_4.jpg" class="img-responsive"></div>--%>
<%--									<div class="panel-body">--%>
<%--										<form>--%>
<%--											<div class="input-group">--%>
<%--												<div class="input-group-btn">--%>
<%--													<button class="btn btn-default">like</button>--%>
<%--												</div>--%>
<%--												<input class="form-control" placeholder="Add a comment.." type="text">--%>
<%--											</div>--%>
<%--										</form>--%>

<%--&lt;%&ndash;										<p>&ndash;%&gt;--%>
<%--&lt;%&ndash;											<img src="./img/photo.jpg" height="28px" width="28px">&ndash;%&gt;--%>
<%--&lt;%&ndash;											<img src="./img/photo.png" height="28px" width="28px">&ndash;%&gt;--%>
<%--&lt;%&ndash;											<img src="./img/photo_002.jpg" height="28px" width="28px">&ndash;%&gt;--%>
<%--&lt;%&ndash;										</p>&ndash;%&gt;--%>
<%--									</div>--%>
<%--								</div>--%>

							</div>
						</div><!--/row-->




<%--						<div class="col-lg-11">--%>
<%--							<c:forEach var="post" items="${session}">--%>
<%--								<div class="container d-flex flex-row flex-wrap justify-content-evenly align-content-center">--%>
<%--									<div class="shadow p-3 mb-5 bg-body rounded col-lg-11">--%>
<%--										<p>Date: ${ session.getCreationTime()}</p>--%>
<%--										<p style="font-family: 'Freight Sans Bold', Helvetica, Arial, sans-serif; font-size: x-large">${posts}</p>--%>
<%--										<hr>--%>
<%--										<div class="d-flex flex-row justify-content-between">--%>
<%--											<div class="card d-flex justify-content-center" style="width: 100px; height: 50px;">--%>
<%--												<h3 class="align-self-center"> 2 </h3>--%>
<%--											</div>--%>
<%--											<button type="submit" class="btn btn-primary" style="width: 100px; height: 50px;">Like--%>
<%--											</button>--%>
<%--											<button type="submit" class="btn btn-success" style="width: 100px; height: 50px;">Edit--%>
<%--											</button>--%>
<%--											<button type="submit" class="btn btn-danger" style="width: 100px; height: 50px;">Delete--%>
<%--											</button>--%>
<%--										</div>--%>
<%--										<hr>--%>
<%--										<a href="">Comments</a>--%>
<%--										<c:forEach var="comment" items="${posts}">--%>
<%--											<div id="comment" class="card">--%>
<%--												<div class="card-header">--%>
<%--													Comment--%>

<%--													<h6>Date:<%=java.util.Calendar.getInstance().getTime()%></h6>--%>
<%--												</div>--%>
<%--												<div class="card-body">--%>
<%--													<blockquote class="blockquote mb-0">--%>
<%--														<p>${posts}</p>--%>
<%--													</blockquote>--%>
<%--												</div>--%>
<%--											</div>--%>
<%--										</c:forEach>--%>
<%--									</div>--%>
<%--								</div>--%>
<%--							</c:forEach>--%>

<%--						</div>--%>





<%--						<div class="container col-md-5">--%>
<%--							<div class="card">--%>
<%--								<div class="card-body">--%>
<%--										<form action="PostDAO" method="post">--%>
<%--											<caption><h2>Add New post</h2></caption>--%>
<%--&lt;%&ndash;											<fieldset class="form-group">&ndash;%&gt;--%>
<%--&lt;%&ndash;												 <input type="text" value= class="form-control" name="post" required="required">&ndash;%&gt;--%>
<%--&lt;%&ndash;											</fieldset>&ndash;%&gt;--%>
<%--											<textarea rows="5" cols="300" name="post"></textarea>--%>
<%--											<button type="submit" class="btn btn-success">post</button>--%>


<%--										</form>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>


<%--						<div class="row">--%>
<%--							<div class="col-sm-6">--%>
<%--								<a href="#">Twitter</a> <small class="text-muted">|</small> <a href="#">Facebook</a> <small class="text-muted">|</small> <a href="#">Google+</a>--%>
<%--							</div>--%>
<%--						</div>--%>



						<hr>

<%--						<h4 class="text-center">--%>
<%--							<a href="http://usebootstrap.com/theme/facebook" target="ext">Download this Template @Bootply</a>--%>
<%--						</h4>--%>

<%--						<hr>--%>


					</div><!-- /col-9 -->
				</div><!-- /padding -->
			</div>
			<!-- /main -->

		</div>
	</div>
</div>






<!--post modal-->
<div id="postModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
				Update Status
			</div>
			<div class="modal-body">
				<form class="form center-block">
					<div class="form-group">
						<textarea class="form-control input-lg" autofocus="" placeholder="What do you want to share?"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<div>
					<button class="btn btn-primary btn-sm" data-dismiss="modal" aria-hidden="true">Post</button>
					<ul class="pull-left list-inline"><li><a href=""><i class="glyphicon glyphicon-upload"></i></a></li><li><a href=""><i class="glyphicon glyphicon-camera"></i></a></li><li><a href=""><i class="glyphicon glyphicon-map-marker"></i></a></li></ul>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-toggle=offcanvas]').click(function() {
			$(this).toggleClass('visible-xs text-center');
			$(this).find('i').toggleClass('glyphicon-chevron-right glyphicon-chevron-left');
			$('.row-offcanvas').toggleClass('active');
			$('#lg-menu').toggleClass('hidden-xs').toggleClass('visible-xs');
			$('#xs-menu').toggleClass('visible-xs').toggleClass('hidden-xs');
			$('#btnShow').toggle();
		});
	});
</script>
</body></html>