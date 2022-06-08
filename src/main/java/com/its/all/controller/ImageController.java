package com.its.all.controller;

import com.its.all.dto.ImageDTO;
import com.its.all.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
@RequestMapping("/image")
@Controller
public class ImageController {
    @Autowired
    ImageService imageService;
    @GetMapping("/saveFile")
    public String saveFileForm() {
        return "image/save";
    }

    @PostMapping("/saveFile")
    public String saveFile(@ModelAttribute ImageDTO imageDTO, Model model) throws IOException {
        imageService.saveFile(imageDTO);
        model.addAttribute("image", imageDTO);
        return "redirect:/";
    }
}
