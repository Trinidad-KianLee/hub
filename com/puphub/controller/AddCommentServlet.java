package com.puphub.controller;

import com.puphub.dao.CommentDAO;
import com.puphub.model.Comment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/addComment")
public class AddCommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        // Redirect to login if user is not logged in
        if (userId == null) {
            response.sendRedirect("login.jsp?error=Please login to comment");
            return;
        }

        try {
            int postId = Integer.parseInt(request.getParameter("postId"));
            String content = request.getParameter("content");

            if (content == null || content.trim().isEmpty()) {
                response.sendRedirect("posts.jsp?category=all&error=Comment cannot be empty");
                return;
            }

            // Create a new Comment object
            Comment comment = new Comment();
            comment.setPostId(postId);
            comment.setUserId(userId);
            comment.setContent(content.trim());

            // Save the comment
            boolean success = CommentDAO.createComment(comment);
            if (success) {
                response.sendRedirect("posts.jsp?category=all&message=Comment added successfully");
            } else {
                response.getWriter().println("Failed to add comment. Please try again.");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("posts.jsp?category=all&error=Invalid post ID");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An unexpected error occurred: " + e.getMessage());
        }
    }
}
