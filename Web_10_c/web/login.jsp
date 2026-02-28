<%-- 
    Document   : login
    Created on : Jan 19, 2026, 9:51:05 AM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Đăng nhập hệ thống</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        
        <style>
            body {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0;
            }
            .login-card {
                max-width: 400px;
                width: 90%;
                border: none;
                border-radius: 1.5rem;
                box-shadow: 0 1rem 3rem rgba(0,0,0,0.175);
                overflow: hidden;
            }
            .card-header {
                background-color: #ffffff;
                border-bottom: none;
                padding-top: 2rem;
                text-align: center;
            }
            .form-control {
                border-radius: 0.5rem;
                padding: 0.75rem 1rem;
            }
            .btn-login {
                border-radius: 0.5rem;
                padding: 0.75rem;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 1px;
            }
        </style>
    </head>
    <body>

        <div class="card login-card shadow-lg">
            <div class="card-header">
                <i class="fa-solid fa-user-circle fa-4x text-primary mb-3"></i>
                <h3 class="fw-bold text-dark">CHÀO MỪNG</h3>
                <p class="text-muted small">Đăng nhập để bắt đầu phiên làm việc</p>
            </div>
            
            <div class="card-body p-4 pt-0">
                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="login"/>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Tên đăng nhập</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0"><i class="fa-solid fa-user text-muted"></i></span>
                            <input type="text" class="form-control border-start-0" 
                                   name="txtUsername" placeholder="Nhập username..." required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-semibold">Mật khẩu</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0"><i class="fa-solid fa-lock text-muted"></i></span>
                            <input type="password" class="form-control border-start-0" 
                                   name="txtPassword" placeholder="Nhập password..." required>
                        </div>
                    </div>

                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary btn-login shadow">
                            Đăng nhập <i class="fa-solid fa-sign-in-alt ms-2"></i>
                        </button>
                    </div>
                </form>

                <c:if test="${not empty message}">
                    <div class="alert alert-danger mt-4 py-2 small border-0 shadow-sm" role="alert">
                        <i class="fa-solid fa-triangle-exclamation me-2"></i> ${message}
                    </div>
                </c:if>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>