package cn.figo.servlet.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.todo")
public class TestController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        String uri = req.getRequestURI();
        if(uri.indexOf("dosome") >= 0){
            //跳转页面
            System.out.println(req.getParameter("name"));
            req.getRequestDispatcher("Test2.jsp").forward(req,resp);
        }
    }
}
