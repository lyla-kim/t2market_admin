package kr.co.T2Market.board.mapper;

import java.util.List;

import kr.co.T2Market.board.domain.PagingVO;
import kr.co.T2Market.board.domain.QnAVO;

public interface QnAMapper {

	public List<QnAVO> getList();
	
	public QnAVO read(String qnaNo);

	public int countReciept();
	
	public List<QnAVO> selectQnA(PagingVO vo);
	
	public void updateReplyCount(String qnaNo);
}