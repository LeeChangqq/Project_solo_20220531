package com.its.all.repository;

import com.its.all.dto.MyPageDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageRepository {
    @Autowired
    SqlSessionTemplate sql;

    public int save(MyPageDTO myPageDTO) {
        return  sql.insert("MyPage.save",myPageDTO);
    }
}
