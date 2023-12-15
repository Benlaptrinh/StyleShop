package com.example.demo.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Mail {
    String from = "HuuViet";
    String to;
    String[] cc;
    String[] bcc;
    String subject;
    String body;
    List<File> files = new ArrayList<>();

    public Mail(String to, String subject, String body) {
        this.to = to;
        this.subject = subject;
        this.body = body;
    }

}
