package com.example.demo.Dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.model.Order;
import com.example.demo.model.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer> {

    List<OrderDetail> findByOrderid(Order order);

}