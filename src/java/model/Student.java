/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Have A Nice Day
 */
public class Student {
    private int id;
    private String name;
    private String roll;
    private Classs clas;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRoll() {
        return roll;
    }

    public void setRoll(String roll) {
        this.roll = roll;
    }

    public Classs getClas() {
        return clas;
    }

    public void setClas(Classs clas) {
        this.clas = clas;
    }
    
    
}
