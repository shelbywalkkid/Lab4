<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 24.10.2017
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>

<html>
<head>
    <title>Welcome</title>
</head>
<body>
<h1>Welcome! Вроде БДшка пользователя</h1>

<table border="1">
    <thead>
    <tr>
        <th>Game ID</th>
        <th>Name</th>
        <th>Company</th>
        <th>Genre</th>

    </tr>
    </thead>
    <tbody>
    <%
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/users");

        Connection conn = ds.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM games");

        while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("game_id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("company") %></td>
        <td><%= rs.getString("genre") %></td>
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
