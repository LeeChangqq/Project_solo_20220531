package com.its.all.service;


import com.its.all.dto.ProductDTO;
import com.its.all.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class ProductService {
    @Autowired
    ProductRepository productRepository;

    public List<ProductDTO> findAll() {
        List<ProductDTO> productDTO = productRepository.findAll();
        return productDTO;
    }
    public void saveFile(ProductDTO productDTO) throws IOException {
        MultipartFile productFile = productDTO.getProductFile(); // 1.
        String productFileName = productFile.getOriginalFilename(); // 2.
        productFileName = System.currentTimeMillis() + "-" + productFileName; // 2.1
        productDTO.setProductProfile(productFileName); // 3.
        String savePath = "D:\\spring_img\\" + productFileName; // 4.
        // 5.
        if(!productFile.isEmpty()){
            productFile.transferTo(new File(savePath));
        }
        productRepository.saveFile(productDTO); // 6.
    }
    public ProductDTO findById(Long id) {
        return productRepository.findById(id);
    }
    public boolean delete(Long id) {
        int result = productRepository.delete(id);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }

//    public ProductDTO myPage(Long id) {
//        return productRepository.myPage(id);
//    }
}