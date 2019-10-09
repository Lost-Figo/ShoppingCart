package cn.figo.servlet.controller;

import cn.figo.servlet.dao.imp.tUserDaoImp;
import cn.figo.servlet.dao.tUserDao;
import cn.figo.servlet.entity.tUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("*.user")
public class UserController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        String uri = req.getRequestURI();
        PrintWriter pw = resp.getWriter();
        if(uri.indexOf("checkUsername") >= 0){
            tUserDao ud = new tUserDaoImp();
            String username = req.getParameter("username");
            try {
                List<tUser> list = ud.pwdByname(username);
                if(list != null){
                    pw.write("用户名验证成功！！");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
