package com.its.all.repository;

import com.its.all.dto.MemberDTO;
import com.its.all.dto.ProductDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductRepository {
    @Autowired
    SqlSessionTemplate sql;

    public List<ProductDTO> findAll() {
        return sql.selectList("Product.findAll");
    }
    public void saveFile(ProductDTO productDTO) {
        sql.insert("Product.saveFile", productDTO);
    }
    public ProductDTO findById(Long id) {
        return sql.selectOne("Product.findById", id);
    }
    public int delete(Long id) {
        return sql.delete("Product.delete", id);
    }
}



