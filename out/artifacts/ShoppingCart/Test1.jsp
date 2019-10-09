<%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/9/22
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<span>输入账号 :</span>
<input id="name" name="name" onkeyup="check()" type="text">
<span id="checkResult"></span>

<script>
    var xmlhttp;
    function check(){
        var name = document.getElementById("name").value;
        var url = "dosome.todo?";

        xmlhttp =new XMLHttpRequest();
        xmlhttp.onreadystatechange=checkResult; //响应函数
        xmlhttp.open("GET",url,true);   //设置访问的页面
        xmlhttp.send("name=" + name);  //执行访问
    }

    function checkResult(){
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
            document.getElementById('checkResult').innerHTML=xmlhttp.responseText;

    }

</script>

</body>
</html>
