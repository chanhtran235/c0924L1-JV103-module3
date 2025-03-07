<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 3/7/2025
  Time: 6:54 PM
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
<h1>Danh sách sinh viên</h1>
<table>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Giới tính</th>
        <th>Điểm</th>
        <th>Xếp loại</th>
        <th>Mã lớp học</th>
    </tr>
    <c:forEach items="${studentList}" var="student" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${student.getName()}</td>

            <td>
                <c:if test="${student.isGender()}">
                    <span>Nam</span>
                </c:if>
                <c:if test="${!student.isGender()}">
                    <span>Nữ</span>
                </c:if>
            </td>

            <td>${student.getScore()}</td>
            <td>
                <c:choose>
                    <c:when test="${student.getScore()>=8}">
                        <span>Giỏi</span>
                    </c:when>
                    <c:when test="${student.getScore()>=7}">
                        <span>Khá</span>
                    </c:when>
                    <c:when test="${student.getScore()>=5}">
                        <span>Trung Bình</span>
                    </c:when>
                    <c:otherwise>
                        <span>Yếu</span>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${student.getClassId()}</td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
