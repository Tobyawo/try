<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="form"%>


<html lang="en">

<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <![endif]-->
    <!-- Favicon Icon -->
    <link rel="icon" href="/assets/img/favicon.ico" />
    <title>SocialCommunity</title>
    <!-- BOOTSTRAP CORE CSS -->

    <link href='<c:url value="/assets2/css/bootstrap.css"/>' rel="stylesheet">

    <!-- ION ICONS STYLES -->
    <link href='<c:url value="/assets2/css/ionicons.css"/>' rel="stylesheet" />
    <!-- FONT AWESOME ICONS STYLES -->

    <!-- CUSTOM CSS -->
    <link href='<c:url value="/assets2/css/style.css"/>' rel="stylesheet" />
    <!-- IE10 viewport hack  -->
    <script src="js/ie-10-view-port.js"></script>


    <link rel="stylesheet" href='<c:url value="/assets2/css/bootstrapValidator.css"/>'/>

    <script src='<c:url value="/assets/js/jquery-1.11.1.js"/>'></script>
    <!-- BOOTSTRAP SCRIPTS  -->

    <!-- SCROLLING SCRIPTS PLUGIN  -->
    <script src='<c:url value="/assets/js/jquery.easing.min.js"/>'></script>
    <!-- CUSTOM SCRIPTS   -->

    <script type="text/javascript" src='<c:url value="/assets/js/bootstrapValidator.js"/>'></script>
    <!-- Latest compiled and minified CSS -->


    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<!-- HEADER SECTION END-->
<!--HOME SECTION START  -->
<div id="home">
    <div class="overlay">
        <div class="container">
            <div class="row scroll-me" >
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 logo-wrapper">
                    <h1 >FaceBook</h1>
                    <h3>
                        Facebook helps you connect and share with the people in your life.

                    </h3>
                </div>


                <!--  <div class="card">
                      <div class="card-body">   -->
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 logo-wrapper">
                    <form action="UserDAO" method="post">
                        <h1>Sign Up</h1>

                        <fieldset class="form-group">
                            <label>First Name</label> <input type="text" class="form-control"
                                                        name="first_name" required="required">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Surname</label> <input type="text" class="form-control"
                                                           name="surname">
                        </fieldset>


                        <fieldset class="form-group">
                            <label>Mobile number</label> <input type="text" class="form-control"
                                                                                  name="phone_number">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Email address </label> <input type="text" class="form-control"
                                                          name="email">
                        </fieldset>


                        <fieldset class="form-group">
                            <label>New password</label> <input type="text" class="form-control"
                                                          name="password">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Day of birth</label> <input type="text" class="form-control"
                                                          name="day_of_birth">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Month of birth</label> <input type="text" class="form-control"
                                                          name="month_of_birth">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Year of birth</label> <input type="text" class="form-control"
                                                          name="year_of_birth">
                        </fieldset>

                        </fieldset>
                        <input type="radio" name="gender" value="male">Male
                        <input type="radio" name="gender" value="female">Female
                        </fieldset><p></p>


                       <button type="submit" class="btn btn-success">Submit</button>
                        <button type="submit" class="btn">Forgotten password?</button><p></p>
                        <button type="submit" class="btn btn-success">Create New Account</button>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- CONATCT SECTION END-->
<!-- FOOTER SECTION START-->
<footer>
    <div class="container">
        <div class="row text-center">
            <div class="col-lg-12 col-md-12 col-sm-12">
                &copy;  Facebook © 2021 | by <a href="#" target="_blank"> Oluwatobi</a>
            </div>
        </div>
    </div>
</footer>
<!-- FOOTER SECTION END-->

<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
<!-- CORE JQUERY  SCRIPTS -->

</body>
</html>
