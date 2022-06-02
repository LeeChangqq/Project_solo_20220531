package com.its.all.dto;

import lombok.Data;

@Data
public class ProductDTO {
    private Long id;
    private String productName;
    private String productContents;
    private String productProfile;
    private int productPrice;
    private int productQuantity;
}
