<%--
used to have same heading for all your jsp pages
  Created by IntelliJ IDEA.
  User: mac
  Date: 5/5/21
  Time: 5:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <%--	<title>Facebook Theme Demo</title>--%> each pages can have their own title





        <title><%= request.getParameter("title")%></title>

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
<body>

</body>
</html>


Now let’s include the head_tag.jsp in other JSP files.


<jsp:include page="/WEB-INF/head_tag.jsp">
    <jsp:param name="title" value="Login" />
</jsp:include>


the above code supply the title "Login" when it is deploy to the web browser. you can change it accordingly