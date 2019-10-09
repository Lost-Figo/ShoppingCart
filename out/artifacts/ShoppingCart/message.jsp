<%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/9/21
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<BODY bgColor="#ffffff">
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
<h2 align="center">订单已生成！您的订单号是：20080220001。</h2>
<center><a href="ProductShow.jsp">请返回</a></center>
</BODY>
</html>
