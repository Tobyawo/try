//package com.example.demo8.web;
//
//import com.example.demo8.Model.User;
////import jakarta.servlet.*;
////import jakarta.servlet.http.*;
////import jakarta.servlet.annotation.*;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//
//@WebServlet(name = "LoginDAO", value = "/LoginDAO")
//public class LoginDAOO extends HttpServlet {
//    Connection connection = null;
//
//    private static String jdbcURL = "jdbc:mysql://localhost/facebookDB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
//    //private static String jdbcURL = "jdbc:mysql://localhost:3306/facebookDB";
//    private static String jdbcUsername = "root";
//    private static String jdbcPassword = "root";
//
//    private  static final String INSERT_USERS_LOGIN_DETAILS = "INSERT INTO loginDetails  (email,password) VALUES (?, ?)";
//
//    private static final String CHECK_USER_LOGIN = "select * from loginDetails where email =?";
//    // private static final String CHECK_USER_LOGIN = "select count(1) from loginDetails where email =?";
//
//
//
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
//    PreparedStatement  preparedStatement;
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//
////        HttpSession session=request.getSession();
////
////        String first_name = request.getParameter("first_name");
////        String surname = request.getParameter("surname");
////        String phone_number = request.getParameter("phone_number");
////        String email = request.getParameter("email");
////        String pass = request.getParameter("password");
////        session.setAttribute("email", email);
////        session.setAttribute("password",pass);
////        int day_of_birth = Integer.parseInt(request.getParameter("day_of_birth"));
////        String month_of_birth = request.getParameter("month_of_birth");
////        int year_of_birth = Integer.parseInt(request.getParameter("year_of_birth"));
////        String gender = request.getParameter("gender");
////        System.out.println(first_name);
////        System.out.println(surname);
////        System.out.println(phone_number);
////        System.out.println(email);
////        System.out.println(day_of_birth);
////        System.out.println(month_of_birth);
////        System.out.println(year_of_birth);
////        System.out.println(gender);
////        User newUser = new User(first_name,surname, phone_number,email, day_of_birth, month_of_birth,year_of_birth, gender);
////        System.out.println(newUser);
////        CheckUserLogin(email);
////        System.out.println("Form submitted successfully");
////        //response.sendRedirect("facebookHome.jsp");
////        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
////        dispatcher.forward(request, response);
//
//
//    }
//
//
//
//    public User CheckUserLogin(String email) {
//        User usertocheck = null;
//        List<String> logindetails = new ArrayList<String>();
//        try (Connection connection = getConnection();
//             // Step 2:Create a statement using connection object
//
//             PreparedStatement preparedStatement = connection.prepareStatement(CHECK_USER_LOGIN);) {
//            preparedStatement.setString(1, email);
//            System.out.println("below is the quesry statement");
//            System.out.println(preparedStatement);
//            // Step 3: Execute the query or update query
//            ResultSet rsU = preparedStatement.executeQuery();
//            System.out.println("expected result");
//            System.out.println(rsU);
//            System.out.println(rsU);
//
//
//            // Step 4: Process the ResultSet object.
//            while (rsU.next()) {
//                String emaill = rsU.getString("email");
//                String password = rsU.getString("password");
//                logindetails.add(emaill);
//                logindetails.add(password);
//                System.out.println("email = " + emaill + " password = " + password);
//                usertocheck = new User(emaill, password);
//                System.out.println("email= " + logindetails.get(0)+ " "+ "password = " + logindetails.get(1));
//            }
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        System.out.println(usertocheck.getEmail()+" "+ usertocheck.getPassword());
//        return usertocheck;
//    }
//
//
//
//    private void printSQLException(SQLException ex) {
//        for (Throwable e : ex) {
//            if (e instanceof SQLException) {
//                e.printStackTrace(System.err);
//                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
//                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
//                System.err.println("Message: " + e.getMessage());
//                Throwable t = ex.getCause();
//                while (t != null) {
//                    System.out.println("Cause: " + t);
//                    t = t.getCause();
//                }
//            }
//        }
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
//}
//
//
//
//
//
