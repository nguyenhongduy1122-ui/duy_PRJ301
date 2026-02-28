<%-- 
    Document   : 403
    Created on : Jan 19, 2026, 12:15:35 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>403 - Truy cập bị từ chối</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        
        <style>
            body {
                background-color: #f8f9fa;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0;
            }
            .error-card {
                max-width: 500px;
                width: 90%;
                border: none;
                border-radius: 20px;
                box-shadow: 0 15px 35px rgba(0,0,0,0.1);
                background: white;
                padding: 40px;
                text-align: center;
            }
            .icon-box {
                width: 100px;
                height: 100px;
                background-color: #fff5f5;
                color: #e53e3e;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 50px;
                border-radius: 50%;
                margin: 0 auto 25px;
            }
            .btn-back {
                padding: 12px 30px;
                border-radius: 10rem;
                font-weight: 600;
                transition: all 0.3s;
            }
        </style>
    </head>
    <body>

        <div class="error-card shadow-lg">
            <div class="icon-box">
                <i class="fa-solid fa-user-lock"></i>
            </div>
            
            <h2 class="fw-bold text-dark mb-2">Tài khoản đã bị khóa!</h2>
            <p class="text-muted mb-4">Rất tiếc, bạn không thể truy cập vào hệ thống vào lúc này.</p>
            
            <div class="alert alert-danger border-0 py-3 mb-4 shadow-sm" style="background-color: #fff5f5;">
                <small class="text-uppercase fw-bold d-block mb-1" style="font-size: 0.7rem; letter-spacing: 1px;">Lý do cụ thể</small>
                <span class="fw-semibold">
                    ${message != null ? message : "Vi phạm quy định hoặc chưa được kích hoạt."}
                </span>
            </div>

            <div class="d-grid">
                <a href="login.jsp" class="btn btn-danger btn-back shadow-sm">
                    <i class="fa-solid fa-arrow-left me-2"></i> Quay lại Đăng nhập
                </a>
            </div>
            
            <div class="mt-4">
                <small class="text-muted">Liên hệ Quản trị viên nếu bạn cho rằng đây là một sự nhầm lẫn.</small>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>