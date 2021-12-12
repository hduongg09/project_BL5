/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Have A Nice Day
 */
public class Attendance {
    private int id;
    private Student student;
    private Date atd;
    private Time att;
    private boolean takeat;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Date getAtd() {
        return atd;
    }

    public void setAtd(Date atd) {
        this.atd = atd;
    }

    public Time getAtt() {
        return att;
    }

    public void setAtt(Time att) {
        this.att = att;
    }

    public boolean isTakeat() {
        return takeat;
    }

    public void setTakeat(boolean takeat) {
        this.takeat = takeat;
    }
    
    
}
