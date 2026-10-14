package com.codegym;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Controller servlet xử lý request POST từ form máy tính.
 * Bắt lỗi ngoại lệ chia cho 0 và định dạng số không hợp lệ.
 */
@WebServlet(name = "CalculatorServlet", urlPatterns = {"/calculate"})
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head><title>Result</title></head>");
            out.println("<body style='font-family: Arial, sans-serif; display: flex; justify-content: center; margin-top: 50px; background-color: #f8fafc;'>");
            out.println("<div style='background: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 380px; text-align: center;'>");
            out.println("<h2 style='color: #1b2a7a; margin-top: 0;'>Result:</h2>");

            try {
                float firstOperand = Float.parseFloat(request.getParameter("first-operand"));
                float secondOperand = Float.parseFloat(request.getParameter("second-operand"));
                char operator = request.getParameter("operator").charAt(0);

                float result = Calculator.calculate(firstOperand, secondOperand, operator);
                out.println("<p style='font-size: 20px; color: #333; margin: 20px 0;'>" 
                            + firstOperand + " " + operator + " " + secondOperand + " = <b style='color: #27ae60;'>" + result + "</b></p>");
            } catch (NumberFormatException ex) {
                out.println("<p style='color: red; font-size: 18px; margin: 20px 0;'>Error: Please enter valid numbers!</p>");
            } catch (Exception ex) {
                out.println("<p style='color: red; font-size: 18px; margin: 20px 0;'>Error: " + ex.getMessage() + "</p>");
            }

            out.println("<br><a href='index.jsp' style='text-decoration: none; padding: 10px 20px; background-color: #1b2a7a; color: white; border-radius: 4px; font-weight: bold;'>Go back</a>");
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
