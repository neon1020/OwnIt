package com.teamone.ownit.vo;

public class NoticeVO {
	private int notice_idx;
	private String notice_category;
	private String notice_subject;
	private String notice_content;
	private int notice_readcount;
	private String notice_date;
	
	// 기본 생성자
	public NoticeVO() {}

	// 파라미터 생성자
	public NoticeVO(int notice_idx, String notice_category, String notice_subject, String notice_content,
			int notice_readcount, String notice_date) {
		super();
		this.notice_idx = notice_idx;
		this.notice_category = notice_category;
		this.notice_subject = notice_subject;
		this.notice_content = notice_content;
		this.notice_readcount = notice_readcount;
		this.notice_date = notice_date;
	}

	// Getter & Setter
	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public String getNotice_category() {
		return notice_category;
	}

	public void setNotice_category(String notice_category) {
		this.notice_category = notice_category;
	}

	public String getNotice_subject() {
		return notice_subject;
	}

	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public int getNotice_readcount() {
		return notice_readcount;
	}

	public void setNotice_readcount(int notice_readcount) {
		this.notice_readcount = notice_readcount;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

	// toString 오버라이딩
	@Override
	public String toString() {
		return "NoticeVO [notice_idx=" + notice_idx + ", notice_category=" + notice_category + ", notice_subject="
				+ notice_subject + ", notice_content=" + notice_content + ", notice_readcount=" + notice_readcount
				+ ", notice_date=" + notice_date + "]";
	}
}
