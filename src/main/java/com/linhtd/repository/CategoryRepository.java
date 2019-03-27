/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.linhtd.repository;

import com.linhtd.entity.Category;
import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Linh
 */
public interface CategoryRepository extends JpaRepository<Category, Integer>{

    @Query(value = "SELECT c FROM Category c")
    public List<Category> paging(Pageable pageable);
    
    @Query(value = "SELECT c FROM Category c WHERE LOWER(c.name) LIKE CONCAT('%',LOWER(:name),'%')")
    public List<Category> findAndPaging(@Param("name") String name, Pageable pageable);
}
