package kr.co.T2Market.reciept.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RecieptAdminVO {

	private String reciept_no;
	private String member_id;
	private String name;
	private String indate;
	private String recieve_date;
	private String delivery;

	private Date regdate;
	private Date updatedate;
}
