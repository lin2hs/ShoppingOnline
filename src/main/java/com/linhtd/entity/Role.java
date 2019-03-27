/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.linhtd.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Linh
 */
@Entity
@Table(name = "user_roles", uniqueConstraints = {@UniqueConstraint(columnNames = {"ROLE", "username"})})
public class Role implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_role_id")
    private int user_role_id;
    
    @Column(name = "ROLE", length = 45)
    @NotNull
    private String ROLE;
    
    @ManyToOne
    @JoinColumn(name = "username")
    private User username;

    public Role() {
    }

    public Role(String ROLE, User username) {
        this.ROLE = ROLE;
        this.username = username;
    }

    public Role(int user_role_id, String ROLE, User username) {
        this.user_role_id = user_role_id;
        this.ROLE = ROLE;
        this.username = username;
    }

    public int getUser_role_id() {
        return user_role_id;
    }

    public void setUser_role_id(int user_role_id) {
        this.user_role_id = user_role_id;
    }

    public String getROLE() {
        return ROLE;
    }

    public void setROLE(String ROLE) {
        this.ROLE = ROLE;
    }

    public User getUsername() {
        return username;
    }

    public void setUsername(User username) {
        this.username = username;
    }
    
}
