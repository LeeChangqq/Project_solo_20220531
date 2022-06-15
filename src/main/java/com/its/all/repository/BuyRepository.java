package com.its.all.repository;

import com.its.all.dto.BuyDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BuyRepository {
    @Autowired
    SqlSessionTemplate sql;

    public void save(BuyDTO buyDTO) {
        sql.insert("Buy.save",buyDTO);
    }

    public List<BuyDTO> findAll(Long id) {
        return sql.selectList("Buy.findAll", id);
    }

    public List<BuyDTO> findAll2() {
        return sql.selectList("Buy.findAll2");
    }

}
