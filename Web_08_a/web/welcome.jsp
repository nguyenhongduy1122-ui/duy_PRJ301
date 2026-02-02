<%-- 
    Document   : a
    Created on : Jan 19, 2026, 9:57:32 AM
    Author     : Duy
--%>

<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${user != null}">
            <h1>Welcome, ${user.fullName}</h1>
            <a href="MainController?action=logout&">Logout</a> <br/>
            <a href="search.jsp">Search</a>
        </c:if>
        <c:if test="empty user">
            <c:redirect url="login.jsp"/>
        </c:if>    
        </body>
    </html>