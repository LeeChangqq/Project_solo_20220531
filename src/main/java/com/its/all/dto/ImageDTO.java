package com.its.all.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class ImageDTO {
    private Long id;
    private Long productId;
    private String image;
    private MultipartFile imageFile;
}
