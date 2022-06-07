package com.its.all.controller;

import com.its.all.dto.MyPageDTO;
import com.its.all.service.MyPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/myPage")
@Controller
public class MyPageController {
    @Autowired
    MyPageService myPageService;
    @GetMapping("/save")
    public String save(@ModelAttribute MyPageDTO myPageDTO) {
        int result = myPageService.save(myPageDTO);
        if (result > 0) {
            return "redirect:/";
        } else {
            return "myPage/myPage-fail";
        }
    }
}
