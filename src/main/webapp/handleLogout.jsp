<%--
  Created by IntelliJ IDEA.
  User: sgm49
  Date: 25/03/2022
  Time: 2:40 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    session.removeAttribute("email");
    session.removeAttribute("name");
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
<body>
<a  href="index.jsp">Back to Login page</a>

</body>
</html>
