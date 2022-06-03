package com.its.all.service;

import com.its.all.dto.MemberDTO;
import com.its.all.dto.PageDTO;
import com.its.all.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public MemberDTO login(MemberDTO memberDTO) {
        return memberRepository.login(memberDTO);
    }
    public boolean update(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        int result = memberRepository.update(memberDTO);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public boolean delete(Long id) {
        int result = memberRepository.delete(id);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }
    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }
    private static final int PAGE_LIMIT = 5; // 한페이지에 보여줄 글 갯수
    private static final int BLOCK_LIMIT = 3; // 페이지 번호 갯수
    public List<MemberDTO> pagingList(int page) {
        // 1페이지 요청=>
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<MemberDTO> pagingList = memberRepository.pagingList(pagingParam);
        return pagingList;
    }

    public PageDTO paging(int page) {
        int boardCount = memberRepository.boardCount(); // 글 갯수 조회
        // 필요한 전체 페이지 갯수
        // 10, 3 10/3 = 3.3333 => (4 => Math.ceil로 올림을 처리함)
        int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
        // 시작페이지 1 4 7 10 ~~~
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        // 끝페이지 3 6 9 12 ~~~
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage) // 끝페이지가 3 6 9지만 endpage랑 그 값을 맞춰서 필요 없는 페이지를 안만든다
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }
}
