<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: decagon
  Date: 04/05/2021
  Time: 09:10
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page import="com.emmanuel.macaulay.fb.model.Post" %>--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%--<%@ page import="com.emmanuel.macaulay.fb.model.Comment" %>--%>
<%@ page import="java.util.Map" %>
<%@ page import="com.example.demo8.Model.Post" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    //List<String> posts = (List<String>) request.getAttribute("posts");
    //Map<Post, List<Comment>> posts = (Map<Post, List<Comment>>) request.getAttribute("posts");

//    HttpSession session = request.getSession();
    String posts = (String)session.getAttribute("post");
    pageContext.setAttribute("posts", posts);
%>
<c:set var="posts" value="<%=posts%>"></c:set>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%--<h1>You have successfully Signed in!</h1>--%>
<%--<a href="/LoginServlet">logout</a>--%>
<nav class="navbar mb-5 navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><b class="FaceBook">Face</b>book</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

            </ul>
            <div class="d-flex">
                <%--                <img class="profile-pic-icon mt-2" src="images/edema.jpeg" alt="">--%>
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <%--                        <a class="nav-link active" aria-current="page" href="userprofile.html">@Username</a>--%>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">
                            <%--                            <img class="create-post-icon" src="images/iconfinder_plus_4115237.png" alt=""></a>--%>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="index.html">Logout</a>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</nav>
<div class="container">

    <div class="shadow p-3 mb-5 bg-body rounded">
        <div class="row">
            <div class="col-lg-11 text-right">
                <form action="PostDAO" method="post">
                    <textarea class="form-control drag" name="body" placeholder="What's on your mind @Username?"
                              required></textarea>
                    <button class="btn btn-primary btn-md mt-3 btn-block" type="submit">Post</button>
                </form>
            </div>
        </div>
    </div>

    <div class="d-flex flex-column flex-wrap justify-content-center align-content-center">
        <div class="col-lg-11">
            <c:forEach var="post" items="${sessionScope}">
                <div class="container d-flex flex-row flex-wrap justify-content-evenly align-content-center">
                    <div class="shadow p-3 mb-5 bg-body rounded col-lg-11">
                        <p>Date: ${ posts}</p>
                        <p style="font-family: 'Freight Sans Bold', Helvetica, Arial, sans-serif; font-size: x-large">${posts}</p>
                        <hr>
                        <div class="d-flex flex-row justify-content-between">
                            <div class="card d-flex justify-content-center" style="width: 100px; height: 50px;">
                                <h3 class="align-self-center"> 2 </h3>
                            </div>
                            <button type="submit" class="btn btn-primary" style="width: 100px; height: 50px;">Like
                            </button>
                            <button type="submit" class="btn btn-success" style="width: 100px; height: 50px;">Edit
                            </button>
                            <button type="submit" class="btn btn-danger" style="width: 100px; height: 50px;">Delete
                            </button>
                        </div>
                        <hr>
                        <a href="">Comments</a>
                        <c:forEach var="comment" items="${posts}">
                            <div id="comment" class="card">
                                <div class="card-header">
                                    Comment
                                    <h6>Date:${posts}</h6>
                                </div>
                                <div class="card-body">
                                    <blockquote class="blockquote mb-0">
                                        <p>${posts}</p>
                                    </blockquote>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</div>
</body>
</html>
