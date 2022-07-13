package kr.co.T2Market.board.service;

import java.util.List;

import kr.co.T2Market.board.domain.NoticeVO;
import kr.co.T2Market.board.domain.QnAVO;
import kr.co.T2Market.reciept.domain.PagingVO;

public interface QnAService {

	public List<QnAVO> getList();
	
	public QnAVO get(Long qna_no);
	
	public int countReciept();
	
	public List<QnAVO> selectQnA(PagingVO vo);
}
