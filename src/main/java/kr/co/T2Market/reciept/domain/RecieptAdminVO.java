package kr.co.T2Market.reciept.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RecieptAdminVO {

	private String detail_no;
	private String reciept_no;
	private String member_id;
	private String member_name;
	private String indate;
	private String recieve_date;
	private String delivery;

	private Date regdate;
	private Date updatedate;
	
	//주문관리 상세에 필요한 변수
	private String buyer_name;
	private String reciever_name;
	private String reciever_address;
	private String product_no;
	private String product_name;
	private String sales;
	private String total_price;
	
}
