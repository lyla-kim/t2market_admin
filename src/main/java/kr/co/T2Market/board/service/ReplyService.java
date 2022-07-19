package kr.co.T2Market.board.service;

import java.util.List;

import kr.co.T2Market.board.domain.PagingVO;
import kr.co.T2Market.board.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);
	
	public List<ReplyVO> get(String answer_no);
	
	public int modify(ReplyVO vo);
	
	public int remove(ReplyVO vo);
	
	public int countReply();
	
	public List<ReplyVO> getList(PagingVO pag, String qna_no);
	
	public ReplyVO selectReply(String answer_no);
}
