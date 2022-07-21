package kr.co.T2Market.product.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductAttachVO {

	private String product_no;
	private String uuid;
	private String uploadPath;
	private String fileName;
	private Date regdate;
	private Date updatedate;
}
