package com.its.all.repository;

import com.its.all.dto.ImageDTO;
import com.its.all.dto.ProductDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ImageRepository {
    @Autowired
    SqlSessionTemplate sql;
    public void saveFile(ImageDTO imageDTO) {
        sql.insert("Image.saveFile", imageDTO);
    }

    public List<ImageDTO> findAll() {
        return sql.selectList("Image.findAll");
    }
    public int delete(Long id) {
        return sql.delete("Image.delete", id);
    }
}
