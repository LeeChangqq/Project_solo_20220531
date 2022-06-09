package com.its.all.controller;

import com.its.all.dto.CommentDTO;
import com.its.all.dto.ImageDTO;
import com.its.all.dto.MemberDTO;
import com.its.all.dto.ProductDTO;
import com.its.all.service.CommentService;
import com.its.all.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/comment")
@Controller
public class CommentController {
    @Autowired
    CommentService commentService;
    @Autowired
    ProductService productService;
    @PostMapping("/save")
    public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO commentDTO){
        commentService.save(commentDTO); // 1.
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getProductId());
        return commentDTOList;
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id,@ModelAttribute CommentDTO commentDTO) {
        boolean result = commentService.delete(id);
        if (result) {
            return "redirect:/product/detail?id=" + commentDTO.getProductId();
        } else {
            return "delete-fail";
        }
    }
//    @GetMapping("/update")
//    public String updateForm(Model model,@RequestParam Long id, @RequestParam("productId") Long id2) {
//        CommentDTO commentDTO = commentService.findById(id);
//        ProductDTO productDTO = productService.findById(id2);
//        model.addAttribute("comment", commentDTO);
//        model.addAttribute("product", productDTO);
//        return "comment/update";
//    }

    @PostMapping("/update")
    public @ResponseBody List<CommentDTO> update(@ModelAttribute CommentDTO commentDTO) {
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getProductId());
        return commentDTOList;
    }
    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model) {
        CommentDTO commentDTO = commentService.findById(id);
        model.addAttribute("comment", commentDTO);
        return "member/detail";
    }
}
