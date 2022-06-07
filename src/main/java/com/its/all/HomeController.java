package com.its.all;
import com.its.all.dto.MyPageDTO;
import com.its.all.dto.ProductDTO;
import com.its.all.service.MyPageService;
import com.its.all.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    ProductService productService;
    @GetMapping("/")
    public String index(Model model, @ModelAttribute MyPageDTO myPageDTO) {
        List<ProductDTO> productDTO = productService.findAll();
        model.addAttribute("product", productDTO);
        model.addAttribute("myPage", myPageDTO);
        return "index";
    }
}