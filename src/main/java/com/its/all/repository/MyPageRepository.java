package com.its.all.repository;

import com.its.all.dto.MyPageDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MyPageRepository {
    @Autowired
    SqlSessionTemplate sql;

    public int save(MyPageDTO myPageDTO) {
        return  sql.insert("MyPage.save",myPageDTO);
    }
    public List<MyPageDTO> findAll() {
        return sql.selectList("MyPage.findAll");
    }
    public MyPageDTO findById(Long id){
        return sql.selectOne("MyPage.findById",id);
    }
    public int delete(Long id) {
        return sql.delete("MyPage.delete", id);
    }
    public MyPageDTO check(MyPageDTO myPageDTO) {
        return sql.selectOne("MyPage.check", myPageDTO);
    }
}
