package com.its.all.controller;

import com.its.all.dto.MemberDTO;
import com.its.all.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/member")
@Controller
public class MemberController {
    @Autowired
    MemberService memberService;
    @GetMapping("/save")
    public String saveForm() {
        return "member/save";
    }
    @PostMapping("save")
    public String save(MemberDTO memberDTO) {
        int result = memberService.save(memberDTO);
        if(result > 0){
            return "member/login";
        }else {
            return "member/save-fail";
        }
    }
    @PostMapping("/check")
    public @ResponseBody String check(@RequestParam("memberId") String memberId) {
        String check = memberService.check(memberId);
        return check;
    }
}
