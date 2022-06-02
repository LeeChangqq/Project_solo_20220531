package com.its.all.dto;

import lombok.Data;

import java.sql.Timestamp;
@Data
public class CommentDTO {
    private Long id;
    private Long memberId;
    private String commentContents;
    private String commentWriter;
    private Timestamp commentDate;
    private int commentHits;
    private Long productId;
}
