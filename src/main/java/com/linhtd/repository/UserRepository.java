/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.linhtd.repository;

import com.linhtd.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Linh
 */
public interface UserRepository extends JpaRepository<User, String>{
    
    @Query(value = "SELECT COUNT(u.username) FROM User u WHERE u.username = :username")
    public int checkExistedUser(@Param("username") String username);
}
