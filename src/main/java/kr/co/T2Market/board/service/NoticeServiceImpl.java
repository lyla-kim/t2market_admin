package kr.co.T2Market.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.T2Market.board.domain.NoticeVO;
import kr.co.T2Market.board.mapper.NoticeMapper;
import kr.co.T2Market.reciept.domain.PagingVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> getList() {
		
		List<NoticeVO> list = mapper.getList();
		log.info("notice list..."+list);
		
		return list;
	}

	@Override
	public void regiser(NoticeVO notice) {
		mapper.insert(notice);
	}

	@Override
	public NoticeVO get(Long notice_no) {
		return mapper.read(notice_no);
	}

	@Override
	public boolean modify(NoticeVO notice) {
		return mapper.update(notice) == 1;
	}
	
	@Override
	public int countReciept() {
		log.info("countReciept....");
		return mapper.countReciept();
	};
		
	@Override
	public List<NoticeVO> selectNotice(PagingVO vo){
		log.info("selectReciept....");
		return mapper.selectNotice(vo);
	};
}
