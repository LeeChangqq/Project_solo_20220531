package com.its.all.repository;

import com.its.all.dto.CommentDTO;
import com.its.all.dto.HitsDTO;
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
    public CommentDTO findById1(Long id) {
        sql.update("Comment.hits", id);
        return sql.selectOne("Comment.findById", id);
    }

    public int hits(HitsDTO hitsDTO) {
        System.out.println(hitsDTO);
        return sql.insert("Hits.hits", hitsDTO);
    }
    public HitsDTO check(HitsDTO hitsDTO) {
        return sql.selectOne("Hits.check", hitsDTO);
    }
    public CommentDTO findById2(Long id) {
        sql.update("Comment.hits2", id);
        return sql.selectOne("Comment.findById2", id);
    }

    public int hitsDelete(HitsDTO hitsDTO) {
        return sql.delete("Hits.delete", hitsDTO);
    }

    public HitsDTO hitsFind(Long id) {
        return sql.selectOne("Hits.find",id);
    }

    public List<HitsDTO> hitsFindAll() {
        return sql.selectList("Hits.all");
    }

//    public String updateHits(HitsDTO hitsDTO) {
//        HitsDTO hitsDTO1 = sql.selectOne("Comment.duplicateCheck", hitsDTO);
//        if (hitsDTO1 != null) {
//            return "no";
//        } else {
//            sql.update("Comment.hits", hitsDTO.getCommentId());
//            return "yes";
//        }
//    }

}
