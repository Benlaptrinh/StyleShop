package com.example.demo.utils;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountForm implements Serializable {
    @NotBlank
    private String id;
    @NotBlank
    private String email;
    @NotBlank
    private String password;

    private String retypePassword;
    @NotBlank
    private String phone;
    @NotBlank
    private String address;

    private Boolean admin = false;

    private MultipartFile image;

    private String imageUrl;
}
