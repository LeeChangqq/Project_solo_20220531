package com.its.all.service;

import com.its.all.dto.MyPageDTO;
import com.its.all.repository.MyPageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageService {
    @Autowired
    MyPageRepository myPageRepository;

//    public void findById(Long id) {
//        myPageRepository.findById(id);
//    }

    public int save(MyPageDTO myPageDTO) {
        int result = myPageRepository.save(myPageDTO);
        return result;
    }
}
