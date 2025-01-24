package com.puphub.controller;

import com.puphub.dao.PostDAO;
import com.puphub.model.Post;
//import com.puphub.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/createPost")
public class PostServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    Integer userId = (Integer) session.getAttribute("user_id");

	    if (userId == null) {
	        response.sendRedirect("login.jsp");
	        return;
	    }

	    try {
	        String category = request.getParameter("category"); // Get category directly
	        String title = request.getParameter("title");
	        String content = request.getParameter("content");

	        Post post = new Post();
	        post.setUserId(userId);
	        post.setCategory(category); // Set category directly
	        post.setTitle(title);
	        post.setContent(content);

	        boolean success = PostDAO.createPost(post);

	        if (success) {
	            response.sendRedirect("posts.jsp?category=" + category);
	        } else {
	            response.getWriter().println("Failed to create post.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.getWriter().println("Error: " + e.getMessage());
	    }
	}

}