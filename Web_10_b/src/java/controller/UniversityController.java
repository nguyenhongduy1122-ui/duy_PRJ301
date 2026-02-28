package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UniversityDAO;
import model.UniversityDTO;

/**
 * @author Duy (Cleaned version following Teacher's style)
 */
public class UniversityController extends HttpServlet {

    // --- 1. CÁC HÀM HỖ TRỢ (HELPERS) ---
    // Hàm rút trích dữ liệu từ Request để tránh lặp code getParameter nhiều lần
    private UniversityDTO extractUniversityFromRequest(HttpServletRequest request) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String shortName = request.getParameter("shortName");
        String description = request.getParameter("description");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String region = request.getParameter("region");
        String type = request.getParameter("type");

        // Dùng parseOrDefault để an toàn, không lo người dùng nhập chữ vào ô số
        int foundedYear = parseOrDefault(request.getParameter("foundedYear"), 0);
        int totalStudents = parseOrDefault(request.getParameter("totalStudents"), 0);
        int totalFaculties = parseOrDefault(request.getParameter("totalFaculties"), 0);

        // Checkbox: "on" nếu được tích, null nếu không tích
        boolean isDraft = "on".equals(request.getParameter("isDraft"));

        return new UniversityDTO(id, name, shortName, description, foundedYear,
                address, city, region, type, totalStudents, totalFaculties, isDraft);
    }

    // Hàm kiểm tra dữ liệu đầu vào (Validation)
    private String validateUniversity(UniversityDTO u, boolean isUpdate) {
        StringBuilder error = new StringBuilder();
        if (u.getId() == null || u.getId().trim().isEmpty()) {
            error.append("Chưa nhập Id <br/>");
        }
        if (u.getName() == null || u.getName().trim().isEmpty()) {
            error.append("Chưa nhập Name <br/>");
        }
        if (u.getFoundedYear() < 0) {
            error.append("Năm thành lập phải >= 0 <br/>");
        }

        // Chỉ check trùng ID khi Thêm mới (Add)
        if (!isUpdate) {
            UniversityDAO udao = new UniversityDAO();
            if (udao.searchByID(u.getId()) != null) {
                error.append("ID đã tồn tại, vui lòng chọn ID khác! <br/>");
            }
        }
        return error.toString();
    }

    // Hàm ép kiểu số an toàn
    private int parseOrDefault(String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (Exception e) {
            return defaultValue;
        }
    }

    // --- 2. CÁC HÀM XỬ LÝ CHỨC NĂNG (ACTIONS) ---
    protected void doSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keywords = request.getParameter("keywords");
        if (keywords == null) {
            keywords = "";
        }

        UniversityDAO udao = new UniversityDAO();
        ArrayList<UniversityDTO> list = udao.filterByName(keywords);

        request.setAttribute("list", list);
        request.setAttribute("keywords", keywords);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

    protected void doAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UniversityDTO u = extractUniversityFromRequest(request);
        String error = validateUniversity(u, false);
        String msg = "";

        if (error.isEmpty()) {
            UniversityDAO udao = new UniversityDAO();
            if (udao.add(u)) {
                msg = "Đã thêm University thành công!";
            } else {
                error = "Lỗi hệ thống: Không thể thêm mới!";
            }
        }

        request.setAttribute("u", u);
        request.setAttribute("msg", msg);
        request.setAttribute("error", error);
        request.getRequestDispatcher("university-form.jsp").forward(request, response);
    }

    protected void doUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        UniversityDAO udao = new UniversityDAO();
        UniversityDTO u = udao.searchByID(id);

        if (u != null) {
            request.setAttribute("u", u);
            request.setAttribute("mode", "update");
            request.getRequestDispatcher("university-form.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Không tìm thấy dữ liệu để sửa!");
            doSearch(request, response);
        }
    }

    protected void doSaveUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UniversityDTO u = extractUniversityFromRequest(request);
        String error = validateUniversity(u, true); // true vì là update
        String msg = "";

        if (error.isEmpty()) {
            UniversityDAO udao = new UniversityDAO();
            if (udao.update(u)) {
                msg = "Đã cập nhật thành công!";
            } else {
                error = "Lỗi hệ thống: Không thể cập nhật!";
            }
        }

        request.setAttribute("u", u);
        request.setAttribute("mode", "update");
        request.setAttribute("msg", msg);
        request.setAttribute("error", error);
        request.getRequestDispatcher("university-form.jsp").forward(request, response);
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            UniversityDAO udao = new UniversityDAO();
            if (udao.softDelete(id)) {
                request.setAttribute("msg", "Đã xóa thành công ID: " + id);
            } else {
                request.setAttribute("error", "Lỗi: Không thể xóa ID: " + id);
            }
        }
        doSearch(request, response); // Xóa xong gọi Search để load lại danh sách
    }

    // --- 3. CỔNG ĐIỀU PHỐI CHÍNH ---
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            doSearch(request, response);
            return;
        }

        switch (action) {
            case "searchUniversity":
                doSearch(request, response);
                break;
            case "addUniversity":
                doAdd(request, response);
                break;
            case "deleteUniversity":
                doDelete(request, response);
                break;
            case "updateUniversity":
                doUpdate(request, response);
                break;
            case "saveUpdateUniversity":
                doSaveUpdate(request, response);
                break;
            default:
                doSearch(request, response);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
