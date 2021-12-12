/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attendance;

/**
 *
 * @author Have A Nice Day
 */
public class AttendanceDBContext extends DBContext {

    public void takeAttendance(ArrayList<Attendance> atts) {
        try {
            String sql = "INSERT INTO [Attendance]\n"
                    + "           ([sid]\n"
                    + "           ,[atd]\n"
                    + "           ,[att]\n"
                    + "           ,[takeat])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            connection.setAutoCommit(false);
            for(Attendance atten : atts ){
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setInt(1, atten.getStudent().getId());
                stm.setDate(2, atten.getAtd());
                stm.setTime(3, atten.getAtt());
                stm.setBoolean(4, atten.isTakeat());
                stm.execute();
            }
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
        finally
        {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
