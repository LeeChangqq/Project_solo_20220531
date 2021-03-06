package com.its.all.service;

import com.its.all.dto.CommentDTO;
import com.its.all.dto.HitsDTO;
import com.its.all.dto.MemberDTO;
import com.its.all.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    CommentRepository commentRepository;
    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }

    public List<CommentDTO> findAll(Long productId) {
        return commentRepository.findAll(productId);
    }
    public boolean delete(Long id) {
        int result = commentRepository.delete(id);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }
    public void update(CommentDTO commentDTO) {
        commentRepository.update(commentDTO);
    }
    public CommentDTO findById(Long id) {
        System.out.println(id);
        return commentRepository.findById(id);
    }

    public int hits(HitsDTO hitsDTO) {
        return commentRepository.hits(hitsDTO);
    }
    public String check(HitsDTO hitsDTO) {
        HitsDTO result = commentRepository.check(hitsDTO);
        System.out.println(result);
        if (result == null) {
            return "ok";
        } else {
            return "no";
        }
    }
    public CommentDTO findById1(Long id) {
        return commentRepository.findById1(id);
    }
    public CommentDTO findById2(Long id) {
        return commentRepository.findById2(id);
    }
    public boolean hitsDelete(HitsDTO hitsDTO){
        int result = commentRepository.hitsDelete(hitsDTO);
        if(result > 0){
            return true;
        }else {
            return false;
        }
    }

    public HitsDTO hitsFind(Long id) {
        return commentRepository.hitsFind(id);
    }

    public List<HitsDTO> hitsFindAll() {
        return commentRepository.hitsFindAll();
    }
//    public String updateHits(HitsDTO hitsDTO){
//        return commentRepository.updateHits(hitsDTO);
//    }
}
