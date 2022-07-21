package kr.co.T2Market.code.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.T2Market.code.domain.CodeVO;
import kr.co.T2Market.code.domain.PagingVO;
import kr.co.T2Market.code.mapper.CodeMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CodeServiceImpl implements CodeService {
	
	@Setter(onMethod_ = @Autowired)
	private CodeMapper mapper;

	@Override
	public List<CodeVO> codeList() {
		// TODO Auto-generated method stub
		log.info("codeList....");
		
		return mapper.getCodeList();
	}

	@Override
	public int countCode(PagingVO vo) {
		// TODO Auto-generated method stub
		log.info("countCode");
		return mapper.countCode(vo);
	}

	@Override
	public List<CodeVO> selectCode(PagingVO vo) {
		// TODO Auto-generated method stub
		log.info("selectCode...");
		return mapper.selectCode(vo);
	}

	@Override
	public CodeVO readCode(String code_no) {
		// TODO Auto-generated method stub
		log.info("readCode:"+code_no);
		return mapper.readCode(code_no);
	}

	@Override
	public void updateCode(CodeVO code) {
		// TODO Auto-generated method stub
		log.info("updateCode: "+code);
		mapper.updateCode(code);

	}
	
	@Override
	public void register(CodeVO code) {
		log.info("insertCode: "+code);
		mapper.insertCode(code);
	}

}
