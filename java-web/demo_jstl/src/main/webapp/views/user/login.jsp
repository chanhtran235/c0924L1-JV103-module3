<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 3/15/2025
  Time: 8:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <c:import url="../layout/labrary.jsp"/>

</head>
<body>
<c:import url="../layout/header.jsp"/>
<div class="d-flex justify-content-center mt-5" >
    <form class="w-25" style="background-color: #8b76b2;padding: 20px" >
        <h3 class="text-center text-warning"> Login</h3>
        <div class="mb-3">
            <label for="username" class="form-label text-warning">Username</label>
            <input type="email"  name="username" class="form-control" id="username" placeholder="name@example.com">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label text-warning">Password</label>
            <input type="email"  name="password" class="form-control" id="password" placeholder="name@example.com">
        </div>
        <div class="d-flex justify-content-center">
            <button type="button" class=" btn-sm btn btn-outline-warning">Primary</button>
        </div>
    </form>
</div>

</body>
</html>
