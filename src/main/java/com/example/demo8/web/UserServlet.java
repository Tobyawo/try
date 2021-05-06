package com.example.demo8.web;
//
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.demo8.Model.User;


/**
 * ControllerServlet.java
 * This servlet acts as a page controller for the application, handling all
 * requests from the user.
 *
 */

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    private String action;
    private HttpServletRequest request;
    private HttpServletResponse response;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
//        action = request.getServletPath();
//        String context = request.getContextPath();
        System.out.println("i got to doPost of userservlet");
//        System.out.println(action);
//        System.out.println(getServletContext());
        doGet(request, response);

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            action = request.getServletPath();
            System.out.println("i got to doget of userservlet");
            System.out.println(action);
        } catch (Exception e) {
            e.printStackTrace();
        }

        switch (action) {
            case "/new":
                try {
                    showNewForm(request, response);
                } catch (jakarta.servlet.ServletException e) {
                    e.printStackTrace();
                }
                break;
            case "/SignUp":
                try {
                    insertUser(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "/delete":
                try {
                    deleteUser(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "/edit":
                try {
                    showEditForm(request, response);
                } catch (SQLException | jakarta.servlet.ServletException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "/update":
                try {
                    updateUser(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            default:
                try {
                    listUser(request, response);
                } catch (SQLException | jakarta.servlet.ServletException throwables) {
                    throwables.printStackTrace();
                }
                break;

        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, jakarta.servlet.ServletException {
        List<User> listUser = userDAO.selectAllUsers();

        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, jakarta.servlet.ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException, jakarta.servlet.ServletException {
        String email = request.getParameter("email");
        User existingUser = userDAO.selectUser(email);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);

    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String first_name = request.getParameter("first_name");
        String surname = request.getParameter("surname");
        String phone_number = request.getParameter("phone_number");
        String email = request.getParameter("email");
        int day_of_birth = Integer.parseInt(request.getParameter("day_of_birth"));
        String month_of_birth = request.getParameter("month_of_birth");
        int year_of_birth = Integer.parseInt(request.getParameter("year_of_birth"));
        String gender = request.getParameter("gender");

        User newUser = new User(first_name,surname, phone_number,email, day_of_birth, month_of_birth,year_of_birth, gender);
        userDAO.insertUser(newUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
        // response.sendRedirect("list");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String email = request.getParameter("email");
        String first_name = request.getParameter("first_name");
        String surname = request.getParameter("surname");
        String phone_number = request.getParameter("phone_number");

        User book = new User(first_name,surname, phone_number,email);
        userDAO.updateUser(book);
        response.sendRedirect("list");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String email = request.getParameter("email");
        userDAO.deleteUser(email);
        response.sendRedirect("list");

    }

}

