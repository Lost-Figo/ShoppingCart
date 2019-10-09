package cn.figo.servlet.controller;




import cn.figo.servlet.dao.imp.tProductDaoImp;
import cn.figo.servlet.dao.imp.tUserDaoImp;
import cn.figo.servlet.dao.tProductDao;
import cn.figo.servlet.dao.tUserDao;
import cn.figo.servlet.entity.Cart;
import cn.figo.servlet.entity.tProduct;
import cn.figo.servlet.entity.tUser;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet("*.do")
public class RequestController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        String uri = req.getRequestURI();
        if(uri.indexOf("login") >= 0){
            //获取用户信息
            String name =  req.getParameter("name");
            String pwd = req.getParameter("password");
            tUserDao ud = new tUserDaoImp();
            try {
                List<tUser> users = ud.pwdByname(name);
                String pwds = users.get(0).getPwd();

                if(pwd.equals(pwds)){
                    req.getSession().setAttribute("username",name);
                    req.getRequestDispatcher("skip.jsp").forward(req,resp);
                }else{
                    req.setAttribute("errormsg","errorname");
                    req.getRequestDispatcher("login.jsp").forward(req,resp);
                }
            } catch (SQLException e) {
                req.setAttribute("errormsg","errorname");
                req.getRequestDispatcher("login.jsp").forward(req,resp);
            }
        }else if(uri.indexOf("list") >= 0){
            tProductDao tp = new tProductDaoImp();
            try {
                List<tProduct> list = tp.findall();

                //绑定数据到requset
                req.getSession().setAttribute("list",list);
                resp.sendRedirect("ProductShow.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(uri.indexOf("cart")>=0){
            tProductDao tp = new tProductDaoImp();
            try {
                List<tProduct> list = tp.findall();
                List<Cart> listcart = new ArrayList<>();
                String[] lists = req.getParameterValues("number");
                for (int i = 0 ; i < lists.length ; i++){
                    if("0".equals(lists[i])){

                    }else {
                        int id = list.get(i).getId();
                        int number = Integer.parseInt(lists[i]);
                        Cart cart = new Cart();
                        cart.setId(id);
                        cart.setNumber(number);
                        listcart.add(cart);
                    }
                }

                req.getSession().setAttribute("cart",listcart);

                resp.sendRedirect("cart.jsp");
            } catch (SQLException e) {
            e.printStackTrace();
            }
        }else if(uri.indexOf("order") >= 0){
                resp.sendRedirect("order.jsp");
        }else if(uri.indexOf("message") >= 0){
            resp.sendRedirect("message.jsp");
        }else if(uri.indexOf("register") >= 0){

            tUser user = new tUser();
            user.setUname(req.getParameter("username"));
            user.setPwd(req.getParameter("pwd"));

            tUserDao tp = new tUserDaoImp();
            try {
                tp.addUser(user);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            resp.sendRedirect("login.jsp");


//        else if(uri.indexOf("change") >= 0){
//            int id = Integer.parseInt(req.getParameter("id"));
//            int number = Integer.parseInt(req.getParameter("number"));
//            List<Cart> carts = (List<Cart>) req.getSession().getAttribute("cart");
//            for(int i = 0 ; i < carts.size() ; i++){
//                if(id == carts.get(i).getId()){
//                    carts.get(i).setNumber(number);
//                }
//            }
//            req.getSession().setAttribute("cart",carts);
//            PrintWriter pw = resp.getWriter();
//            pw.write("msg" + id +","+number);
//            resp.sendRedirect("cart.jsp");
        }else if(uri.indexOf("deleteCart") >= 0) {
            int id = Integer.parseInt(req.getParameter("id"));
            List<Cart> carts = (List<Cart>) req.getSession().getAttribute("cart");


            for (int i = 0; i < carts.size(); i++) {
                if (id == carts.get(i).getId()) {
                    carts.remove(i);
                }
            }
            req.getSession().setAttribute("cart",carts);
            resp.sendRedirect("cart.jsp");
        }else if(uri.indexOf("changeNumber") >= 0){
            int id = Integer.parseInt(req.getParameter("id"));
            int number = Integer.parseInt(req.getParameter("number"));
            List<Cart> carts = (List<Cart>) req.getSession().getAttribute("cart");
            for(int i = 0 ; i < carts.size() ; i++){
                if(id == carts.get(i).getId()){
                    carts.get(i).setNumber(number);
                }
            }
            req.getSession().setAttribute("cart",carts);
            PrintWriter pw = resp.getWriter();
            pw.write("修改数量成功");

        }
    }
}
