package com.company.realestate.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

@Service
public class FileUtils {

    @Value("${upload.path}")
    private String uploadPath;

    @Value("${upload.path.img}")
    private String pathImg;

    @Value("${upload.path.vid}")
    private String pathVid;

    public File createFile(MultipartFile raw, String path) {
        try {
            if (raw  != null &&raw.getOriginalFilename() != null && !raw.getOriginalFilename().isEmpty()) {
                File uploadDir = new File(uploadPath + "/" + path);
                if(!uploadDir.exists() && !uploadDir.mkdir()) {
                    return null;
                }
                java.lang.String resultFileName = UUID.randomUUID().toString();
                File img = new File(uploadDir.getPath() + "/" + resultFileName);
                raw.transferTo(img);
                return img;
            }
            return null;
        } catch (IOException e) {
            return null;
        }
    }

    public File createFileImg(MultipartFile img) {
        return createFile(img, pathImg);
    }

    public File createFileVid(MultipartFile vid) {
        return createFile(vid, pathVid);
    }

    public boolean deleteFile(String path) {
        try {
            return Files.deleteIfExists(Paths.get(uploadPath + path));
        } catch (IOException e) {
            return false;
        }
    }
}
