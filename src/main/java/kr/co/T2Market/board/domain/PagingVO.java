package kr.co.T2Market.board.domain;

import lombok.Data;

@Data
public class PagingVO {

	//?˜„?¬?˜?´ì§?, ?‹œ?‘?˜?´ì§?, ??˜?´ì§?, ê²Œì‹œê¸? ì´? ê°??ˆ˜, ?˜?´ì§??‹¹ ê¸? ê°??ˆ˜, ë§ˆì?ë§‰í˜?´ì§?, SQLì¿¼ë¦¬?— ?“¸ start, end
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
	private int cntPage=5;
	
	public PagingVO() {}	
	
	public PagingVO(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calLastPage(getTotal(), getCntPerPage());
		calStartEndPage(getNowPage(), cntPage);
		calStartEnd(getNowPage(), getCntPerPage());
	}
	
	//? œ?¼ ë§ˆì?ë§‰í˜?´ì§? ê³„ì‚°
	public void calLastPage(int total, int cntPerPage) {
		setLastPage((int)Math.ceil((double)total / (double)cntPerPage));
	}
	
	//?‹œ?‘, ? ?˜?´ì§? ê³„ì‚°
	public void calStartEndPage(int nowPage, int cntPage) {
		setEndPage((int)Math.ceil((double)nowPage / (double)cntPage)*cntPage);
		if(getLastPage()<getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage()-cntPage+1);
		if(getStartPage()<1) {
			setStartPage(1);
		}
	}
	
	// DB ì¿¼ë¦¬?—?„œ ?‚¬?š©?•  start, endê°? ê³„ì‚°
	public void calStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage*cntPerPage);
		setStart(getEnd()-cntPerPage+1);
	}
	
}
