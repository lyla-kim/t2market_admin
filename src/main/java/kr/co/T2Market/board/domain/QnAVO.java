package kr.co.T2Market.board.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
public class QnAVO {

	private String qna_no;
	private String member_id;
	private String title;
	private String content1;
	private Date regdate;
	private Date updatedate;
	
	private int reply_count;
	
	
}
