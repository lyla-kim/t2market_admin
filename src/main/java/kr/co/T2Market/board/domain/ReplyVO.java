package kr.co.T2Market.board.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ReplyVO {

	private Long qna_no;
	private Long answer_no;
	private String admin_id;
	private String content;
	private Date regdate;
	private Date updatedate;
	
}
