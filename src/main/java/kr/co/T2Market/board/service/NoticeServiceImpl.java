package kr.co.T2Market.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.T2Market.board.domain.Criteria;
import kr.co.T2Market.board.domain.NoticeVO;
import kr.co.T2Market.board.mapper.NoticeMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> getList() {
		return mapper.getList();
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
	public List<NoticeVO> getList(Criteria cri) {
		log.info("get List With criteria"+cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotal count");
		return mapper.getTotalCount(cri);
	}

}
