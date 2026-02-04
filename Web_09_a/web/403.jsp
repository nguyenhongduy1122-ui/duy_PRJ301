<%-- 
    Document   : 403
    Created on : Jan 19, 2026, 12:15:35 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="color:red">Tai Khoan cua ban bi khoa!!</h1>
        <h3>
           Lý do: <span style="color: red"> <%= request.getAttribute("message") %> </span>
        </h3>
        <a href="login.jsp"> Quay lai trang dang nhap</a>
    </body>
</html>
