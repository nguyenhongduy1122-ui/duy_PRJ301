<%-- 
    Document   : welcome.jsp
    Created on : Jan 19, 2026, 9:57:32 AM
    Author     : Duy
--%>

<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - User Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        body {
            background: #f4f7f6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .navbar {
            box-shadow: 0 2px 4px rgba(0,0,0,.08);
        }
        .welcome-section {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card-custom {
            border: none;
            border-radius: 1rem;
            transition: transform 0.3s ease;
        }
        .card-custom:hover {
            transform: translateY(-5px);
        }
        .icon-circle {
            width: 80px;
            height: 80px;
            background: #e7f1ff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: #0d6efd;
            margin: 0 auto 1.5rem;
        }
    </style>
</head>
<body>

    <c:choose>
        <%-- Kiểm tra nếu user đã đăng nhập --%>
        <c:when test="${not empty sessionScope.user}">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <div class="container">
                    <a class="navbar-brand fw-bold" href="#"><i class="fas fa-database me-2"></i>Management System</a>
                    <div class="ms-auto d-flex align-items-center">
                        <span class="navbar-text text-white me-3">
                            Welcome, <span class="fw-bold text-warning">${user.fullName}</span>
                        </span>
                        <a href="MainController?action=logout" class="btn btn-outline-light btn-sm rounded-pill px-3">
                            <i class="fas fa-sign-out-alt me-1"></i>Logout
                        </a>
                    </div>
                </div>
            </nav>

            <div class="welcome-section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-6 text-center">
                            <div class="card card-custom shadow-lg p-5 bg-white">
                                <div class="icon-circle">
                                    <i class="fas fa-user-check"></i>
                                </div>
                                <h1 class="fw-bold text-dark mb-3">Hello, ${user.fullName}!</h1>
                                <p class="text-muted mb-4">You have successfully logged into the system. What would you like to do next?</p>
                                
                                <div class="d-grid gap-3">
                                    <a href="search.jsp" class="btn btn-primary btn-lg rounded-pill shadow-sm">
                                        <i class="fas fa-search me-2"></i>Search Records
                                    </a>
                                    <a href="add.jsp" class="btn btn-outline-secondary btn-lg rounded-pill">
                                        <i class="fas fa-plus me-2"></i>Add New Entry
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <footer class="py-3 bg-white border-top mt-auto text-center text-muted">
                <small>&copy; 2026 System Managed by <strong>Duy</strong></small>
            </footer>
        </c:when>

        <%-- Nếu chưa đăng nhập (user bị null hoặc empty) --%>
        <c:otherwise>
            <c:redirect url="login.jsp"/>
        </c:otherwise>
    </c:choose>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>