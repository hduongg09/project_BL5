<%-- 
    Document   : attendance
    Created on : Dec 4, 2021, 9:56:46 AM
    Author     : Have A Nice Day
--%>

<%@page import="model.Student"%>
<%@page import="model.Classs"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
        ArrayList<Student> students = (ArrayList<Student>)request.getAttribute("students");
        ArrayList<Classs> clas = (ArrayList<Classs>) request.getAttribute("clas");
        Integer cid = (Integer) request.getAttribute("cid");
        if(cid ==null) cid= -1;
        %>
    </head>
    <body>
         <form action ="search" method="POST">
             Class:
            <select name="cid"> 
                <option value="-1">------All-----</option>
                <% for (Classs c : clas) {%>
                <option 
                    <%=cid == c.getId()?"selected=\"selected\"":"" %>
                    value="<%=c.getId()%>" ><%=c.getName() %></option>
                <%}%>
            </select>
            <input type="submit" value="Search"/>
        </form>
        <%if(students.size() >  0){%>
            <table border="1px">
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>StudentRoll</td>
                <td>Take Attendance</td>
                <td>Time Slot</td>
                <td>Day</td>
            </tr>
            <% for (Student s : students) {%>
            <tr>
                <td><%=s.getId()%></td>
                <td><%=s.getName()%></td>
                <td><%=s.getRoll()%></td>                
            </tr>
            <%}%>           
        </table>
            <%}else {%>
            No result to display
            <%}%>
    </body>
</html>
