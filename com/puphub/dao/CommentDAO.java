package com.puphub.dao;

import com.puphub.model.Comment;
import com.puphub.util.DBconnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {

    // Create a new comment
	 public static boolean createComment(Comment comment) {
	        String query = "INSERT INTO comments (post_id, user_id, content, time_created) VALUES (?, ?, ?, ?)";

	        try (Connection conn = DBconnection.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(query)) {

	            stmt.setInt(1, comment.getPostId());
	            stmt.setInt(2, comment.getUserId());
	            stmt.setString(3, comment.getContent());
	            stmt.setTimestamp(4, new java.sql.Timestamp(System.currentTimeMillis()));

	            int rowsInserted = stmt.executeUpdate();
	            return rowsInserted > 0; // Return true if a row was inserted
	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.err.println("Error adding comment: " + e.getMessage());
	        }
	        return false;
	    }
	

    // Retrieve comments by post ID
    public static List<Comment> getCommentsByPostId(int postId) {
        List<Comment> comments = new ArrayList<>();
        String query = "SELECT c.comment_id, c.content, c.time_created, u.first_name, u.last_name "
                     + "FROM comments c "
                     + "JOIN users u ON c.user_id = u.user_id "
                     + "WHERE c.post_id = ? ORDER BY c.time_created ASC";

        try (Connection conn = DBconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, postId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setId(rs.getInt("comment_id"));
                comment.setContent(rs.getString("content"));
                comment.setTimeCreated(rs.getTimestamp("time_created"));
                comment.setFirstName(rs.getString("first_name"));
                comment.setLastName(rs.getString("last_name"));
                comments.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error retrieving comments: " + e.getMessage());
        }
        return comments;
    }
}
