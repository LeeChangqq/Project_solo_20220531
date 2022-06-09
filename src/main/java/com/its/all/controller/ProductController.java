package com.its.all.controller;

import com.its.all.dto.CommentDTO;
import com.its.all.dto.ImageDTO;
import com.its.all.dto.ProductDTO;
import com.its.all.service.CommentService;
import com.its.all.service.ImageService;
import com.its.all.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RequestMapping("/product")
@Controller
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    ImageService imageService;
    @Autowired
    CommentService commentService;

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
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boolean result = productService.delete(id);
        if (result) {
            return "redirect:/";
        } else {
            return "delete-fail";
        }
    }
    @GetMapping("/myPage")
    public String myPage(@RequestParam("id") Long id, Model model) {
        ProductDTO productDTO = productService.findById(id);
        List<ProductDTO> productDTOList = productService.findAll();
        model.addAttribute("productDTO", productDTO);
        model.addAttribute("productList",productDTOList);
        return "product/myPage";
    }
//    @GetMapping("/myPage")
//    public String myPage(@RequestParam("id") Long id, Model model) {
//        ProductDTO productDTO = productService.myPage(id);
//        model.addAttribute("product", productDTO);
//        return "myPage";
//    }
    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model){
        ProductDTO productDTO = productService.findById(id);
        model.addAttribute("product", productDTO);
        List<ProductDTO> productDTOList = productService.findAll();
        List<ImageDTO> imageList = imageService.findAll();
        List<CommentDTO> commentList = commentService.findAll(id);
        model.addAttribute("image", imageList);
        model.addAttribute("productList",productDTOList);
        model.addAttribute("commentList",commentList);
        return "product/detail";
    }
}