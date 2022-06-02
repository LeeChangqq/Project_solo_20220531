package com.its.all.service;

import com.its.all.dto.MemberDTO;
import com.its.all.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    MemberRepository memberRepository;

    public int save(MemberDTO memberDTO) {
        int result = memberRepository.save(memberDTO);
        return result;
    }
    public String check(String memberId) {
        String member = memberRepository.check(memberId);
        if (member == null) {
            return "ok";
        } else {
            return "no";
        }
    }
}
