package com.teamone.ownit.vo;

public class Style_like_listVO {
	private int member_idx;
	private int review_idx;
	
	// 기본 생성자
	public Style_like_listVO() {}

	// 파라미터 생성자
	public Style_like_listVO(int member_idx, int review_idx) {
		super();
		this.member_idx = member_idx;
		this.review_idx = review_idx;
	}

	// Getter & Setter
	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}

	// toString 오버라이딩
	@Override
	public String toString() {
		return "Style_like_listVO [member_idx=" + member_idx + ", review_idx=" + review_idx + "]";
	}
}
