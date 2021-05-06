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
//import com.example.demo8.Model.User;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//
//@WebServlet(name = "DbServlet", value = "/DbServlet")
//public class DbServlet extends HttpServlet {
//    Connection connection = null;
//    private static String jdbcURL = "jdbc:mysql://localhost/facebookDB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
//    //private static String jdbcURL = "jdbc:mysql://localhost:3306/facebookDB";
//    private static String jdbcUsername = "root";
//    private static String jdbcPassword = "root";
//
//    private static final String INSERT_USERS_SQL = "INSERT INTO users  (first_name,surname, phone_number,email, day_of_birth, month_of_birth, year_of_birth, gender) VALUES (?, ?, ?,?,?,?,?,?)";
//
//    private static final String SELECT_USER_BY_Email = "select first_name,surname, phone_number,email, day_of_birth, month_of_birth, year_of_birth, gender from users where email =?";
//    private static final String SELECT_ALL_USERS = "select * from users";
//    private static final String DELETE_USERS_SQL = "delete from users where email = ?;";
//    private static final String UPDATE_USERS_SQL = "update users set firstname = ?, email= ?, phone_number =? where id = ?;";
//
//
////    public  Connection getConnection() {
////        try {
////           // Class.forName("com.mysql.cj.jdbc.Driver");
////            Class.forName("com.mysql.cj.jdbc.Driver");
////
////            Connection  connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
////            System.out.println("i got the connection"+connection.getSchema());
////        } catch (Exception e) {
////            e.printStackTrace();
////            System.out.println("couldnt get the connection");
////        }
////        return connection;
////    }
//
//    public Connection getConnection(){
//        String url;
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            url="jdbc:mysql://localhost/facebookDB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
//            connection = DriverManager.getConnection(url,"root","root");
//            System.out.println("Connection created");
//            //connection.close();
//            System.out.println("Connection closed");
//        }
//        catch (Exception e) {
//            System.out.println(e.toString());
//        } return connection;
//    }
//
//
//    PreparedStatement  preparedStatement;
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response){
//        System.out.println(INSERT_USERS_SQL);
//        // try-with-resource statement will auto close the connection.
//      Connection connection = getConnection();
//
//        try {
//            preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
//            System.out.println("the prepared statement is :"+ preparedStatement);
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//
//
//                String first_name = request.getParameter("first_name");
//                String surname = request.getParameter("surname");
//                String phone_number = request.getParameter("phone_number");
//                String email = request.getParameter("email");
//                int day_of_birth = Integer.parseInt(request.getParameter("day_of_birth"));
//                String month_of_birth = request.getParameter("month_of_birth");
//                int year_of_birth = Integer.parseInt(request.getParameter("year_of_birth"));
//                String gender = request.getParameter("gender");
//
//                User newUser = new User(first_name,surname, phone_number,email, day_of_birth, month_of_birth,year_of_birth, gender);
//
//        try {
//            preparedStatement.setString(1, first_name);
//            preparedStatement.setString(2, surname);
//            preparedStatement.setString(3, phone_number);
//            preparedStatement.setString(4, email);
//            preparedStatement.setInt(5, day_of_birth);
//            preparedStatement.setString(6, month_of_birth);
//            preparedStatement.setInt(7, year_of_birth);
//            preparedStatement.setString(8, gender);
//            System.out.println(preparedStatement);
//            preparedStatement.executeUpdate();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        System.out.println("successfully added new user to the database");
//
//    }
//
//
//    public User selectUser(String email) {
//        User user = null;
////        List<User> users = new ArrayList<>();
//        // Step 1: Establishing a Connection
//        try (Connection connection = getConnection();
//             // Step 2:Create a statement using connection object
//             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_Email);) {
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
//        } catch (SQLException e) {
//            printSQLException(e);
//        }
//        return user;
//    }
//
//
//    public List<User> selectAllUsers() {
//
//        // using try-with-resources to avoid closing resources (boiler plate code)
//        List<User> users = new ArrayList<>();
//        // Step 1: Establishing a Connection
//        try (Connection connection = getConnection();
//
//             // Step 2:Create a statement using connection object
//             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
//            System.out.println(preparedStatement);
//            // Step 3: Execute the query or update query
//            ResultSet rs = preparedStatement.executeQuery();
//
//            // Step 4: Process the ResultSet object.
//            while (rs.next()) {
//                //int id = rs.getInt("id");
//                String first_name = rs.getString("first_name");
//                String surname = rs.getString("surname");
//                String phone_number = rs.getString("phone_number");
//                String email = rs.getString("email");
//                int day_of_birth = rs.getInt("day_of_birth");
//                String month_of_birth = rs.getString("month_of_birth");
//                int year_of_birth = rs.getInt("year_of_birth");
//                String gender = rs.getString("gender");
//                users.add(new User(first_name, surname, phone_number, email, day_of_birth, month_of_birth, year_of_birth, gender));
//            }
//        } catch (SQLException e) {
//            printSQLException(e);
//        }
//        return users;
//    }
//
//
//    public boolean deleteUser(String email) throws SQLException {
//        boolean rowDeleted;
//        try (Connection connection = getConnection();
//             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
//            statement.setString(4, email);
//            rowDeleted = statement.executeUpdate() > 0;
//        }
//        return rowDeleted;
//    }
//
//
//    public boolean updateUser(User user) throws SQLException {
//        boolean rowUpdated;
//        try (Connection connection = getConnection();
//             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
//            statement.setString(1, user.getFirst_name());
//            statement.setString(4, user.getEmail());
//            statement.setString(3, user.getPhone_number());
//
//            rowUpdated = statement.executeUpdate() > 0;
//        }
//        return rowUpdated;
//    }
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
