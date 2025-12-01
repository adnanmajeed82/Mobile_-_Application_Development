<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>

<%
    // ---------------------------
    // SIMPLE LOGIN SYSTEM (NO DB)
    // ---------------------------
    String user = request.getParameter("user");
    String pass = request.getParameter("pass");

    boolean loggedIn = false;

    if("admin".equals(user) && "123".equals(pass)) {
        loggedIn = true;
        session.setAttribute("logged", true);
    }

    if(session.getAttribute("logged") != null) {
        loggedIn = true;
    }

    // ---------------------------
    // LMS DUMMY DATA
    // ---------------------------
    String studentName = "Mujeeb Ur Rehman";

    List<String> courses = Arrays.asList(
            "Mobile App Development",
            "Web Engineering",
            "Database Systems",
            "AI & Machine Learning"
    );

    Map<String, String> assignments = new LinkedHashMap<>();
    assignments.put("Mobile App Assignment 01", "Submitted");
    assignments.put("Database ERD Task", "Pending");
    assignments.put("AI Project", "Not Submitted");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Single-File LMS System</title>
    <style>
        body { font-family: Arial; background:#eef0f3; padding:20px; }
        .box { background:white; padding:20px; border-radius:10px; width:60%; margin:auto; }
        .login-box { background:white; padding:20px; width:300px; margin:auto; border-radius:10px; }
        input { width:100%; padding:10px; margin-top:10px; }
        button { padding:10px; width:100%; background:#2980b9; color:white; border:none; margin-top:10px; }
        h1, h2 { color:#2c3e50; }
        table { width:100%; border-collapse:collapse; margin-top:20px; }
        th, td { padding:10px; border:1px solid #ccc; }
        th { background:#2c3e50; color:white; }
    </style>
</head>
<body>

<%
    // If not logged in → show login page
    if(!loggedIn) {
%>
<div class="login-box">
    <h2>LMS Login</h2>
    <form method="post">
        <input type="text" name="user" placeholder="username: admin" required>
        <input type="password" name="pass" placeholder="password: 123" required>
        <button type="submit">Login</button>
    </form>
</div>

<%
} else {
%>

<div class="box">
    <h1>Student Learning Management System</h1>
    <p><strong>Student:</strong> <%= studentName %></p>

    <h2>My Courses</h2>
    <ul>
        <% for(String c : courses) { %>
        <li><%= c %></li>
        <% } %>
    </ul>

    <h2>Assignments</h2>
    <table>
        <tr>
            <th>Assignment</th>
            <th>Status</th>
        </tr>
        <% for(Map.Entry<String,String> a : assignments.entrySet()) { %>
        <tr>
            <td><%= a.getKey() %></td>
            <td><%= a.getValue() %></td>
        </tr>
        <% } %>
    </table>

    <br>
    <form method="post">
        <button name="logout" value="1" style="background:red;">Logout</button>
    </form>

    <%
        if(request.getParameter("logout") != null){
            session.invalidate();
            response.sendRedirect("index.jsp");
        }
    %>
</div>

<%
    }
%>

</body>
</html>
