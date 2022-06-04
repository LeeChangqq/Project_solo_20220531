package com.its.all.controller;

import com.its.all.dto.ProductDTO;
import com.its.all.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("product")
@Controller
public class ProductController {
    @Autowired
    ProductService productService;
    @GetMapping("/findAll")
    public String findAll() {
        List<ProductDTO> productDTO = productService.findAll();
        return "product/list";
    }
}
