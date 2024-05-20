<%--
  Created by IntelliJ IDEA.
  User: ShelbyWalk
  Date: 02.05.2024
  Time: 2:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>

<html>
<head>
    <title>Welcome</title>
</head>
<body>
<h1>Welcome! Вроде БДшка админа</h1>

<table border="1">
    <thead>
    <tr>
        <th>User ID</th>
        <th>Login</th>
        <th>Email</th>
        <th>Password</th>
        <th>Role</th>
    </tr>
    </thead>
    <tbody>
    <%
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/users");

        Connection conn = ds.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM users");

        while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("user_id") %></td>
        <td><%= rs.getString("login") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("password") %></td>
        <td><%= rs.getString("role") %></td>
    </tr>
    <%
        }
        rs.close();
        stmt.close();
        conn.close();
    %>
    </tbody>
</table>

</body>
</html>
