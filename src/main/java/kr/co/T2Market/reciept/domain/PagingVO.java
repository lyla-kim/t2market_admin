package kr.co.T2Market.reciept.domain;

import lombok.Data;

@Data
public class PagingVO {

	//현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
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
	
	//제일 마지막페이지 계산
	public void calLastPage(int total, int cntPerPage) {
		setLastPage((int)Math.ceil((double)total / (double)cntPerPage));
	}
	
	//시작, 끝 페이지 계산
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
	
	// DB 쿼리에서 사용할 start, end값 계산
	public void calStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage*cntPerPage);
		setStart(getEnd()-cntPerPage+1);
	}
	
}
