<%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/9/21
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script>

        $(function(){
            $("input:first").blur(function () {
                $.post('checkUsername.user',{'username':this.value},function (data) {
                    $("span:nth-child(2)").text(data).css("color","green");
                })
            }).focus(function () {
                $("span:nth-child(2)").text("请输入常用的Email格式").css("color","black");
            })
        });
    </script>
</head>
<body>
<table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" height="50">
    <tr>
        <td width="30%">&nbsp;</td>
        <td align="center"><font color="red" size="+1"><b>欢迎光临购物系统</b></font></td>
        <td width="30%" align="right" valign="bottom">
            <a href="register.jsp"><span style="text-decoration:none">还没有账号，马上注册</span></a></td>
    </tr>
</table>
<hr>
<h2 align="center">
    用户登录

    <form action="login.do" method="post">
        用户名：<input type="text" name="name">
        <span>请输入常用的Email格式</span><br>
        密&nbsp;&nbsp;码：<input type="password" name="password">
        <span>密码必须为6-20位</span><br>
        <input type="submit" value="登录">
    </form>

</h2>
</body>
</html>
