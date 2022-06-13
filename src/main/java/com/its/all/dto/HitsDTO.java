package com.its.all.dto;

import lombok.Data;

@Data
public class HitsDTO {
    Long id;
    Long memberId;
    Long commentId;
    int hits;
}
