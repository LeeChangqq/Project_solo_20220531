package com.its.all.controller;

import com.its.all.dto.MemberDTO;
import com.its.all.dto.PageDTO;
import com.its.all.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

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
            return "redirect:/member/login-form";
        }else {
            return "member/save-fail";
        }
    }
    @PostMapping("/check")
    public @ResponseBody String check(@RequestParam("memberId") String memberId) {
        String check = memberService.check(memberId);
        return check;
    }
    @GetMapping("/login-form")
    public String loginForm() {
        return "member/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model) {
        MemberDTO result = memberService.login(memberDTO);
        if(result == null){
            return "member/login";
        } else {
            session.setAttribute("memberId",result);
            session.setAttribute("member",result.getId());
            model.addAttribute("member", result);
            return "/index";
        }
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }
    @GetMapping("/update")
    public String updateForm(HttpSession session, Model model) {
        Long updateId = (Long) session.getAttribute("member");
        System.out.println("updateId = " + updateId);
        MemberDTO memberDTO = memberService.findById(updateId);
        model.addAttribute("updateMember", memberDTO);
        return "member/update";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO){
        boolean result = memberService.update(memberDTO);
        System.out.println("memberDTO = " + memberDTO);
        if(result) {
            // 해당 회원이 상세정보
            return "redirect:/member/detail?id=" + memberDTO.getId();
        }else {
            return "update-fail";
        }

    }
    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("member",memberDTOList);
        return "member/list";
    }
    @GetMapping("/delete")
    public String delete (@RequestParam("id") Long id, HttpSession session) {
        boolean result = memberService.delete(id);
        if(result) {
            session.invalidate();
            return "index";
        }else {
            return "delete-fail";
        }
    }
    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "member/detail";
    }
    @GetMapping("/paging")
    public String paging(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model) {
        List<MemberDTO> memberList = memberService.pagingList(page);
        PageDTO paging = memberService.paging(page);
        model.addAttribute("member", memberList);
        model.addAttribute("paging", paging);
        return "index";
    }
    @GetMapping("/check")
    public String check(@RequestParam Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member",memberDTO);
        return "member/check";
    }
}
