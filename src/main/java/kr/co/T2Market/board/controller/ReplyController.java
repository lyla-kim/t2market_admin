package kr.co.T2Market.board.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.T2Market.board.domain.PagingVO;
import kr.co.T2Market.board.domain.ReplyVO;
import kr.co.T2Market.board.service.ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		log.info("ReplyVO:"+vo);
		
		int insertCount = service.register(vo);
		
		log.info("Reply Insert Count:"+insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{qna_no}/{nowPage}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<PagingVO> getList(@PathVariable("nowPage") Long nowPage, @PathVariable("qna_no") Long qna_no){
		PagingVO pag = new PagingVO(page, 10);
		
		log.info(pag);		
		
		return new ResponseEntity<>(service.getList(page, qna_no), HttpStatus.OK); //?
	}
	
	@GetMapping(value="/{answer_no}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("answer_no") Long answer_no){
		log.info("get:"+answer_no);
		
		return new ResponseEntity<>(service.get(answer_no), HttpStatus.OK);
	}
	
	@PreAuthorize("principal.username == #vo.replyer") //?
	@DeleteMapping(value="/{answer_no}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("answer_no") Long answer_no){
		log.info("remove:"+answer_no);
		
		return service.remove(answer_no) ==1
				? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("principal.username == #vo.replyer")  //?
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{answer_no}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(
			 @RequestBody ReplyVO vo, 
			 @PathVariable("answer_no") Long answer_no) {

		vo.setAnswer_no(answer_no);

		log.info("answer_no: " + answer_no);
		log.info("modify: " + vo);

		return service.modify(vo) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	

}
