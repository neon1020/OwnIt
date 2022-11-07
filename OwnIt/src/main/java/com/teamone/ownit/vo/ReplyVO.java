package com.teamone.ownit.vo;

public class ReplyVO {
	private int review_idx;
	private int member_idx;
	private String reply_content;
	private int reply_re_ref;
	private int reply_re_lev;
	private int reply_re_seq;
	private String reply_date;
	
	// 기본 생성자
	public ReplyVO() {}

	// 파라미터 생성자
	public ReplyVO(int review_idx, int member_idx, String reply_content, int reply_re_ref, int reply_re_lev,
			int reply_re_seq, String reply_date) {
		super();
		this.review_idx = review_idx;
		this.member_idx = member_idx;
		this.reply_content = reply_content;
		this.reply_re_ref = reply_re_ref;
		this.reply_re_lev = reply_re_lev;
		this.reply_re_seq = reply_re_seq;
		this.reply_date = reply_date;
	}

	// Getter & Setter
	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public int getReply_re_ref() {
		return reply_re_ref;
	}

	public void setReply_re_ref(int reply_re_ref) {
		this.reply_re_ref = reply_re_ref;
	}

	public int getReply_re_lev() {
		return reply_re_lev;
	}

	public void setReply_re_lev(int reply_re_lev) {
		this.reply_re_lev = reply_re_lev;
	}

	public int getReply_re_seq() {
		return reply_re_seq;
	}

	public void setReply_re_seq(int reply_re_seq) {
		this.reply_re_seq = reply_re_seq;
	}

	public String getReply_date() {
		return reply_date;
	}

	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}

	// toString 오버라이딩
	@Override
	public String toString() {
		return "ReplyVO [review_idx=" + review_idx + ", member_idx=" + member_idx + ", reply_content=" + reply_content
				+ ", reply_re_ref=" + reply_re_ref + ", reply_re_lev=" + reply_re_lev + ", reply_re_seq=" + reply_re_seq
				+ ", reply_date=" + reply_date + "]";
	}
}
