<%-- 
    Document   : attendance
    Created on : Dec 4, 2021, 9:56:46 AM
    Author     : Have A Nice Day
--%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.Student"%>
<%@page import="model.Classs"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action ="search" method="POST">
            Class:
            <select name="cid"> 
                <option value="-1">---All---</option>
                <c:forEach items="${clas}" var="c">
                    <c:if test="${c != selected}">
                        <option value="${c.id}" ${c.id == cid ? 'selected' : ''}>${c.name}</option>
                    </c:if>     
                </c:forEach>

            </select>
            <input type="submit" value="Search"/>
        </form>
        <form action="add" method="POST">
            
                <table border="1px">
                    <tr>
                        <td>ID</td>
                        <td>Name</td>
                        <td>Student Roll</td>
                        <td>Day</td>
                        <td>Time Slot</td>
                        <td>Take Attendance</td>               
                    </tr>
                    <c:forEach items="${requestScope.students}" var="s" >
                        <tr>
                            <td>${s.id}</td>
                            <td>${s.name} <input type="hidden" name="id" value="${s.id}"</td>
                            <td>${s.roll}</td>
                            <td><input type="date" name="atd${s.id}"/></td>
                            <td><input type="time" name="att${s.id}" step="1"/></td>
                            <td><input type = "checkbox" name="present${s.id}" value="present"/></td>
                        </tr>
                    </c:forEach>
                </table>
                <input type="submit" value="save">
            

            

        </form>
    </body>
</html>
