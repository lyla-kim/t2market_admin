package kr.co.T2Market.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

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
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public void regiser(NoticeVO notice) {
		// TODO Auto-generated method stub
		mapper.insert(notice);
	}

	@Override
	public NoticeVO get(Long notice_no) {
		// TODO Auto-generated method stub
		return mapper.read(notice_no);
	}

	@Override
	public boolean modify(NoticeVO notice) {
		// TODO Auto-generated method stub
		return mapper.update(notice) == 1;
	}

}
