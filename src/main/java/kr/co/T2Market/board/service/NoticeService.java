package kr.co.T2Market.board.service;

import java.util.List;

import kr.co.T2Market.board.domain.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> getList();
	
	public void regiser(NoticeVO notice);
	
	public NoticeVO get(Long notice_no);
	
	public boolean modify(NoticeVO notice);
}
