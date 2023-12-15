package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
@Table(name = "Accounts")
public class Account {
    @Id
    private String id;
    @Column(unique = true)
    private String email;
    private String password;
    private String phone;
    private String address;
    @Builder.Default
    private Boolean admin = false;
    private String image;
    @Builder.Default
    private Boolean activated = false;
    private String verifycode;
    private String resetPasswordToken;

}