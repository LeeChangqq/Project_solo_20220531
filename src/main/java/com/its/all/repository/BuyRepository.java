package com.its.all.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BuyRepository {
    @Autowired
    SqlSessionTemplate sql;
}
