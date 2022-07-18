package kr.co.T2Market.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.T2Market.board.domain.PagingVO;
import kr.co.T2Market.board.domain.QnAVO;
import kr.co.T2Market.board.mapper.QnAMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class QnAServiceImpl implements QnAService {
	
	private QnAMapper mapper;

	@Override
	public List<QnAVO> getList() {

		List<QnAVO> list = mapper.getList();
		log.info("notice list..."+list);
		
		return list;
	}

	@Override
	public QnAVO get(Long qna_no) {
		return mapper.read(qna_no);
	}

	@Override
	public int countReciept() {
		log.info("countReciept....");
		return mapper.countReciept();
	}

	@Override
	public List<QnAVO> selectQnA(PagingVO vo) {
		log.info("selectReciept....");
		return mapper.selectQnA(vo);
	}

}
