package com.its.all.repository;

import com.its.all.dto.CommentDTO;
import com.its.all.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    SqlSessionTemplate sql;
    public void save(CommentDTO commentDTO) {
        sql.insert("Comment.save", commentDTO);
    }

    public List<CommentDTO> findAll(Long productId) {
        return sql.selectList("Comment.findAll", productId);
    }
    public int delete(Long id) {
        return sql.delete("Comment.delete", id);
    }
    public void update(CommentDTO commentDTO) {
        sql.update("Comment.update", commentDTO);
    }
    public CommentDTO findById(Long id) {
        return sql.selectOne("Comment.findById", id);
    }
}
