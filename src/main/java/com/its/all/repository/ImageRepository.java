package com.its.all.repository;

import com.its.all.dto.ImageDTO;
import com.its.all.dto.ProductDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ImageRepository {
    @Autowired
    SqlSessionTemplate sql;
    public void saveFile(ImageDTO imageDTO) {
        sql.insert("Image.saveFile", imageDTO);
    }
}
