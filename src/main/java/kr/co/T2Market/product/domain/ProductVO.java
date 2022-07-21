package kr.co.T2Market.product.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductVO {
	private String product_no;
	private String explain;
	private String product_name;
	private int discount;
	private int sell_price;
	private int real_price;
	private int total_output;
	private int total_sales;
	private int input;
	private int stock;
	private Date regdate;
	private Date updatedate;
	private String active;
	private String code_no;
	
	private String code1;
	private String code2;
	private String code1_name;
	private String code2_name;
	
	
	private List<ProductAttachVO> AttachList;
	
	
}
