package kr.co.T2Market.board.domain;

import lombok.Data;

@Data
public class PagingVO {

	//?��?��?��?���?, ?��?��?��?���?, ?��?��?���?, 게시�? �? �??��, ?��?���??�� �? �??��, 마�?막페?���?, SQL쿼리?�� ?�� start, end
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
	
	//?��?�� 마�?막페?���? 계산
	public void calLastPage(int total, int cntPerPage) {
		setLastPage((int)Math.ceil((double)total / (double)cntPerPage));
	}
	
	//?��?��, ?�� ?��?���? 계산
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
	
	// DB 쿼리?��?�� ?��?��?�� start, end�? 계산
	public void calStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage*cntPerPage);
		setStart(getEnd()-cntPerPage+1);
	}
	
}
