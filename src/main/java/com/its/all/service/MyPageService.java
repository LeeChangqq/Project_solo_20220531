package com.its.all.service;

import com.its.all.dto.MyPageDTO;
import com.its.all.repository.MyPageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyPageService {
    @Autowired
    MyPageRepository myPageRepository;

    public MyPageDTO findById(Long id) {
        return myPageRepository.findById(id);
    }

    public int save(MyPageDTO myPageDTO) {
        int result = myPageRepository.save(myPageDTO);
        return result;
    }
    public List<MyPageDTO> findAll() {
        return myPageRepository.findAll();
    }
    public boolean delete(Long id) {
        int result = myPageRepository.delete(id);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }
    public String check(MyPageDTO myPageDTO) {
        MyPageDTO product = myPageRepository.check(myPageDTO);
        System.out.println(myPageDTO);
        if (product == null) {
            return "ok";
        } else {
            return "no";
        }
    }
}
