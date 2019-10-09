<%@ page import="java.util.List" %>
<%@ page import="cn.figo.servlet.dao.tProductDao" %>
<%@ page import="cn.figo.servlet.dao.imp.tProductDaoImp" %>
<%@ page import="cn.figo.servlet.entity.tProduct" %>
<%@ page import="cn.figo.servlet.entity.Cart" %><%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/9/21
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" height="50" >
    <tr>
        <td width="30%">&nbsp;</td>
        <td align="center"><font color="red" size="+1"><b>欢迎光临购物系统</b></font></td>
        <td width="30%" align="right" valign="bottom">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3" align="left">欢迎您,<%= session.getAttribute("username")%>!</td>
    </tr>
</table>
<hr>
<H1 align="center">你所购买的商品如下： </H1>
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

    List<Cart> carts = (List<Cart>) session.getAttribute("cart");
    tProductDao tpd = new tProductDaoImp();
    List<tProduct> list = tpd.findall();
    int j = 0;
    long sum = 0;
    for(int i = 0 ; i < list.size() ; i ++){
        if(j == carts.size()){
            break;
        }
        if(list.get(i).getId() == carts.get(j).getId()){
%>
<tr align="center">
    <td height="30"><%= list.get(i).getId()%></td>
    <td height="30"><img src="<%=basePath%>images/<%= list.get(i).getP_pic()%>" alt=""></td>
    <td height="30"><%= list.get(i).getP_name()%></td>
    <td height="30"><%= list.get(i).getDescription()%></td>
    <td height="30"><%= list.get(i).getPrice()%></td>
    <td height="30"><%= carts.get(j).getNumber()%></td>
    <td height="30"><%= list.get(i).getPrice() * carts.get(j).getNumber()%></td>

</tr>

<%
            sum += list.get(i).getPrice() * carts.get(j).getNumber();
            j++;
        }
    }
%>
<tr>
    <TD colSpan="5" height="30">您的购物车中所有商品总金额：<%= sum %></TD>
</tr>
</table>

<H1 align="center">用户联系方式如下：</H1>
<P></P>
<FORM name="form1" action="message.do" method="post">
    <TABLE cellSpacing="0" cellPadding="0" width="500" align="center" border="0">
        <TR>
            <TD width="117" height="23">姓名：</TD>
            <TD width="383"><%= session.getAttribute("username")%></TD></TR>
        <TR>
            <TD height="24">地址：</TD>
            <TD><INPUT value="湖南农大" name="address"></TD></TR>
        <TR>
            <TD height="24">邮政编码：</TD>
            <TD><INPUT value="410010" name="postCode"></TD></TR>
        <TR>
            <TD height="23">E-mail：</TD>
            <TD><INPUT value="zx@163.com" name="email"></TD></TR>
        <TR>
            <TD height="23">联系电话：</TD>
            <TD><INPUT value="8233110" name="homePhone"></TD></TR>
    </TABLE><BR>
    <br>
    <center>
        <input type="submit" value="生成定单">
        <input type="button" value="返回" onclick="javascript:location.href='ProductShow.jsp'">
    </center>
</FORM>
</body>
</html>
