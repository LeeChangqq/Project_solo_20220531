package com.its.all.service;

import com.its.all.dto.BuyDTO;
import com.its.all.repository.BuyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BuyService {
    @Autowired
    BuyRepository buyRepository;

    public void save(BuyDTO buyDTO) {
        buyRepository.save(buyDTO);
    }

    public List<BuyDTO> findAll(Long id) {
        return buyRepository.findAll(id);
    }

    public List<BuyDTO> findAll2() {
        return buyRepository.findAll2();
    }
}
