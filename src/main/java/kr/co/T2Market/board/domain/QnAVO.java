package kr.co.T2Market.board.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class QnAVO {

	private Long notice_no;
	private String admin_id;
	private String title;
	private String content;
	private String active;	//db default 'Y'
	private Date regdate;
	private Date updatedate;
}
