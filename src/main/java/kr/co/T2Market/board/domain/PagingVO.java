package kr.co.T2Market.board.domain;

import lombok.Data;

@Data
public class PagingVO {

	//??¬??΄μ§?, ????΄μ§?, ???΄μ§?, κ²μκΈ? μ΄? κ°??, ??΄μ§??Ή κΈ? κ°??, λ§μ?λ§ν?΄μ§?, SQLμΏΌλ¦¬? ?Έ start, end
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
	
	//? ?Ό λ§μ?λ§ν?΄μ§? κ³μ°
	public void calLastPage(int total, int cntPerPage) {
		setLastPage((int)Math.ceil((double)total / (double)cntPerPage));
	}
	
	//??, ? ??΄μ§? κ³μ°
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
	
	// DB μΏΌλ¦¬?? ?¬?©?  start, endκ°? κ³μ°
	public void calStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage*cntPerPage);
		setStart(getEnd()-cntPerPage+1);
	}
	
}
