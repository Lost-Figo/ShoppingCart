<%@ page import="java.util.List" %>
<%@ page import="cn.figo.servlet.dao.tProductDao" %>
<%@ page import="cn.figo.servlet.dao.imp.tProductDaoImp" %>
<%@ page import="cn.figo.servlet.entity.tProduct" %>
<%@ page import="cn.figo.servlet.entity.Cart" %><%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/9/21
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <script src="ajax.js"></script>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>

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
<H1 align="center">购物车 </H1>

    <table cellspacing="0" cellpadding="0" width="74%" align="center" border="1">
        <tr align="center">
            <td width="7%">编号</td>
            <td width="20%" height="30">商品图片</td>
            <td width="12%" height="30">商品名称</td>
            <td width="12%" height="30">商品描述</td>
            <td width="12%" height="30">商品价格</td>
            <td width="20%" height="30">数量</td>
            <td width="15%" height="30">合计</td>
            <td width="26%" height="30">&nbsp;</td>
        </tr>
        <%
            //设置图片路径
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://"
                    + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";

//            JSP代码实现
            List<Cart> cart = (List<Cart>) session.getAttribute("cart");

            tProductDao tpd = new tProductDaoImp();
            List<tProduct> list = tpd.findall();
            int j = 0;
            for(int i = 0 ; i < list.size() ; i ++){
                if(j == cart.size()){
                    break;
                }
                if(list.get(i).getId() == cart.get(j).getId()){
        %>
            <tr align="center">
                <td height="30"><%= list.get(i).getId()%></td>
                <td height="30"><img src="<%=basePath%>images/<%= list.get(i).getP_pic()%>" alt=""></td>
                <td height="30"><%= list.get(i).getP_name()%></td>
                <td height="30"><%= list.get(i).getDescription()%></td>
                <td height="30" id="c_price_<%= list.get(i).getId()%>"><%= list.get(i).getPrice()%></td>
                <td height="30" id="c_number_<%= list.get(i).getId()%>"><%= cart.get(j).getNumber()%></td>
                <td height="30" id="c_allprice_<%= list.get(i).getId()%>"><%= list.get(i).getPrice() * cart.get(j).getNumber()%></td>
                <td height="30"><input type="number" placeholder="<%= cart.get(j).getNumber()%>" value="<%= cart.get(j).getNumber()%>" onchange="change(<%= list.get(i).getId()%>,this.value)">
<%--                    <input type="button" value="修改数量" onclick="changenumber(<%= list.get(i).getId()%>)">--%>
                    <a href="deleteCart.do?id=<%= list.get(i).getId()%>">删除</a>
                    </td>
            </tr>

        <%
                    j++;
                }
            }
        %>

<%--            使用jstl替换JSP--%>
        <script>
            function change(id,number) {
                $.post('changeNumber.do',{'id':id,'number':number},function(data){
                    var nid = "c_number_" + id;
                    var nprice = "c_price_" + id;
                    document.getElementById(nid).innerText = number;
                    document.getElementById("c_allprice_"+id).innerText = document.getElementById(nprice).innerText * number;
                })
            }

        </script>
    </table>
    <BR>
    <BR>
<FORM name="cartForm" action="order.do" method="post">
    <TABLE cellSpacing="0" cellPadding="0" width="450" align="center" border="0">
        <TR align="center">
            <TD width="26%"><INPUT type="submit" name="submit" value="提交订单" ></TD>

    </table>
</form>
</body>
</html>
