//package com.example.demo8.dao;
//
//import com.example.demo8.Model.PostComment;
//import com.example.demo8.Model.User;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//
//import java.io.IOException;
//import java.io.IOException;
//import java.sql.*;
//import java.util.List;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.example.demo8.dao.UserDAO;
//
//@WebServlet(name = "LoginDAO", value = "/LoginDAO")
//public class LoginDAO extends HttpServlet {
//    Connection connection = null;
//    private static String jdbcURL = "jdbc:mysql://localhost/facebookDB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
//    //private static String jdbcURL = "jdbc:mysql://localhost:3306/facebookDB";
//    private static String jdbcUsername = "root";
//    private static String jdbcPassword = "root";
//
//    private  static final String INSERT_USERS_LOGIN_DETAILS = "INSERT INTO loginDetails  (email,password) VALUES (?, ?)";
//
//    public  Connection getConnection(){
//        String url;
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            url="jdbc:mysql://localhost/facebookDB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
//            connection = DriverManager.getConnection(url,"root","root");
//            System.out.println("Connection created");
//        }
//        catch (Exception e) {
//            System.out.println(e.toString());
//        } return connection;
//    }
//
//
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        //System.out.println(request.getParameter("email"));
//        String email = request.getParameter("email");
//        String pass = request.getParameter("password");
//
//       // checkUser(email);
//
//        PostComment newComment = new PostComment(email,comment,sessionId,  creationTime,  lastAccessedTime);
//        System.out.println(newComment);
//        insertComment(newComment);
//        System.out.println("comment submitted successfully");
//        //response.sendRedirect("facebookHome.jsp");
//        RequestDispatcher dispatcher = request.getRequestDispatcher("facebookHome.jsp");
//        dispatcher.forward(request, response);
//
//
//    }
//
//
//
//    public User selectUser(String email) {
//        User user = null;
////        List<User> users = new ArrayList<>();
//        // Step 1: Establishing a Connection
//        try (Connection connection = getConnection();
//             // Step 2:Create a statement using connection object
//             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_LOGIN_DETAILS);) {
//            preparedStatement.setString(4, email);
//            System.out.println(preparedStatement);
//            // Step 3: Execute the query or update query
//            ResultSet rsU = preparedStatement.executeQuery();
//
//            // Step 4: Process the ResultSet object.
//            while (rsU.next()) {
//                String first_name = rsU.getString("first_name");
//                String surname = rsU.getString("surname");
//                String phone_number = rsU.getString("phone_number");
//                String emaill = rsU.getString("email");
//                int day_of_birth = rsU.getInt("day_of_birth");
//                String month_of_birth = rsU.getString("month_of_birth");
//                int year_of_birth = rsU.getInt("year_of_birth");
//                String gender = rsU.getString("gender");
//                user = new User(first_name, surname, phone_number, emaill, day_of_birth, month_of_birth, year_of_birth, gender);
//
//            }
//        } catch (SQLException e) { printSQLException(e);
//        }
//        System.out.println("below are the details of the matched record in the database");
//        return user;
//    }
//
//
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
//}
