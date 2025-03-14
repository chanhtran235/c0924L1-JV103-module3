<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 3/10/2025
  Time: 7:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout/labrary.jsp"/>
    <style>
        input, button, select {
            margin-top: 10px;
        }

        .form {
            margin-top: 20px;
            width: 300px;
            background-color: lightgrey;
            margin-left: 500px;
            display: flex;
            justify-content: center;
            padding-bottom: 20px;
        }

        h1 {
            text-align: center;
        }

        button {
            background-color: green;
            margin-left: 50px;
        }
    </style>
</head>
<body>
<c:import url="../layout/header.jsp"/>
<form class="form" action="/students?action=create" method="post">
    <div>
        <h3>Thêm mới </h3>
<%--        <input name="id" placeholder="nhập id"><br>--%>
        <input name="name" placeholder="nhập tên"><br>
        <input type="radio" name="gender" value="true">Nam
        <input type="radio" name="gender" value="false">Nữ<br>
        <input type="number" name="score" placeholder="nhập điểm"><br>
        <select name="classId">
            <option value="0">--chon lớp---</option>
            <option value="1">C05</option>
            <option value="2">C06</option>
            <option value="3">C07</option>
        </select><br>
        <button>Lưu</button>
    </div>
</form>


</body>
</html>
