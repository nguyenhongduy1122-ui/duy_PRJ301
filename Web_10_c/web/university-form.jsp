<%-- 
    Document   : university-form
    Created on : Feb 2, 2026, 9:58:44 AM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${mode == 'update' ? 'Cập nhật' : 'Thêm mới'} Đại học</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        
        <style>
            body { background-color: #f8f9fc; padding-top: 2rem; padding-bottom: 3rem; }
            .card-form { border: none; border-radius: 1rem; box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15); }
            .card-header { background-color: #4e73df; color: white; border-radius: 1rem 1rem 0 0 !important; font-weight: 700; }
            .form-label { font-weight: 600; color: #4e73df; font-size: 0.9rem; }
            .btn-save { border-radius: 10rem; padding: 10px 30px; font-weight: 700; }
            .btn-back { border-radius: 10rem; padding: 10px 20px; }
            .is-update-id { background-color: #eaecf4 !important; }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    
                    <div class="card card-form">
                        <div class="card-header py-3">
                            <h5 class="m-0"><i class="fas fa-university me-2"></i> ${mode == 'update' ? 'CẬP NHẬT THÔNG TIN TRƯỜNG' : 'THÊM TRƯỜNG ĐẠI HỌC MỚI'}</h5>
                        </div>
                        <div class="card-body p-4">
                            
                            <c:if test="${not empty msg}">
                                <div class="alert alert-success border-0 shadow-sm mb-4"><i class="fas fa-check-circle me-2"></i> ${msg}</div>
                            </c:if>
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger border-0 shadow-sm mb-4"><i class="fas fa-exclamation-triangle me-2"></i> ${error}</div>
                            </c:if>

                            <form action="MainController" method="POST">
                                <input type="hidden" name="action" value="${mode=='update'?'saveUpdateUniversity':'addUniversity'}"/>

                                <div class="row">
                                    <div class="col-md-6 border-end">
                                        <div class="mb-3">
                                            <label class="form-label">Mã định danh (ID)</label>
                                            <input type="text" name="id" class="form-control ${mode == 'update' ? 'is-update-id' : ''}" 
                                                   value="${u.id}" ${mode == 'update' ? 'readonly' : ''} required placeholder="Ví dụ: FPTU"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Tên trường đầy đủ</label>
                                            <input type="text" name="name" class="form-control" value="${u.name}" required/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Tên viết tắt</label>
                                            <input type="text" name="shortName" class="form-control" value="${u.shortName}"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Loại hình trường</label>
                                            <input type="text" name="type" class="form-control" value="${u.type}" placeholder="Ví dụ: Tư thục, Công lập..."/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Mô tả ngắn</label>
                                            <textarea name="description" class="form-control" rows="3">${u.description}</textarea>
                                        </div>
                                    </div>

                                    <div class="col-md-6 ps-md-4">
                                        <div class="mb-3">
                                            <label class="form-label">Năm thành lập</label>
                                            <input type="number" name="foundedYear" class="form-control" value="${u.foundedYear}" min="0"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Địa chỉ trụ sở</label>
                                            <input type="text" name="address" class="form-control" value="${u.address}"/>
                                        </div>
                                        <div class="row">
                                            <div class="col-6 mb-3">
                                                <label class="form-label">Thành phố</label>
                                                <input type="text" name="city" class="form-control" value="${u.city}"/>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <label class="form-label">Vùng miền</label>
                                                <input type="text" name="region" class="form-control" value="${u.region}"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-6 mb-3">
                                                <label class="form-label">Tổng sinh viên</label>
                                                <input type="number" name="totalStudents" class="form-control" value="${u.totalStudents}" min="0"/>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <label class="form-label">Tổng giảng viên</label>
                                                <input type="number" name="totalFaculties" class="form-control" value="${u.totalFaculties}" min="0"/>
                                            </div>
                                        </div>
                                        <div class="mb-3 mt-2">
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="isDraft" name="isDraft" ${u.isDraft ? 'checked' : ''}>
                                                <label class="form-check-label fw-bold text-secondary" for="isDraft">Đánh dấu là bản nháp</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <hr class="my-4">

                                <div class="d-flex justify-content-between align-items-center">
                                    <a href="MainController?action=searchUniversity" class="btn btn-light btn-back">
                                        <i class="fas fa-chevron-left me-2"></i> Quay lại danh sách
                                    </a>
                                    
                                    <button type="submit" class="btn ${mode == 'update' ? 'btn-warning' : 'btn-primary'} btn-save shadow">
                                        <i class="fas fa-save me-2"></i> ${mode == 'update' ? 'Cập nhật ngay' : 'Thêm trường học'}
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>