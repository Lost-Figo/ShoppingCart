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
            });

            $("#code").blur(function () {

                $.post('checkCatpcha.user',{'code':this.value},function (data) {
                    $("#codetest").text(data).css("color","green");
                })
            });
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
        <span></span><br>
        密&nbsp;&nbsp;码：<input type="password" name="password">
        <span>密码必须为6-20位</span><br>
        <img id="img" src="http://localhost:8088/ShoppingCart/captcha.png" onclick="changeImg(this)">
        输入验证码：<input type="text" id="code" name="code">
        <span id="codetest"></span><br>
        <input type="submit" value="登录">
    </form>
    <script>

        function changeImg(img) {
            // 浏览器有一个缓存特性,
            // 第一次从服务器获取图片，浏览器第二次发送请求时发现地址没有改变，就会使用第一次的图片，而不会真正发送请求
            // 为了让浏览器每次都把请求发送给服务器，给一个时间参数
            img.src = "http://localhost:8088/ShoppingCart/captcha.png?t="+new Date().getTime(); // 给src赋一个新值，就会向新值的地址发送一次请求
        }
    </script>

</h2>
</body>
</html>
