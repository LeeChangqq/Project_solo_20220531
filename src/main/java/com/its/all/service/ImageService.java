package com.its.all.service;

import com.its.all.dto.ImageDTO;
import com.its.all.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class ImageService {
    @Autowired
    ImageRepository imageRepository;
    public void saveFile(ImageDTO imageDTO) throws IOException {
        MultipartFile imageFile = imageDTO.getImageFile(); // 1.
        String imageFileName = imageFile.getOriginalFilename(); // 2.
        imageFileName = System.currentTimeMillis() + "-" + imageFileName; // 2.1
        imageDTO.setImage(imageFileName); // 3.
        String savePath = "D:\\spring_img\\" + imageFileName; // 4.
        // 5.
        if(!imageFile.isEmpty()){
            imageFile.transferTo(new File(savePath));
        }
        imageRepository.saveFile(imageDTO); // 6.
    }
}
