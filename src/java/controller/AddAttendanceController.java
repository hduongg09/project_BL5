/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AttendanceDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Attendance;
import model.Student;

/**
 *
 * @author Have A Nice Day
 */
public class AddAttendanceController extends HttpServlet {

    

    StudentDBContext stuDB = new StudentDBContext();
    AttendanceDBContext attDB = new AttendanceDBContext();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Student> students = stuDB.list();
        request.setAttribute("students", students);
        request.getRequestDispatcher("attendance.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String [] ids = request.getParameterValues("id");
        ArrayList<Attendance> atts = new ArrayList<>();
        for(String id : ids){
            Attendance a = new Attendance();
            Student s = new Student();
            s.setId(Integer.parseInt(id));
            a.setStudent(s);
            if(request.getParameter("atd"+id).isEmpty()){
                a.setAtd(new Date(System.currentTimeMillis()));
            }else{
                a.setAtd(Date.valueOf(request.getParameter("atd"+id)));
            }
            
            if(request.getParameter("atd"+id).isEmpty()){
                a.setAtt(new Time(System.currentTimeMillis()));
            }else{
                a.setAtt(Time.valueOf(request.getParameter("att"+id)));
            }
            String takeat = request.getParameter("present" + id);
            a.setTakeat(takeat != null);
            atts.add(a);
        }
        attDB.takeAttendance(atts);
        response.getWriter().println("attendance successful!");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
