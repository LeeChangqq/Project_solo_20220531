package com.its.all.service;

import com.its.all.repository.BuyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BuyService {
    @Autowired
    BuyRepository buyRepository;
}
