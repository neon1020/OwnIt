package com.teamone.ownit.vo;

public class ReplyVO {
	private int reply_idx;
	private int review_idx;
	private int member_idx;
	private int notice_idx;
	private String reply_content;
	private int reply_re_ref;
	private int reply_re_lev;
	private int reply_re_seq;
	private String reply_date;
	private String image_real_file1;
	private String member_nickname;
	
	public ReplyVO() {}

	public ReplyVO(int reply_idx, int review_idx, int member_idx, int notice_idx, String reply_content,
			int reply_re_ref, int reply_re_lev, int reply_re_seq, String reply_date, String image_real_file1,
			String member_nickname) {
		super();
		this.reply_idx = reply_idx;
		this.review_idx = review_idx;
		this.member_idx = member_idx;
		this.notice_idx = notice_idx;
		this.reply_content = reply_content;
		this.reply_re_ref = reply_re_ref;
		this.reply_re_lev = reply_re_lev;
		this.reply_re_seq = reply_re_seq;
		this.reply_date = reply_date;
		this.image_real_file1 = image_real_file1;
		this.member_nickname = member_nickname;
	}

	public int getReply_idx() {
		return reply_idx;
	}

	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}

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

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
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

	public String getImage_real_file1() {
		return image_real_file1;
	}

	public void setImage_real_file1(String image_real_file1) {
		this.image_real_file1 = image_real_file1;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	@Override
	public String toString() {
		return "ReplyVO [reply_idx=" + reply_idx + ", review_idx=" + review_idx + ", member_idx=" + member_idx
				+ ", notice_idx=" + notice_idx + ", reply_content=" + reply_content + ", reply_re_ref=" + reply_re_ref
				+ ", reply_re_lev=" + reply_re_lev + ", reply_re_seq=" + reply_re_seq + ", reply_date=" + reply_date
				+ ", image_real_file1=" + image_real_file1 + ", member_nickname=" + member_nickname + "]";
	}

}
