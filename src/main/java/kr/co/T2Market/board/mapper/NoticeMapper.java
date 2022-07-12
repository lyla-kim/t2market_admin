package kr.co.T2Market.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.T2Market.board.domain.Criteria;
import kr.co.T2Market.board.domain.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> getList();
	
	public void insert(NoticeVO notice);
	
	public NoticeVO read(Long noticeNo);

	public int update(NoticeVO notice);
	
	public List<NoticeVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}