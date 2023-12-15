package com.example.demo.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Category;

public interface categoryDAO extends JpaRepository<Category, String> {
    // Derived Query - for checking if category exist by id
    public boolean existsCategoryById(String id);

    // Derived Query - for checking if category exist by name
    public boolean existsCategoryByName(String name);
}
