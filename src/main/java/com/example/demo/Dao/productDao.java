package com.example.demo.Dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.Product;
import com.example.demo.model.Report;

public interface productDao extends JpaRepository<Product, Integer> {
        Page<Product> findAllByNameLike(String keywords, Pageable pageable);

        Page<Product> findAllByPriceIs(Double keywords, Pageable pageable);

        @Query("SELECT new Report(o.categoryid.name, sum(o.price), count(o)) "
                        + " FROM Product o "
                        + " GROUP BY o.categoryid.name"
                        + " ORDER BY sum(o.price) DESC")
        List<Report> getInventoryByCategory();

        @Query("SELECT new Report(o.createdate, sum(o.price), count(o)) "
                        + " FROM Product o "
                        + " GROUP BY o.createdate"
                        + " ORDER BY sum(o.price) DESC")
        List<Report> getInventoryByCategory1();

        @Query("SELECT p FROM Product p WHERE p.categoryid.id = :categoryId")
        List<Product> findByCustomCategoryId(@Param("categoryId") String categoryId);

}