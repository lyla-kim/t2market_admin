package kr.co.T2Market.board.mapper;

import java.util.List;

import kr.co.T2Market.board.domain.NoticeVO;
import kr.co.T2Market.board.domain.ReplyVO;
import kr.co.T2Market.reciept.domain.PagingVO;

public interface ReplyMapper {

	public List<ReplyVO> getList();
	
	public void insert(ReplyVO reply);
	
	public int update(ReplyVO reply);
	
	public boolean delete(Long reply_no);
	
	public int countReciept();
	
	public List<ReplyVO> selectReply(PagingVO vo);

	public ReplyVO read(Long reply_no);
}