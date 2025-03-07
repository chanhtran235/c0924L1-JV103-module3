package com.codegym.demo_jsp_servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SumServlet", value = "/sum")
public class SumServlet extends HttpServlet {
//    @Override
//    public void init() throws ServletException {
//        System.out.println("chạy 1 lần duy nhật khi dc khởi tạo");
//    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // chạy khi gửi request bằng method get
        // + gõ trên thanh đia chỉ url
        // + dùng thẻ a
        // + dùng form với method = get
        System.out.println("-------------do get runing---------------");
        int num1 = Integer.parseInt(req.getParameter("n1"));
        int num2 = Integer.parseInt(req.getParameter("n2"));
        int sum = num1+num2;
        // cách 1 : không nên dùng
//        PrintWriter printWriter = resp.getWriter();
//        printWriter.println("<h1> sum = "+sum+"</h1>");
        // cách 2: chuyển request sang trang jsp khác để hiển thị
        req.setAttribute("tong", sum);
        req.getRequestDispatcher("result.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // chạy khi gửi request bằng method post
        System.out.println("-------------do post runing---------------");
        int num1 = Integer.parseInt(req.getParameter("n1"));
        int num2 = Integer.parseInt(req.getParameter("n2"));
        int sum = num1+num2;
        // cách 1 : không nên dùng
//        PrintWriter printWriter = resp.getWriter();
//        printWriter.println("<h1> sum = "+sum+"</h1>");
        // cách 2: chuyển request sang trang jsp khác để hiển thị
        req.setAttribute("tong", sum);
        req.getRequestDispatcher("result.jsp").forward(req,resp);


    }

//    @Override
//    public void destroy() {
//        System.out.println("chạy 1 lần duy nhất khi bị phá huỷ");
//    }
}
