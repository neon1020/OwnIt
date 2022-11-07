package com.teamone.ownit.vo;

public class Member_buyVO {
	private int member_buy_idx;
	private int product_idx;
	private int member_idx;
	private String member_buy_gb;
	private String member_buy_date;
	
	// 기본 생성자
	public Member_buyVO() {}

	// 파라미터 생성자
	public Member_buyVO(int member_buy_idx, int product_idx, int member_idx, String member_buy_gb,
			String member_buy_date) {
		super();
		this.member_buy_idx = member_buy_idx;
		this.product_idx = product_idx;
		this.member_idx = member_idx;
		this.member_buy_gb = member_buy_gb;
		this.member_buy_date = member_buy_date;
	}

	// Getter & Setter
	public int getMember_buy_idx() {
		return member_buy_idx;
	}

	public void setMember_buy_idx(int member_buy_idx) {
		this.member_buy_idx = member_buy_idx;
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

	public String getMember_buy_gb() {
		return member_buy_gb;
	}

	public void setMember_buy_gb(String member_buy_gb) {
		this.member_buy_gb = member_buy_gb;
	}

	public String getMember_buy_date() {
		return member_buy_date;
	}

	public void setMember_buy_date(String member_buy_date) {
		this.member_buy_date = member_buy_date;
	}

	// toString 오버라이딩
	@Override
	public String toString() {
		return "Member_buyVO [member_buy_idx=" + member_buy_idx + ", product_idx=" + product_idx + ", member_idx="
				+ member_idx + ", member_buy_gb=" + member_buy_gb + ", member_buy_date=" + member_buy_date + "]";
	}
}
