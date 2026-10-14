package com.codegym;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * DictionaryServlet xử lý tra cứu từ điển Anh - Việt qua phương thức POST.
 * Định tuyến endpoint /translate tương thích Tomcat 10.1+ (Jakarta EE).
 */
@WebServlet(name = "DictionaryServlet", urlPatterns = {"/translate"})
public class DictionaryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Cấu hình phản hồi hiển thị HTML và hỗ trợ hiển thị Tiếng Việt
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Khởi tạo danh sách từ vựng (Từ điển)
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello", "Xin chào");
        dictionary.put("how", "Thế nào");
        dictionary.put("book", "Quyển sách");
        dictionary.put("computer", "Máy tính");
        dictionary.put("student", "Sinh viên");

        // Nhận tham số từ khóa từ form
        String searchWord = request.getParameter("word");

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head><title>Kết quả tra cứu</title></head>");
            out.println("<body style='font-family: Arial, sans-serif; text-align: center; margin-top: 100px; background-color: #f8fafc;'>");
            out.println("<div style='background: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); display: inline-block; min-width: 350px;'>");

            if (searchWord != null && !searchWord.trim().isEmpty()) {
                // Chuyển từ khóa về chữ thường để tra cứu chính xác
                String result = dictionary.get(searchWord.trim().toLowerCase());
                if (result != null) {
                    out.println("<h2 style='color: #1b2a7a; margin-bottom: 15px;'>Từ khóa: " + searchWord + "</h2>");
                    out.println("<h3 style='color: #27ae60; font-size: 24px; margin: 15px 0;'>Nghĩa tiếng Việt: " + result + "</h3>");
                } else {
                    out.println("<h2 style='color: red; margin-bottom: 20px;'>Không tìm thấy từ: " + searchWord + "</h2>");
                }
            } else {
                out.println("<h2 style='color: orange; margin-bottom: 20px;'>Vui lòng nhập từ khóa hợp lệ!</h2>");
            }

            out.println("<br><a href='index.jsp' style='text-decoration: none; padding: 10px 25px; background-color: #1b2a7a; color: white; border-radius: 4px; font-weight: bold;'>Quay lại</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}
