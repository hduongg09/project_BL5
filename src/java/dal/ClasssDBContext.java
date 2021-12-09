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

/**
 *
 * @author Have A Nice Day
 */
public class ClasssDBContext extends DBContext {
    
    public ArrayList<Classs> list(){
        ArrayList<Classs> clas = new ArrayList<>();
        try {
            String sql="SELECT cid, cname FROM Class";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Classs c = new Classs();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                clas.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClasssDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clas;
    }
}
