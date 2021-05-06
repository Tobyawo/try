//package com.example.demo8.web;
//
//import com.example.demo8.Model.User;
//import lombok.SneakyThrows;
//
//import javax.servlet.*;
//import javax.servlet.http.*;
//import javax.servlet.annotation.*;
//import java.io.IOException;
//import java.sql.SQLException;
//
//@WebServlet(name = "LoginServlet", value = "/LoginServlet")
//public class LoginServlet extends HttpServlet {
//
//
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }
//
//
//
//
//
//    @SneakyThrows
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//                validateUser(request,response);
//    }
//
//
//
//
//    private void validateUser(HttpServletRequest request, HttpServletResponse response)
//            throws SQLException, IOException, ServletException {
//
//
//        String loginEmail = request.getParameter("email");
//        String loginPass = request.getParameter("password");
//        HttpSession session = request.getSession();
//
//        User checkUserInDatabase = loginDAOO.CheckUserLogin(loginEmail);
//
//        String userDatabaseEmail = checkUserInDatabase.getEmail();
//        String UserDataBasePass = checkUserInDatabase.getPassword();
//        System.out.println("user confirmed = " + userDatabaseEmail + " password confirmed =" + UserDataBasePass);
//
//        if ((loginEmail.equals(session.getAttribute("email")) && loginPass.equals(session.getAttribute("pass"))) || (userDatabaseEmail.equals(loginEmail) && UserDataBasePass.equals(loginPass))) {
//
//
//
//            RequestDispatcher rd = request.getRequestDispatcher("facebookHome.jsp");
//            rd.forward(request, response);
//
//
//        } else {
//            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//            rd.forward(request, response);
//
//
//        }
//    }
//
//
//}
