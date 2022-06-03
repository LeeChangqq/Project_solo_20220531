package com.its.all.repository;

import com.its.all.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class MemberRepository {
    @Autowired
    SqlSessionTemplate sql;

    public int save(MemberDTO memberDTO) {
        return  sql.insert("Member.save",memberDTO);
    }
    public String check(String memberId) {
        return sql.selectOne("Member.check", memberId);
    }
    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }
    public int update(MemberDTO memberDTO) {
        return sql.update("Member.update", memberDTO);
    }
    public int delete(Long id) {
        return sql.delete("Member.delete", id);
    }
    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }

    public MemberDTO findById(Long id) {
        return sql.selectOne("Member.findById", id);
    }
    public int boardCount() {
        return sql.selectOne("Member.count");
    }

    public List<MemberDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Member.pagingList", pagingParam);
    }
}
