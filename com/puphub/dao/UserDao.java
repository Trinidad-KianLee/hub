package com.puphub.dao;

import com.puphub.model.User;
import com.puphub.util.DBconnection;

import jakarta.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    // Method to register a user
    public boolean registerUser(User user) throws SQLException {
        String sql = "INSERT INTO users (first_name, last_name, email, password_hash, pup_branch) VALUES (?, ?, ?, ?, ?)";
        Connection connection = null;
        boolean isRegistered = false;
        try {
            connection = DBconnection.getConnection();
            connection.setAutoCommit(false); // Start transaction
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, user.getFirstName());
            statement.setString(2, user.getLastName());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPasswordHash());
            statement.setString(5, user.getPupBranch());

            isRegistered = statement.executeUpdate() > 0; // Returns true if user is inserted
            connection.commit(); // Commit transaction
        } catch (Exception e) {
            if (connection != null) {
                connection.rollback();
            }
            e.printStackTrace();
        } finally {
            if (connection != null) {
                connection.setAutoCommit(true); // Restore auto-commit mode
            }
        }
        return isRegistered;
    }

    // Method to log in a user
    public User loginUser(String email, String password, HttpSession session) {
        String sql = "SELECT * FROM users WHERE email = ?";
        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String storedPasswordHash = resultSet.getString("password_hash");

                // Compare the stored password with the input password (plain text for now)
                if (storedPasswordHash.equals(password)) { // Adjust this if using hashing
                    // Store user_id in the session
                    session.setAttribute("user_id", resultSet.getInt("user_id"));

                    // Return a populated User object
                    return new User(
                            resultSet.getString("first_name"),
                            resultSet.getString("last_name"),
                            resultSet.getString("email"),
                            storedPasswordHash,
                            resultSet.getString("pup_branch")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Return null if no user found or credentials invalid
    }

        
    public int getUserIdByEmail(String email) {
        String sql = "SELECT user_id FROM users WHERE email = ?";
        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt("user_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Return -1 if user not found
    }


}
