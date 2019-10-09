<%@ page import="java.util.List" %>
<%@ page import="cn.figo.servlet.entity.tProduct" %>
<%@ page import="cn.figo.servlet.entity.Cart" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/9/20
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>商品展示</title>
</head>
<body>
    <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" height="50" >
        <tr>
            <td width="30%">&nbsp;</td>
            <td align="center"><font color="red" size="+1"><b>欢迎光临购物系统</b></font></td>
            <td width="30%" align="right" valign="bottom">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" align="right">欢迎您,<%= session.getAttribute("username")%></td>
        </tr>
    </table>
    <hr>
    </h1>
    <H1 align="center">本系统的所有商品列表如下： </H1><BR><BR>
    <form action="cart.do" method="post">
        <TABLE width="400" border="1">
            <TR height="25">
                <td>商品ID</td>
                <td>图片</td>
                <TD>产品名称</TD>
                <td>产品描述</td>
                <td>产品价格</td>
                <TD>数量</TD></TR>
            <%

                String path = request.getContextPath();
                String basePath = request.getScheme() + "://"
                        + request.getServerName() + ":" + request.getServerPort()
                        + path + "/";
                List<tProduct> list = (List<tProduct>) session.getAttribute("list");
                for(int i = 0 ; i < list.size();i++){
            %>
            <tr>
                <input type="hidden" name="<%= list.get(i).getId()%>">
                <td><%= list.get(i).getId()%></td>
                <td><img src="<%=basePath%>images/<%= list.get(i).getP_pic()%>" alt=""></td>
                <td><%= list.get(i).getP_name()%></td>
                <td><%= list.get(i).getDescription()%></td>
                <td><%= list.get(i).getPrice()%></td>
                <td><input type="number" name="number" placeholder="0" value="0"></td>
            </tr>
            <%
                }
            %>
<%--            使用jstl替换jsp--%>

        </TABLE>
    <input type="submit" value="添加到购物车">
    </form>
    </body>
</html>