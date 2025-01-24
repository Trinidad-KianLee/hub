package com.puphub.dao;

import com.puphub.model.Post;
import com.puphub.util.DBconnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {

    // Method to create a new post
    public static boolean createPost(Post post) {
        String query = "INSERT INTO posts (user_id, category, title, content, time_created) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, post.getUserId());
            stmt.setString(2, post.getCategory());
            stmt.setString(3, post.getTitle());
            stmt.setString(4, post.getContent());
            stmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0; // Return true if a row was inserted
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error creating post: " + e.getMessage());
        }
        return false;
    }

    // Method to retrieve posts by category (including user details)
    public static List<Post> getPostsByCategory(String category) {
        List<Post> posts = new ArrayList<>();
        String query = "SELECT p.post_id, p.category, p.title, p.content, p.time_created, "
                     + "u.first_name, u.last_name, u.pup_branch "
                     + "FROM posts p "
                     + "JOIN users u ON p.user_id = u.user_id "
                     + "WHERE p.category = ?";
        if ("all".equalsIgnoreCase(category)) {
            query = "SELECT p.post_id, p.category, p.title, p.content, p.time_created, "
                  + "u.first_name, u.last_name, u.pup_branch "
                  + "FROM posts p "
                  + "JOIN users u ON p.user_id = u.user_id";
        }

        try (Connection conn = DBconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            if (!"all".equalsIgnoreCase(category)) {
                stmt.setString(1, category); // Set category for filtering
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("post_id"));
                post.setCategory(rs.getString("category"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setTimestamp(rs.getTimestamp("time_created"));

                // Add user details to the post
                post.setFirstName(rs.getString("first_name"));
                post.setLastName(rs.getString("last_name"));
                post.setPupBranch(rs.getString("pup_branch"));

                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error retrieving posts by category: " + e.getMessage());
        }

        return posts;
    }
}
