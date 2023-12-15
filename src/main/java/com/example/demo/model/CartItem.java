package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartItem {
    private Integer id;
    private String name;
    private double price;
    private String image;
    @Builder.Default
    private int qty = 1;
}
