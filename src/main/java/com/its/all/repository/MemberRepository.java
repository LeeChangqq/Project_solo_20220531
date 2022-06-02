package com.its.all.repository;

import com.its.all.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
