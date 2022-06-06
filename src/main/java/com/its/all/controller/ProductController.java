package com.its.all.controller;

import com.its.all.dto.MemberDTO;
import com.its.all.dto.ProductDTO;
import com.its.all.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RequestMapping("product")
@Controller
public class ProductController {
    @Autowired
    ProductService productService;

    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<ProductDTO> productDTO = productService.findAll();
        return "index";
    }

    @GetMapping("/saveFile")
    public String saveFileForm() {
        return "product/save";
    }

    @PostMapping("/saveFile")
    public String saveFile(@ModelAttribute ProductDTO productDTO, Model model) throws IOException {
        productService.saveFile(productDTO);
        model.addAttribute("product", productDTO);
        return "redirect:/";
    }
//    @GetMapping("/detail")
//    public String findById(@RequestParam("id") Long id, Model model){
//        ProductDTO productDTO = productService.findById(id);
//        model.addAttribute("product", productDTO);
//        return "index";
//    }
}