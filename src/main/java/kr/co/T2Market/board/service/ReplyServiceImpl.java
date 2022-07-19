package kr.co.T2Market.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.T2Market.board.domain.PagingVO;
import kr.co.T2Market.board.domain.ReplyVO;
import kr.co.T2Market.board.mapper.ReplyMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public List<ReplyVO> get(String answer_no) {
		return mapper.read(answer_no);
	}

	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int remove(ReplyVO vo) {
		return mapper.delete(vo);
	}

	@Override
	public int countReply() {
		return mapper.countReply();
	}

	@Override
	public List<ReplyVO> getList(PagingVO pag, String qna_no) {
		return mapper.getListWithPaging(pag, qna_no);
	}

	@Override
	public ReplyVO selectReply(String answer_no) {
		return mapper.selectReply(answer_no);
	}
}
