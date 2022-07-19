package kr.co.T2Market.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.T2Market.board.domain.PagingVO;
import kr.co.T2Market.board.domain.QnAVO;
import kr.co.T2Market.board.mapper.QnAMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class QnAServiceImpl implements QnAService {
	@Setter(onMethod_ = @Autowired)
	private QnAMapper mapper;

	@Override
	public List<QnAVO> getList() {

		List<QnAVO> list = mapper.getList();
		log.info("notice list..."+list);
		
		return list;
	}

	@Override
	public QnAVO get(String qna_no) {
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

	@Override
	public void updateReplyCount(String qnaNo) {
		mapper.updateReplyCount(qnaNo);
	}
}
