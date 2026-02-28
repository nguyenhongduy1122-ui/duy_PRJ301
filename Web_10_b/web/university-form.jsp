<%-- 
    Document   : university-form
    Created on : Feb 2, 2026, 9:58:44 AM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="${mode=='update'?'saveUpdateUniversity':'addUniversity'}"/>

            ID: <input type="text" name="id" value="${u.id}" ${mode == 'update' ? 'readonly' : ''} /> <br/>
            Name: <input type="text" name="name" value="${u.name}"/> <br/>
            ShortName: <input type="text" name="shortName" value="${u.shortName}"/> <br/>
            Description: <input type="text" name="description" value="${u.description}"/> <br/>
            FoundedYear: <input type="number" step="1" min="0" name="foundedYear" value="${u.foundedYear}"/> <br/>
            Address: <input type="text" name="address" value="${u.address}"/> <br/>
            City: <input type="text" name="city" value="${u.city}"/> <br/>
            Region: <input type="text" name="region" value="${u.region}"/> <br/>
            Type: <input type="text" name="type" value="${u.type}"/> <br/>
            TotalStudents: <input type="number" step="1" min="0" name="totalStudents" value="${u.totalStudents}"/> <br/>
            TotalFaculties: <input type="number" step="1" min="0" name="totalFaculties" value="${u.totalFaculties}"/> <br/>
            IsDraft: <input type="checkbox" ${u.isDraft ? 'checked' : ''} name="isDraft"/> <br/>
            <c:choose>
                <c:when test="${mode == 'update'}">
                    <input type="submit" value="Update"/>
                </c:when>
                <c:otherwise>
                    <input type="submit" value="Add"/>
                </c:otherwise>
            </c:choose>
        </form>
        <p style="color: green">${msg}</p>
        <p style="color: red">${error}</p>
    </body>
</html>
