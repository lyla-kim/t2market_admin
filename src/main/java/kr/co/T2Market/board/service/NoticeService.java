package kr.co.T2Market.board.service;

import java.util.List;

import kr.co.T2Market.board.domain.NoticeVO;
import kr.co.T2Market.reciept.domain.PagingVO;

public interface NoticeService {

	public List<NoticeVO> getList();
	
	public void regiser(NoticeVO notice);
	
	public NoticeVO get(Long notice_no);
	
	public boolean modify(NoticeVO notice);
	
	public int countReciept();
	
	public List<NoticeVO> selectNotice(PagingVO vo);
}
