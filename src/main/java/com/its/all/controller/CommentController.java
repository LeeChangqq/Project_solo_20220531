package com.its.all.controller;

import com.its.all.dto.*;
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
    public void updateForm(@ModelAttribute CommentDTO commentDTO) {
        System.out.println("CommentController.updateForm");
        System.out.println(commentDTO);
        commentService.update(commentDTO);
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model) {
        CommentDTO commentDTO = commentService.findById(id);
        model.addAttribute("comment", commentDTO);
        return "redirect:/product/detail";
    }
    @GetMapping("/hits")
    public String hits(@ModelAttribute HitsDTO hitsDTO,@RequestParam("id") Long id,@RequestParam("productId") Long productId){
        commentService.findById1(id);
        int result = commentService.hits(hitsDTO);
        System.out.println(id);
        if(result > 0){
            return "redirect:/product/detail?id=" + productId;
        }else {
            return "/";
        }
    }
    @PostMapping("/check")
    public @ResponseBody String check(@ModelAttribute HitsDTO hitsDTO) {
        String check = commentService.check(hitsDTO);
        return check;
    }
    @GetMapping("/hits2")
    public String hits2(@ModelAttribute HitsDTO hitsDTO, @RequestParam("commentId") Long commentId,@RequestParam("productId") Long productId) {
        commentService.findById2(commentId);
        boolean result = commentService.hitsDelete(hitsDTO);
        System.out.println(hitsDTO.getId());
        if(result == true){
            return "redirect:/product/detail?id=" + productId;
        }else {
            return "/";
        }

    }
//    @GetMapping("/hitsFind")
//    public String hitsFind(@RequestParam("id") Long id, Model model){
//        HitsDTO hitsDTO = commentService.hitsFind(id);
//        model.addAttribute("hits", hitsDTO);
//        return "product/detail";
//    }
//    @GetMapping("/hitsFindAll")
//    public String hitsFindAll(Model model){
//        List<HitsDTO> hits = commentService.hitsFindAll();
//        model.addAttribute("hitsList", hits);
//        return "index";
//    }
//    @PostMapping("/updateHits")
//    public @ResponseBody String updateHits(@ModelAttribute HitsDTO hitsDTO){
//        String result = commentService.updateHits(hitsDTO);
//        return result;
//    }
}
