









<%
    String passwd = request.getParameter("passwd");
    String account = request.getParameter("account");
    if (passwd.equals(session.getAttribute("password")) && account.equals(session.getAttribute("email"))){
        response.sendRedirect("main.jsp");
    }else{
        response.sendRedirect("index.jsp");
    }
%>