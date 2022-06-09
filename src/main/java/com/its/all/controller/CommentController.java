package com.its.all.controller;

import com.its.all.dto.CommentDTO;
import com.its.all.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/comment")
@Controller
public class CommentController {
    @Autowired
    CommentService commentService;
    @PostMapping("/save")
    public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO commentDTO){
        commentService.save(commentDTO); // 1.
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getProductId());
        return commentDTOList;
    }
}
