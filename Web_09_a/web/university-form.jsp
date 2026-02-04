<%-- 
    Document   : university-form
    Created on : Feb 2, 2026, 9:58:44 AM
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
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="addUniversity"/>
            ID: <input type="text" name="id" value="${u.id}"/> <br/>
            Name: <input type="text" name="name" value="${u.name}"/> <br/>
            ShortName: <input type="text" name="shortName" value="${u.shortName}"/> <br/>
            Description: <input type="text" name="description" value="${u.description}"/> <br/>
            FoundedYear: <input type="number" step="1" min="0" name="foundedYear" value="${u.foundedYear}"/> <br/>
            Address: <input type="text" name="address" value="${u.address}"/> <br/>
            City: <input type="text" name="city" value="${u.city}"/> <br/>
            Region: <input type="text" name="region" value="${u.region}"/> <br/>
            Type: <input type="text" name="type" value="${u.type}"/> <br/>
            TotalStudent: <input type="number" step="1" min="0" name="totalStudent" value="${u.totalStudent}"/> <br/>
            TotalFaculties: <input type="number" step="1" min="0" name="totalFaculties" value="${u.totalFaculties}"/> <br/>
            IsDraft: <input type="checkbox" name="isDraft" checked="${u.isDraft}"/> <br/>
            <input type="submit" value="add">
        </form>
            <p style="color: green">${msg}</p>
            <p style="color: red">${error}</p>
    </body>
</html>
