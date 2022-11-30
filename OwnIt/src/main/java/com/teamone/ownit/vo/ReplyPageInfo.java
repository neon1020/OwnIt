package com.teamone.ownit.vo;

// 페이징 처리를 위한 정보를 저장할 PageInfo 클래스
public class ReplyPageInfo {
	private int replyListNum; // 현재 페이지 번호
	private int listLimit; // 페이지 당 게시물 목록 갯수
	private int listCount; // 총 게시물 수
	private int pageListLimit; // 페이지 당 표시할 페이지 번호 수
	private int maxPage; // 전체 페이지 수
	private int startPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	
	public ReplyPageInfo() {}

	public ReplyPageInfo(int pageNum, int listLimit, int listCount, int pageListLimit, int maxPage, int startPage, int endPage) {
		this.replyListNum = pageNum;
		this.listLimit = listLimit;
		this.listCount = listCount;
		this.pageListLimit = pageListLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getReplyListNum() {
		return replyListNum;
	}

	public void setReplyListNum(int replyListNum) {
		this.replyListNum = replyListNum;
	}

	public int getListLimit() {
		return listLimit;
	}

	public void setListLimit(int listLimit) {
		this.listLimit = listLimit;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getPageListLimit() {
		return pageListLimit;
	}

	public void setPageListLimit(int pageListLimit) {
		this.pageListLimit = pageListLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [replyListNum=" + replyListNum + ", listLimit=" + listLimit + ", listCount=" + listCount
				+ ", pageListLimit=" + pageListLimit + ", maxPage=" + maxPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + "]";
	}
	
}




