/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.linhtd.repository;

import com.linhtd.entity.Role;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Linh
 */
public interface RoleRepository extends JpaRepository<Role, Integer>{
    
    @Query(value = "SELECT r FROM Role r WHERE LOWER(r.username) LIKE CONCAT('%',LOWER(:username),'%')")
    public List<Role> findByUsername(@Param("username") String username);
}
