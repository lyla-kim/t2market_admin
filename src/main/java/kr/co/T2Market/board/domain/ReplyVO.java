package kr.co.T2Market.board.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ReplyVO {

	private String qna_no;
	private String answer_no;
	private String admin_id;
	private String content;
	private Date regdate;
	private Date updatedate;
	
}
