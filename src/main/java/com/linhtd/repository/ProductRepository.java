/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.linhtd.repository;

import com.linhtd.entity.Product;
import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Linh
 */
public interface ProductRepository extends JpaRepository<Product, Integer>{
    
    @Query(value = "SELECT p FROM Product p")
    public List<Product> paging(Pageable pageable);
    
    @Query(value = "SELECT p FROM Product p WHERE LOWER(p.name) LIKE CONCAT('%',LOWER(:name),'%')")
    public List<Product> findAndPaging(@Param("name") String name, Pageable pageable);
    
    @Query(value = "SELECT COUNT(p.id) FROM Product p WHERE LOWER(p.name) LIKE CONCAT('%',LOWER(:name),'%')")
    public int getAllFoundedItemsByName(@Param("name") String name);
    
    @Query(value = "SELECT p FROM Product p WHERE p.category.id = :cateId AND LOWER(p.name) LIKE CONCAT('%',LOWER(:name),'%')")
    public List<Product> findByNameFilterByCate(@Param("cateId") int cateId, @Param("name") String name, Pageable pageable);
    
    @Query(value = "SELECT COUNT(p.id) FROM Product p WHERE p.category.id = :cateId AND LOWER(p.name) LIKE CONCAT('%',LOWER(:name),'%')")
    public int getAllFoundedItemsFilterByCategory(@Param("cateId") int cateId, @Param("name") String name);
}
