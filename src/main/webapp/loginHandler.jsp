<%@ page import="uts.isd.model.User" %>


<%
    String passwd = request.getParameter("passwd");
    String account = request.getParameter("account");
    if(session.getAttribute("user") != null) {
        User user = (User)session.getAttribute("user");
        if (passwd.equals(user.getPassword()) && account.equals(user.getEmail())){
            response.sendRedirect("main.jsp");
        }else{
            response.sendRedirect("index.jsp");
        }
    }
    else
        response.sendRedirect("index.jsp");
%>