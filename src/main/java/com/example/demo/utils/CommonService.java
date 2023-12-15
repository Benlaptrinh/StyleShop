package com.example.demo.utils;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class CommonService implements CommonUtils {
    @Autowired
    HttpServletRequest req;

    public static boolean isLogin = false;

    @Override
    public File saveFile(MultipartFile multipartFile, String path) {
        if (multipartFile != null) {
            File dir = new File(req.getServletContext().getRealPath("upload/" + path));
            if (!dir.exists()) {
                dir.mkdirs();
            }
            try {
                File saveFile = new File(dir, multipartFile.getOriginalFilename());
                multipartFile.transferTo(saveFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public String randomAlphaNumericString(int size) {
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";
        StringBuilder sb = new StringBuilder(size);
        for (int i = 0; i < size; i++) {
            int index = (int) (AlphaNumericString.length()
                    * Math.random());
            sb.append(AlphaNumericString.charAt(index));
        }
        return sb.toString();
    }

    public static String getSiteURL(HttpServletRequest req) {
        String siteURL = req.getRequestURL().toString();
        return siteURL.replace(req.getServletPath(), "");
    }

}
