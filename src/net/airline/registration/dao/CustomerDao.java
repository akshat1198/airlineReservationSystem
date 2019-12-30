package net.airline.registration.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import net.airline.registration.model.Customers;
public class CustomerDao {

	public int registerCustomer(Customers customer) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO airline.customerData" +
            "  (ID,first_name,last_name,email,username,password,phone) VALUES " +
            " (?, ?, ?, ?, ?,?,?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://cs336database.cjkscrsiieac.us-east-2.rds.amazonaws.com:3306/airline","antmatos21", "!1Antmat");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, null);
            preparedStatement.setString(2, customer.getFirstName());
            preparedStatement.setString(3, customer.getLastName());
            preparedStatement.setString(4, customer.getEmail());
            preparedStatement.setString(5, customer.getUsername());
            preparedStatement.setString(6, customer.getPassword());
            preparedStatement.setString(7, customer.getPhone());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
	
}
