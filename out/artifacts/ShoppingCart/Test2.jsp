<%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/9/22
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<%
    String name = request.getParameter("name");

    if("abc".equals(name))
        out.print("<font color='red'>已经存在</font>");
    else
        out.print("<font color='green'>可以使用</font>");

%>

</body>
</html>
