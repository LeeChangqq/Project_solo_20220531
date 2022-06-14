package com.its.all.controller;

import com.its.all.service.BuyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/buy")
@Controller
public class BuyController {
    @Autowired
    BuyService buyService;
    @GetMapping("/buy")
    public String buy() {
        return "buy/buy";
    }
}
