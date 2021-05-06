package com.example.demo8.web;

import com.example.demo8.Model.Comment;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import java.sql.*;

@WebServlet(name = "CommentDAO", value = "/CommentDAO")
public class CommentDAO extends HttpServlet {
    Connection connection = null;

    private static final String INSERT_NEW_COMMENT = "INSERT INTO comments  (email,comment,sessionId,  creationTime,  lastAccessedTime) VALUES (?, ?,?,?,?)";

    //  private static final String SELECT_USER_BY_Email = "select first_name,surname, phone_number,email, day_of_birth, month_of_birth, year_of_birth, gender from users where email =?";

    public  Connection getConnection(){
        String url;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            url="jdbc:mysql://localhost/facebookDB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            connection = DriverManager.getConnection(url,"root","root");
            System.out.println("Connection created");
        }
        catch (Exception e) {
            System.out.println(e.toString());
        } return connection;
    }





    PreparedStatement  preparedStatement;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String comment = request.getParameter("comment");

        session.setAttribute("comment", comment);


        String email = (String)session.getAttribute("email");

        String sessionId = session.getId();
        Date creationTime = new Date(session.getCreationTime());
        Date lastAccessedTime = new Date(session.getLastAccessedTime());






        System.out.println("session attribute email : " + email+ "comment = " + comment);
        System.out.println(session.getId()+" ,"+ creationTime+ " ,"+ lastAccessedTime+ " , "+comment+ "  ," + email);



        Comment newComment = new Comment(email,comment,sessionId,  creationTime,  lastAccessedTime);
        newComment.Comment.add(comment);

        System.out.println(newComment);
        insertComment(newComment);
        System.out.println("comment submitted successfully");
        //response.sendRedirect("facebookHome.jsp");
        RequestDispatcher dispatcher = request.getRequestDispatcher("facebookHome.jsp");
        dispatcher.forward(request, response);


    }
    public void insertComment(Comment comment){
        System.out.println(INSERT_NEW_COMMENT);
        // try-with-resource statement will auto close the connection.
        Connection connection = getConnection();

        try {
            preparedStatement = connection.prepareStatement(INSERT_NEW_COMMENT);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        try {
            preparedStatement.setString(1, comment.getEmail());
            preparedStatement.setString(2, comment.getComment());
            preparedStatement.setString(3, comment.getSessionId());
            preparedStatement.setDate(4, (Date) comment.getCreationTime());
            preparedStatement.setDate(5, (Date) comment.getLastAccessedTime());


            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        System.out.println("successfully added new comment to the database");

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String feedback = request.getParameter("feedback");
//        System.out.println("Feed back is: " + feedback);
    }
}
































//package com.example.demo8.dao;
//
//import java.util.logging.*;
//import java.sql.*;
//import java.util.*;
////import connect.model.PostModel;
////import connect.model.CommentDetailsModel;
////import connect.db.util.DBConnection;
//
//
//public class PostDao {
//
//	private static Logger logger = Logger.getLogger("com.my.connection");
//
//	public static void addPost(int userId, String postContent, String filePath) {
//
//		logger.info("<>Inside PostDao class addPost method()");
//
//		try {
//
//			Connection con = UserDAO.getConnection();
//
//			String insQry = " INSERT INTO POST(USER_ID, POST_CONTENT, POST_FILE_PATH) VALUES(?,?,?) ";
//
//			PreparedStatement preStmt = con.prepareStatement(insQry);
//			preStmt.setInt(1,userId);
//			preStmt.setString(2,postContent);
//			preStmt.setString(3,filePath);
//
//			preStmt.executeUpdate();
//			logger.info("<>Post added Successfully!!!");
//
//		} catch(Exception ex) {
//
//			logger.severe("<>"+ex.getMessage());
//		}
//	}
//
//
//	public static ArrayList<PostModel> getPost(int userId) {
//
//		logger.info("<>Inside PostDao class getPost method()");
//
//		ArrayList<PostModel> post = new ArrayList<PostModel>();
//
//		try {
//
//			Connection con = UserDAO.getConnection();
//
//			private static final String SELECT_ALL_POST = "select * from post";
//
//			String selQry = " SELECT POST_FILE_PATH, POST_CONTENT, PO.POST_ID AS POST_ID, COUNT(POST_COUNT) AS LIKE_COUNT, POST_TIME, USER_ID, " +
//							" USER_NAME, USER_PROFILE, LIKES.POST_ID AS LIKE_ID "+
//							" FROM " +
//							" ( " +
//							" SELECT POST_FILE_PATH, PO.POST_ID AS POST_ID, LIKES.POST_ID AS POST_COUNT, " +
//							" POST_CONTENT, POST_TIME, PO.USER_ID AS USER_ID, USER_NAME, USER_PROFILE " +
//							" FROM " +
//							" ( " +
//							" SELECT POST_FILE_PATH, PO.POST_CONTENT AS POST_CONTENT, PO.POST_TIME AS POST_TIME, " +
//							" PO.POST_ID AS POST_ID ,PO.USER_ID AS USER_ID,USER.USER_NAME AS USER_NAME, USER.USER_PROFILE AS USER_PROFILE " +
//							" FROM " +
//							" POST AS PO,USER_DETAILS AS USER  WHERE PO.USER_ID = USER.USER_ID AND PO.USER_ID " +
//							" IN " +
//							" ( " +
//							" SELECT FL.UID1 AS USER_ID FROM FRIEND_LIST AS FL WHERE FL.UID2= ? " +
//							" UNION " +
//							" SELECT FL.UID2 AS USER_ID FROM FRIEND_LIST AS FL WHERE FL.UID1= ?  " +
//							" ) " +
//							" ) " +
//							" AS PO LEFT JOIN LIKES ON LIKES.POST_ID = PO.POST_ID " +
//							" ) " +
//							" AS  PO LEFT JOIN " +
//							" ( " +
//							" SELECT LIKES.POST_ID FROM LIKES WHERE LIKES.USER_ID = ? " +
//							" ) " +
//							" AS LIKES ON LIKES.POST_ID = PO.POST_ID GROUP BY POST_ID ORDER BY POST_ID DESC";
//
//			/*String selQry = " SELECT POST_FILE_PATH, POST_CONTENT, POST_ID, COUNT(POST_COUNT) AS LIKE_COUNT, POST_TIME, USER_ID, USER_NAME, USER_PROFILE FROM " +
//							" ( " +
//							" SELECT POST_FILE_PATH, PO.POST_ID AS POST_ID, LIKES.POST_ID AS POST_COUNT, POST_CONTENT, POST_TIME, PO.USER_ID AS USER_ID, USER_NAME, USER_PROFILE" +
//							" FROM "+
//							" ( " +
//							" SELECT POST_FILE_PATH, PO.POST_CONTENT AS POST_CONTENT,PO.POST_TIME AS POST_TIME,PO.POST_ID AS POST_ID ,PO.USER_ID AS USER_ID,USER.USER_NAME AS USER_NAME, USER.USER_PROFILE AS USER_PROFILE " +
//							" FROM POST AS PO,USER_DETAILS AS USER "+
//							" WHERE " +
//							" PO.USER_ID = USER.USER_ID AND PO.USER_ID" +
//							" IN " +
//							" ( " +
//							" SELECT FL.UID1 AS USER_ID FROM FRIEND_LIST AS FL WHERE FL.UID2=? " +
//							" UNION " +
//							" SELECT FL.UID2 AS USER_ID FROM FRIEND_LIST AS FL WHERE FL.UID1=? " +
//							" ) " +
//							" ) " +
//							" AS PO LEFT JOIN LIKES ON LIKES.POST_ID = PO.POST_ID " +
//							" ) " +
//							" AS " +
//							" PO GROUP BY POST_ID ORDER BY POST_ID DESC"; */
//
//			PreparedStatement preStmt = con.prepareStatement(selQry);
//			preStmt.setInt(1,userId);
//			preStmt.setInt(2,userId);
//			preStmt.setInt(3,userId);
//			ResultSet rs = preStmt.executeQuery();
//
//
//
//			while(rs.next()) {
//
//				PostModel po = new PostModel();
//				po.setUserName(rs.getString("USER_NAME"));
//				po.setUserId(rs.getInt("USER_ID"));
//				po.setPostId(rs.getInt("POST_ID"));
//				po.setTimestamp(rs.getTimestamp("POST_TIME"));
//				po.setContent(rs.getString("POST_CONTENT"));
//				po.setLikeCount(rs.getInt("LIKE_COUNT"));
//				po.setProfilePicPath(rs.getString("USER_PROFILE"));
//				po.setPostFilePath(rs.getString("POST_FILE_PATH"));
//				po.setId(rs.getInt("POST_ID"));
//				po.setIsLiked(rs.getInt("LIKE_ID") != 0 ? true: false);
//				ArrayList<CommentDetailsModel> cdm = new ArrayList<CommentDetailsModel>();
//				po.setComments(cdm);
//				post.add(po);
//			}
//
//			logger.info("<>Sending post!!!");
//
//		} catch(Exception ex) {
//			logger.severe("<>"+ex.getMessage());
//		}
//
//		return post;
//	}
//
//
//
//	public static ArrayList<PostModel> getMyPostList(int userId) {
//
//		logger.info("<>Inside PostDao class getPost method()");
//		ArrayList<PostModel> post = new ArrayList<PostModel>();
//
//		try {
//
//			Connection con = DBConnection.getConnection();
//
//			String postSelQry = " SELECT POST_FILE_PATH, POST_ID,USER_ID,USER_NAME,POST_CONTENT,POST_TIME,COUNT(POST_COUNT) AS LIKE_COUNT,USER_PROFILE FROM " +
//								" ( " +
//								" SELECT POST_FILE_PATH, PO.POST_ID,PO.USER_ID AS USER_ID,POST_CONTENT, POST_TIME,USER_NAME,LIKES.POST_ID AS POST_COUNT,USER_PROFILE FROM " +
//								" ( " +
//								" SELECT POST_FILE_PATH, POST_ID,PO.USER_ID AS USER_ID,POST_CONTENT, POST_TIME,USER_NAME,USER_PROFILE FROM " +
//								" ( " +
//								" SELECT POST_FILE_PATH, POST_ID,POST_CONTENT, POST_TIME, PO.USER_ID FROM POST AS PO WHERE PO.USER_ID = ? " +
//								" ) " +
//								" AS PO " +
//								" LEFT JOIN " +
//								" USER_DETAILS AS USER ON PO.USER_ID = USER.USER_ID " +
//								" ) " +
//								" AS PO LEFT JOIN LIKES ON PO.POST_ID = LIKES.POST_ID " +
//								" ) " +
//								" AS RESULT GROUP BY POST_ID ORDER BY POST_ID DESC ";
//
//			PreparedStatement postStmt = con.prepareStatement(postSelQry);
//			postStmt.setInt(1,userId);
//
//			ResultSet postRs = postStmt.executeQuery();
//
//
//			logger.info("<>Fetching Post Details");
//			while(postRs.next()) {
//				PostModel po = new PostModel();
//				po.setId(postRs.getInt("POST_ID"));
//				po.setUserName(postRs.getString("USER_NAME"));
//				po.setUserId(postRs.getInt("USER_ID"));
//				po.setPostId(postRs.getInt("POST_ID"));
//				po.setTimestamp(postRs.getTimestamp("POST_TIME"));
//				po.setContent(postRs.getString("POST_CONTENT"));
//				po.setLikeCount(postRs.getInt("LIKE_COUNT"));
//				po.setProfilePicPath(postRs.getString("USER_PROFILE"));
//				po.setPostFilePath(postRs.getString("POST_FILE_PATH"));
//				post.add(po);
//			}
//			logger.info("<>Adding Post Details");
//
//		} catch(Exception ex) {
//
//			logger.severe("<>"+ex.getMessage());
//		}
//
//		return post;
//	}
//
//
//	public static int getLastPostId() {
//
//		int lastPostId = 0;
//
//		try {
//
//			Connection con = DBConnection.getConnection();
//
//			String qry= " SELECT MAX(POST_ID) AS LAST_POST_ID FROM POST ";
//
//			PreparedStatement pre = con.prepareStatement(qry);
//			ResultSet rs = pre.executeQuery();
//
//			rs.next();
//
//			lastPostId = rs.getInt("LAST_POST_ID");
//
//		} catch(Exception ex) {
//
//			logger.severe("<>"+ex.getMessage());
//		}
//
//		return lastPostId;
//	}
//}
