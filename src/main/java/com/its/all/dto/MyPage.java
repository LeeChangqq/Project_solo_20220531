package com.its.all.dto;

import lombok.Data;

@Data
public class MyPage {
    private Long id;
    private Long memberId;
    private Long productId;
    private int myQuantity;
}
