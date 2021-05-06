<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <title>FaceBook</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">


</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: tomato">
        <div>
            <a href="https://www.javaguides.net" class="navbar-brand"> User Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list"
                   class="nav-link">Users</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <c:if test="${user != null}">
            <form action="update" method="post">
                </c:if>
                <c:if test="${user == null}">
                <form action="insert" method="post">
                    </c:if>

                    <caption>
                        <h2>
                            <c:if test="${user != null}">
                                Edit User
                            </c:if>
                            <c:if test="${user == null}">
                                Add New User
                            </c:if>
                        </h2>
                    </caption>

                    <c:if test="${user != null}">
                        <input type="hidden" name="id" value="<c:out value='${user.id}' />" />
                    </c:if>

                    <fieldset class="form-group">
                        <label>User Name</label> <input type="text"
                                                        value="<c:out value='${user.name}' />" class="form-control"
                                                        name="name" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>User Email</label> <input type="text"
                                                         value="<c:out value='${user.email}' />" class="form-control"
                                                         name="email">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>User Country</label> <input type="text"
                                                           value="<c:out value='${user.country}' />" class="form-control"
                                                           name="country">
                    </fieldset>

                    <button type="submit" class="btn btn-success">Save</button>
                </form>
        </div>
    </div>
</div>
<div>
<form action="UserDOA" method="post">
    enter first_name: <input type="text" name="first_name"><br>
    enter surname:<input type="surname" name="surname"><br>
    enter phone_number: <input type="phone_number" name="phone_number"><br>
    enter email:<input type="email" name="email"><br>
    enter day_of_birth: <input type="day_of_birth" name="day_of_birth"><br>
    enter month_of_birth:<input type="month_of_birth" name="month_of_birth"><br>
    enter year_of_birth: <input type="year_of_birth" name="year_of_birth"><br>
    enter gender:<input type="gender" name="gender"><br>
    <input type="submit" value="login">
    </form>

</div>


</body>
</html>
