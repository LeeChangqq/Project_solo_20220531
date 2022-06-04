package com.its.all.service;

import com.its.all.dto.ProductDTO;
import com.its.all.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    ProductRepository productRepository;

    public List<ProductDTO> findAll() {
        List<ProductDTO> productDTO = productRepository.findAll();
        return productDTO;
    }
}
