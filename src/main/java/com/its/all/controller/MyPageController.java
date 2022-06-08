package com.its.all.controller;

import com.its.all.dto.MyPageDTO;
import com.its.all.dto.ProductDTO;
import com.its.all.service.MyPageService;
import com.its.all.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RequestMapping("/myPage")
@Controller
public class MyPageController {
    @Autowired
    MyPageService myPageService;
    @Autowired
    ProductService productService;
    @GetMapping("/save")
    public String save(@ModelAttribute MyPageDTO myPageDTO) {
        System.out.println("myPageDTO = " + myPageDTO);
        int result = myPageService.save(myPageDTO);
        if (result > 0) {
            return "redirect:/";
        } else {
            return "myPage/myPage-fail";
        }
    }
    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<MyPageDTO> myPageDTO = myPageService.findAll();
        model.addAttribute("myPage", myPageDTO);
        List<ProductDTO> productDTO = productService.findAll();
        model.addAttribute("product", productDTO);
        return "myPage/list";
    }
//    @GetMapping("/delete")
//    public String delete() {
//
//    }
}
