<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%!
        // JDBC connection variables
        String url = "jdbc:mysql://localhost:3306/your_database";
        String username = "your_username";
        String password = "your_password";

        Connection connection = null;
        PreparedStatement preparedStatement = null;
    %>
    
    <%
        // Getting form data
        String name = request.getParameter("input1");
        String email = request.getParameter("input2");
        String contactNo = request.getParameter("input3");
        String query = request.getParameter("input4");

        try {
            // Establishing database connection
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);

            // Creating SQL query
            String sql = "INSERT INTO your_table (name, email, contact_no, query) VALUES (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, contactNo);
            preparedStatement.setString(4, query);

            // Executing the query
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<h2>Data inserted successfully!</h2>");
            } else {
                out.println("<h2>Error inserting data</h2>");
            }
        } catch (Exception e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
            // Closing resources
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        }
    %>

   