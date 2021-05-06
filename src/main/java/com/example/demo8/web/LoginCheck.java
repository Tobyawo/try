package com.example.demo8.web;

//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


import com.example.demo8.Model.User;


@WebServlet(name = "LoginCheck", value = "/LoginCheck")
public class LoginCheck extends HttpServlet {
    private UserDAO userDAO;






    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        String loginEmail = request.getParameter("email");
        String loginPass = request.getParameter("password");
        HttpSession session=request.getSession();

        //check database data
//        User checkUserInDatabase = userDAO.CheckUserLogin(loginEmail);

//        String userDatabaseEmail = checkUserInDatabase.getEmail();
//        String UserDataBasePass = checkUserInDatabase.getPassword();
//        System.out.println("user confirmed = " + userDatabaseEmail+ " password confirmed =" + UserDataBasePass);




      //  if((loginEmail.equals(session.getAttribute("email")) && loginPass.equals(session.getAttribute("pass"))) || (userDatabaseEmail.equals(loginEmail) && UserDataBasePass.equals(loginPass) )){
            if((loginEmail.equals(session.getAttribute("email")) && loginPass.equals(session.getAttribute("password"))) ||("admin".equals(loginEmail) && "root".equals(loginPass) )){


            RequestDispatcher rd = request.getRequestDispatcher("facebookHome.jsp");
            rd.forward(request,response);
            //out.print("Welcome, "+name);

        }  else{
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request,response);
        }
    }




    private void ValidateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {


        String loginEmail = request.getParameter("email");
        String loginPass = request.getParameter("password");
        HttpSession session=request.getSession();

        User checkUserInDatabase = userDAO.CheckUserLogin(loginEmail);

        String userDatabaseEmail = checkUserInDatabase.getEmail();
        String UserDataBasePass = checkUserInDatabase.getPassword();
        System.out.println("user confirmed = " + userDatabaseEmail+ " password confirmed =" + UserDataBasePass);

        if((loginEmail.equals(session.getAttribute("email")) && loginPass.equals(session.getAttribute("pass"))) || (userDatabaseEmail.equals(loginEmail) && UserDataBasePass.equals(loginPass) )){

            RequestDispatcher rd = request.getRequestDispatcher("facebookHome.jsp");
            rd.forward(request,response);

        }  else {
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);


        }


    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }




}
