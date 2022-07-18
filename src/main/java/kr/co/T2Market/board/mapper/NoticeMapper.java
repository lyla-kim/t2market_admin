package kr.co.T2Market.board.mapper;

import java.util.List;

import kr.co.T2Market.board.domain.NoticeVO;
import kr.co.T2Market.board.domain.PagingVO;

public interface NoticeMapper {

	public List<NoticeVO> getList();
	
	public void insert(NoticeVO notice);
	
	public NoticeVO read(Long noticeNo);

	public int update(NoticeVO notice);
	
	public int countReciept();
	
	public List<NoticeVO> selectNotice(PagingVO vo);
}