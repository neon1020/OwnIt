package com.teamone.ownit.vo;

public class ReviewVO {
	private int review_idx;
	private int product_idx;
	private int member_idx;
	private String review_subject;
	private String review_content;
	private int review_reply_count;
	private String review_date;
	
	// 기본 생성자
	public ReviewVO() {}

	// 파라미터 생성자
	public ReviewVO(int review_idx, int product_idx, int member_idx, String review_subject, String review_content,
			int review_reply_count, String review_date) {
		super();
		this.review_idx = review_idx;
		this.product_idx = product_idx;
		this.member_idx = member_idx;
		this.review_subject = review_subject;
		this.review_content = review_content;
		this.review_reply_count = review_reply_count;
		this.review_date = review_date;
	}

	// Getter & Setter
	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getReview_subject() {
		return review_subject;
	}

	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getReview_reply_count() {
		return review_reply_count;
	}

	public void setReview_reply_count(int review_reply_count) {
		this.review_reply_count = review_reply_count;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	// toString 오버라이딩
	@Override
	public String toString() {
		return "ReviewVO [review_idx=" + review_idx + ", product_idx=" + product_idx + ", member_idx=" + member_idx
				+ ", review_subject=" + review_subject + ", review_content=" + review_content + ", review_reply_count="
				+ review_reply_count + ", review_date=" + review_date + "]";
	}
}
