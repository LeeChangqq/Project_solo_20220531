package com.its.all.service;

import com.its.all.dto.CommentDTO;
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
        return commentRepository.findById(id);
    }
}
