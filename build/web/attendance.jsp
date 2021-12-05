<%-- 
    Document   : attendance
    Created on : Dec 4, 2021, 9:56:46 AM
    Author     : Have A Nice Day
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action ="attendance" method="POST">
             Class: <select name="cname">
                 <option></option>
                 <option></option>
             </select>
            Day: <input type="date" name="day" />
            TimeSlot:
            <select name="time"> 
                <option></option>               
                <option></option>               
            </select>
            <br/>
            <input type="submit" value="Search"/>
        </form>
        
            <table border="1px">
            <tr>
                <td>ID</td>
                <td>StudentRoll</td>
                <td>Name</td>
                <td>Take Attendance</td>
            </tr>
           
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            
        </table>
        <input type="submit" value="Save"/> 

    </body>
</html>
