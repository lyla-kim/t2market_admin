package kr.co.T2Market.board.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class QnAVO {

	private Long qna_no;
	private String member_id;
	private String title;
	private String content;
	private Date regdate;
	private Date updatedate;
}
