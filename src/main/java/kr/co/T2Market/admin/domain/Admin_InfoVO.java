package kr.co.T2Market.admin.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Admin_InfoVO {

	private String admin_id;
	private String code1;
	private String code2;
	private String pass;
	private String name;
	private String active;

	private Date regdate;
	private Date updatedate;
}
