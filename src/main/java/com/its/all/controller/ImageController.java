package com.its.all.controller;

import com.its.all.dto.ImageDTO;
import com.its.all.dto.ProductDTO;
import com.its.all.service.ImageService;
import com.its.all.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RequestMapping("/image")
@Controller
public class ImageController {
    @Autowired
    ImageService imageService;
    @Autowired
    ProductService productService;
    @GetMapping("/saveFile")
    public String saveFileForm(Model model, @RequestParam("id") Long id) {
        ProductDTO productDTO = productService.findById(id);
        model.addAttribute("product",productDTO);
        return "image/image";
    }

    @PostMapping("/saveFile")
    public String saveFile(@ModelAttribute ImageDTO imageDTO) throws IOException {
        imageService.saveFile(imageDTO);
        return "redirect:/product/detail?id=" + imageDTO.getProductId();
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id,@ModelAttribute ImageDTO imageDTO) {
        boolean result = imageService.delete(id);
        if (result) {
            return "redirect:/product/detail?id=" + imageDTO.getProductId();
        } else {
            return "delete-fail";
        }
    }
}
