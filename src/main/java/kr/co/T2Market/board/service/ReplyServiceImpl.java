package kr.co.T2Market.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.T2Market.board.domain.ReplyVO;
import kr.co.T2Market.board.mapper.ReplyMapper;
import kr.co.T2Market.reciept.domain.PagingVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	private ReplyMapper mapper;
	
	@Override
	public void regiser(ReplyVO reply) {
		mapper.insert(reply);

	}

	@Override
	public ReplyVO get(Long reply_no) {
		return mapper.read(reply_no);
	}

	@Override
	public boolean modify(ReplyVO reply) {
		return mapper.update(reply) == 1;
	}

	@Override
	public boolean remove(Long reply_no) {
		log.info("remove...."+reply_no);
		
		return mapper.delete(reply_no);
	}

	@Override
	public int countReciept() {
		log.info("countReciept....");
		return mapper.countReciept();
	}

	@Override
	public List<ReplyVO> selectReply(PagingVO vo) {
		log.info("selectReciept....");
		return mapper.selectReply(vo);
	}

}
