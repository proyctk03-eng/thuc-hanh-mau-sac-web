package com.codegym;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * ConverterServlet xử lý tính toán chuyển đổi tiền tệ từ USD sang VNĐ.
 * Định tuyến endpoint /convert tương thích Tomcat 10.1+ (Jakarta EE).
 */
@WebServlet(name = "ConverterServlet", urlPatterns = {"/convert"})
public class ConverterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            try {
                // Nhận tham số từ form và ép kiểu sang số thực
                float rate = Float.parseFloat(request.getParameter("rate"));
                float usd = Float.parseFloat(request.getParameter("usd"));

                // Thực hiện tính toán: VND = USD * Rate
                float vnd = rate * usd;

                // Xuất kết quả ra trình duyệt
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head><title>Result</title></head>");
                out.println("<body style='font-family: Arial, sans-serif; text-align: center; margin-top: 100px; background-color: #f8fafc;'>");
                out.println("<div style='background: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); display: inline-block; min-width: 350px;'>");
                out.println("<h2 style='color: #1b2a7a; margin-bottom: 20px;'>KẾT QUẢ CHUYỂN ĐỔI</h2>");
                out.println("<p style='font-size: 18px; margin: 10px 0;'>Tỉ giá: <strong>" + rate + "</strong> VND/USD</p>");
                out.println("<p style='font-size: 18px; margin: 10px 0;'>Số tiền USD: <strong>$" + usd + "</strong></p>");
                out.println("<h3 style='color: #27ae60; font-size: 24px; margin: 20px 0;'>Thành tiền VNĐ: " + String.format("%,.0f", (double)vnd) + " VNĐ</h3>");
                out.println("<br><a href='index.jsp' style='text-decoration: none; padding: 10px 25px; background-color: #1b2a7a; color: white; border-radius: 4px; font-weight: bold;'>Quay lại</a>");
                out.println("</div>");
                out.println("</body>");
                out.println("</html>");
            } catch (NumberFormatException e) {
                // Xử lý trường hợp nhập không đúng định dạng số
                out.println("<!DOCTYPE html>");
                out.println("<html><head><title>Lỗi nhập liệu</title></head><body style='font-family: Arial, sans-serif; text-align: center; margin-top: 100px; background-color: #f8fafc;'>");
                out.println("<div style='background: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); display: inline-block;'>");
                out.println("<h2 style='color: red; margin-bottom: 20px;'>Lỗi: Vui lòng nhập số hợp lệ!</h2>");
                out.println("<br><a href='index.jsp' style='text-decoration: none; padding: 10px 25px; background-color: #1b2a7a; color: white; border-radius: 4px; font-weight: bold;'>Quay lại</a>");
                out.println("</div>");
                out.println("</body></html>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}
