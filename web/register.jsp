<%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/9/21
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
</head>
<body>
<h2>用户注册</h2>
<hr/>
<form action="register.do" method="get">
    <table border="0">
        <tr>
            <td align="right">用户名</td>
            <td ><input type="text" name="username"/></td>
            <td ><span>请输入常用的Email格式</span></td>
        </tr>
        <tr>
            <td align="right">密&nbsp;&nbsp码</td>
            <td><input type="password" name="pwd"/></td>
            <td align="left"><span>密码必须为6~20位</span></td>
        </tr>
        <tr>
            <td align="right">重复密码</td>
            <td><input type="password" name="repwd"/></td>
            <td>&nbsp;<span></span></td>
        </tr><br />
        <tr>
            <td colspan="3" align="center">
                <input type="reset" value="重置" />
                <input type="submit" value="提交"/>	</td>
        </tr>
    </table>

</form>
</body>
</html>
