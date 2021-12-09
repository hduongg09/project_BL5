/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Classs;
import model.Student;

/**
 *
 * @author Have A Nice Day
 */
public class StudentDBContext extends DBContext {

    public ArrayList<Student> list() {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "select s.sid, s.sname, s.sroll, c.cid, c.cname from Student s inner join Class c\n"
                    + "on s.cid = c.cid";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Classs c = new Classs();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                Student s = new Student();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                s.setRoll(rs.getString("sroll"));
                s.setClas(c);
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }
    
    public ArrayList<Student> search(int cid) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "select s.sid, s.sname, s.sroll, c.cid, c.cname from Student s inner join Class c\n"
                    + "on s.cid = c.cid";
            if(cid != -1)
            {
                sql += " WHERE c.cid = ?";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            
            if(cid != -1)
            {
                stm.setInt(1, cid);
            }
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Classs c = new Classs();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                Student s = new Student();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                s.setRoll(rs.getString("sroll"));
                s.setClas(c);
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }
}
