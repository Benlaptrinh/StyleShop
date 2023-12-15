package com.example.demo.Service;

import java.util.Collection;

import com.example.demo.model.CartItem;

public interface ShoppingCartService {
    void add(Integer id);

    void remove(Integer id);

    CartItem update(Integer id, int qty);

    void clear();

    Collection<CartItem> getCartItems();

    int soluong();

    int getCount();

    double getAmount();
}
