package com.its.all.dto;

import lombok.Data;

import java.sql.Timestamp;
@Data
public class BuyDTO {
    private Long id;
    private Long memberId;
    private Long productId;
    private int myQuantity;
    private Timestamp buyDate;
}
