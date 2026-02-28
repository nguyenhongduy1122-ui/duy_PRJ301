<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>UniManager - Tra cứu Đại học</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        
        <style>
            :root {
                --primary-color: #4e73df;
            }
            body { 
                background-color: #f8f9fc; 
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .main-container {
                margin-top: 2rem;
                margin-bottom: 3rem;
            }
            .search-card {
                border: none;
                border-radius: 15px;
                box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            }
            .table-container {
                background: white;
                border-radius: 15px;
                padding: 1.5rem;
                box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.1);
            }
            .table thead th {
                background-color: #f8f9fc;
                color: var(--primary-color);
                font-weight: 700;
                text-transform: uppercase;
                font-size: 0.8rem;
                border-top: none;
            }
            .btn-action {
                border-radius: 8px;
                padding: 0.25rem 0.5rem;
                font-size: 0.875rem;
            }
            .badge-type {
                font-size: 0.75rem;
            }
        </style>
    </head>
    <body>

        <jsp:include page="welcome.jsp" />

        <c:if test="${empty user}">
            <c:redirect url="login.jsp"/>
        </c:if>

        <c:if test="${not empty user}">
            <div class="container main-container">
                
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="fw-bold text-dark m-0">Danh sách Đại học</h2>
                    <a href="university-form.jsp" class="btn btn-primary shadow-sm px-4 rounded-pill">
                        <i class="fa-solid fa-plus me-2"></i>Thêm trường mới
                    </a>
                </div>

                <div class="card search-card mb-4">
                    <div class="card-body p-4">
                        <form action="MainController" method="post" class="row g-3">
                            <input type="hidden" name="action" value="searchUniversity"/>
                            <div class="col-md-10">
                                <div class="input-group">
                                    <span class="input-group-text bg-white border-end-0">
                                        <i class="fa-solid fa-magnifying-glass text-muted"></i>
                                    </span>
                                    <input type="text" class="form-control border-start-0 ps-0" name="keywords" 
                                           placeholder="Nhập tên trường cần tìm..." value="${keywords}" />
                                </div>
                            </div>
                            <div class="col-md-2">
                                <button type="submit" class="btn btn-dark w-100 fw-bold">Tìm kiếm</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="table-container">
                    <c:choose>
                        <c:when test="${empty list}">
                            <div class="text-center py-5">
                                <i class="fa-solid fa-box-open fa-3x text-muted mb-3"></i>
                                <p class="text-muted">Không tìm thấy dữ liệu phù hợp với từ khóa.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table class="table table-hover align-middle">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên trường</th>
                                            <th>Viết tắt</th>
                                            <th>Vùng/Thành phố</th>
                                            <th class="text-center">Quy mô (SV/GV)</th>
                                            <th class="text-center">Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${list}" var="u">
                                            <tr>
                                                <td class="fw-bold text-primary small">#${u.id}</td>
                                                <td>
                                                    <div class="fw-bold text-dark">${u.name}</div>
                                                    <span class="badge bg-info-subtle text-info badge-type border border-info-subtle">${u.type}</span>
                                                </td>
                                                <td><span class="text-muted fw-bold small">${u.shortName}</span></td>
                                                <td>
                                                    <div class="small text-muted"><i class="fa-solid fa-location-dot me-1"></i>${u.city}</div>
                                                    <div class="small fw-semibold">${u.region}</div>
                                                </td>
                                                <td class="text-center">
                                                    <div class="small">SV: <b>${u.totalStudents}</b></div>
                                                    <div class="small">GV: <b>${u.totalFaculties}</b></div>
                                                </td>
                                                <td class="text-center">
                                                    <div class="d-flex justify-content-center gap-2">
                                                        <c:if test="${u.isDraft}">
                                                            <a href="MainController?action=updateUniversity&id=${u.id}" 
                                                               class="btn btn-outline-primary btn-action" title="Chỉnh sửa">
                                                                <i class="fa-solid fa-pen-to-square"></i>
                                                            </a>
                                                        </c:if>
                                                        
                                                        <form action="MainController" method="POST" class="m-0"
                                                              onsubmit="return confirm('Bạn có chắc chắn muốn xóa trường này?');">
                                                            <input type="hidden" name="action" value="deleteUniversity"/>
                                                            <input type="hidden" name="id" value="${u.id}"/>
                                                            <input type="hidden" name="keywords" value="${keywords}"/>
                                                            <button type="submit" class="btn btn-outline-danger btn-action" title="Xóa">
                                                                <i class="fa-solid fa-trash"></i>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <c:if test="${not empty msg}">
                    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
                        <div class="alert alert-success shadow-lg border-0 px-4 py-3" role="alert">
                            <i class="fa-solid fa-check-circle me-2"></i> ${msg}
                        </div>
                    </div>
                </c:if>
            </div>
        </c:if>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>