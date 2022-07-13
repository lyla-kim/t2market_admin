package kr.co.T2Market.board.service;

import java.util.List;

import kr.co.T2Market.board.domain.NoticeVO;
import kr.co.T2Market.board.domain.ReplyVO;
import kr.co.T2Market.reciept.domain.PagingVO;

public interface ReplyService {

	public void regiser(ReplyVO reply);
	
	public ReplyVO get(Long reply_no);
	
	public boolean modify(ReplyVO reply);
	
	public boolean remove(Long reply_no);
	
	public int countReciept();
	
	public List<ReplyVO> selectReply(PagingVO vo);
}
