/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.linhtd.repository;

import com.linhtd.entity.Bill;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Linh
 */
public interface BillRepository extends JpaRepository<Bill, Integer>{
    
}
