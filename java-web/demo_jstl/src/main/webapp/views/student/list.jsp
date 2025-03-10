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
<a href="/students?action=create">Thêm mới</a>
<h3 style="color: red">${param.mess}</h3>
<table class ="table table-dark">
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Giới tính</th>
        <th>Điểm</th>
        <th>Xếp loại</th>
        <th>Mã lớp học</th>
        <th>Xoá</th>
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
            <td>
                <button onclick="thongTinXoa(${student.getName()})" type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Xoá
                </button>
            </td>
        </tr>
    </c:forEach>

</table>

<!-- Modal Xoá-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span>Bạn có muốn xoá sinh viên có tên </span><span id="deleteName"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ</button>
                <button type="button" class="btn btn-primary">Xoá</button>
            </div>
        </div>
    </div>
</div>
<script>
    function thongTinXoa(name){
        alert(name);
        document.getElementById("deleteName").innerText = name;
    }
</script>
</body>
</html>
