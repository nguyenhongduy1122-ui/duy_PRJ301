package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UniversityDAO;
import model.UniversityDTO;

public class UpdateUniversityController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        String id = request.getParameter("id");
        UniversityDAO udao = new UniversityDAO();

        // 1. Luôn để URL mặc định là trang form để tránh bị văng về Login
        String url = "university-form.jsp";

        try {
            if ("updateUniversity".equals(action)) {
                // Lấy University từ DB để đổ lên form
                UniversityDTO u = udao.searchByID(id);
                request.setAttribute("u", u);
                request.setAttribute("mode", "update");
                url = "university-form.jsp";

            } else if ("saveUpdateUniversity".equals(action)) {
                String error = "";
                String msg = "";

                String name = request.getParameter("name");
                String shortName = request.getParameter("shortName");
                String description = request.getParameter("description");
                String s_foundedYear = request.getParameter("foundedYear");
                String address = request.getParameter("address");
                String city = request.getParameter("city");
                String region = request.getParameter("region");
                String type = request.getParameter("type");
                String s_totalStudent = request.getParameter("totalStudent");
                String s_totalFaculties = request.getParameter("totalFaculties");
                String s_isDraft = request.getParameter("isDraft");

                // Validation
                if (id == null || id.trim().isEmpty()) {
                    error += "Chua nhap Id <br/>";
                }
                if (name == null || name.trim().isEmpty()) {
                    error += "Chua nhap name <br/>";
                }

                int foundedYear = 0;
                try {
                    foundedYear = Integer.parseInt(s_foundedYear);
                    if (foundedYear < 0) {
                        error += "Nam thanh lap phai >= 0!<br/>";
                    }
                } catch (Exception e) {
                    error += "Nam thanh lap phai la so nguyen!<br/>";
                }

                int totalStudent = 0;
                try {
                    totalStudent = Integer.parseInt(s_totalStudent);
                    if (totalStudent < 0) {
                        error += "Tong so sinh vien phai >= 0!<br/>";
                    }
                } catch (Exception e) {
                    error += "Tong so sinh vien phai la so nguyen!<br/>";
                }

                int totalFaculties = 0;
                try {
                    totalFaculties = Integer.parseInt(s_totalFaculties);
                    if (totalFaculties < 0) {
                        error += "So nhan vien phai >= 0!<br/>";
                    }
                } catch (Exception e) {
                    error += "So nhan vien phai la so nguyen!<br/>";
                }

                // 2. Sửa lỗi Checkbox: Dùng "on".equals để tránh NullPointerException
                boolean isDraft = "on".equals(s_isDraft);

                UniversityDTO u = new UniversityDTO(id, name, shortName, description, foundedYear, address, city, region, type, totalStudent, totalFaculties, isDraft);

                if (error.isEmpty()) {
                    if (udao.update(u)) {
                        msg = "Da cap nhat University thanh cong!";
                        request.setAttribute("u", u); // Hiển thị lại dữ liệu vừa update
                    } else {
                        error = "Gap loi, khong the cap nhat University!";
                        request.setAttribute("u", u);
                    }
                } else {
                    request.setAttribute("u", u);
                }

                request.setAttribute("msg", msg);
                request.setAttribute("error", error);
                request.setAttribute("mode", "update");
                url = "university-form.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 3. Đảm bảo RequestDispatcher nằm NGOÀI cùng của các khối if/else
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
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
