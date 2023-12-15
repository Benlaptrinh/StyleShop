package com.example.demo.utils;

import java.time.LocalDate;
import org.springframework.web.multipart.MultipartFile;
import com.example.demo.model.Category;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductForm {
    private Integer id;

    private String name;

    private Double price;

    private MultipartFile image;

    private String imageUrl;

    private Boolean available = false;

    private LocalDate createdate;

    private Category categoryid;

}
