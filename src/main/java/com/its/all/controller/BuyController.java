package com.its.all.controller;

import com.its.all.dto.BuyDTO;
import com.its.all.dto.ProductDTO;
import com.its.all.service.BuyService;
import com.its.all.service.MyPageService;
import com.its.all.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequestMapping("/buy")
@Controller
public class BuyController {
    @Autowired
    BuyService buyService;
    @Autowired
    MyPageService myPageService;
    @Autowired
    ProductService productService;
    @GetMapping("/buy")
    public String buy(@RequestParam("myPageId") Long my , @ModelAttribute ProductDTO productDTO,@ModelAttribute BuyDTO buyDTO) {
        myPageService.delete(my);
        productService.quantityUpdate(productDTO);
        buyService.save(buyDTO);
            return "redirect:/myPage/findAll";
    }
    @GetMapping("/buy2")
    public String buy2(@ModelAttribute ProductDTO productDTO,@ModelAttribute BuyDTO buyDTO) {
        productService.quantityUpdate(productDTO);
        buyService.save(buyDTO);
        return "redirect:/";
    }
    @GetMapping("list")
    public String findAll(@RequestParam("memberId") Long id, Model model) {
        List<BuyDTO> buyDTOList = buyService.findAll(id);
        model.addAttribute("buyList", buyDTOList);
        return "buy/list";
    }

}
