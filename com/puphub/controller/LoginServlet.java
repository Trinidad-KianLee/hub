package com.puphub.controller;

import com.puphub.dao.UserDao;
import com.puphub.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("Login attempt with Email: " + email);

        HttpSession session = request.getSession();
        UserDao userDao = new UserDao();
        User user = userDao.loginUser(email, password, session);

        if (user != null) {
            // Store the User object and user_id in the session
            session.setAttribute("user", user);
            session.setAttribute("user_id", userDao.getUserIdByEmail(email));
            
            //debugging
            System.out.println("Session user_id: " + session.getAttribute("user_id"));

            System.out.println("User logged in: " + email + " with user_id: " + session.getAttribute("user_id"));
            response.sendRedirect("dashboard.jsp");
        } else {
            System.out.println("Invalid credentials.");
            response.sendRedirect("login.jsp?error=Invalid credentials");
        }
    }
}

