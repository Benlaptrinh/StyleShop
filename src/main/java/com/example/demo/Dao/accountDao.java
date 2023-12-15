package com.example.demo.Dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.Account;

public interface accountDao extends JpaRepository<Account, String> {
    public Account findByEmail(String email);

    public boolean existsAccountById(String id);

    @Query("SELECT o FROM Account o WHERE verifycode=?1")
    public Account findByVerifyCode(String code);

    public boolean existsAccountByEmail(String email);

    public Account findByResetPasswordToken(String token);

}
