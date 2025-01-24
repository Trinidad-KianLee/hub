package com.puphub.controller;

import com.puphub.dao.UserDao;
import com.puphub.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register") 
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String pupBranch = request.getParameter("pupBranch");

        // Check if any field is empty
        if (firstName == null || lastName == null || email == null || 
            password == null || confirmPassword == null || pupBranch == null ||
            firstName.isEmpty() || lastName.isEmpty() || email.isEmpty() || 
            password.isEmpty() || confirmPassword.isEmpty() || pupBranch.isEmpty()) {
            response.getWriter().println("All fields are required!");
            return;
        }

        // Password validation
        String passwordPattern = "^(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?]).{8,}$";
        if (!password.matches(passwordPattern)) {
            response.getWriter().println("Password must be at least 8 characters and include a special character.");
            return;
        }

        // Confirm password validation
        if (!password.equals(confirmPassword)) {
            response.getWriter().println("Passwords do not match.");
            return;
        }

        // Save user
        User user = new User(firstName, lastName, email, password, pupBranch);
        UserDao userDao = new UserDao();
        boolean isRegistered = false;
        try {
            isRegistered = userDao.registerUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (isRegistered) {
            response.getWriter().println("Registration successful!");
        } else {
            response.getWriter().println("Error registering user.");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/plain");
        response.getWriter().println("GET request received! This servlet is working.");
        System.out.println("GET request processed.");
    }
}
