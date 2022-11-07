package com.teamone.ownit.vo;

public class Member_sellVO {
	private int member_sell_idx;
	private int product_idx;
	private int member_idx;
	private int account_idx;
	private String member_sell_gb;
	private String member_sell_date;
	
	// 기본 생성자
	public Member_sellVO() {}

	// 파라미터 생성자
	public Member_sellVO(int member_sell_idx, int product_idx, int member_idx, int account_idx, String member_sell_gb,
			String member_sell_date) {
		super();
		this.member_sell_idx = member_sell_idx;
		this.product_idx = product_idx;
		this.member_idx = member_idx;
		this.account_idx = account_idx;
		this.member_sell_gb = member_sell_gb;
		this.member_sell_date = member_sell_date;
	}

	// Getter & Setter
	public int getMember_sell_idx() {
		return member_sell_idx;
	}

	public void setMember_sell_idx(int member_sell_idx) {
		this.member_sell_idx = member_sell_idx;
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

	public int getAccount_idx() {
		return account_idx;
	}

	public void setAccount_idx(int account_idx) {
		this.account_idx = account_idx;
	}

	public String getMember_sell_gb() {
		return member_sell_gb;
	}

	public void setMember_sell_gb(String member_sell_gb) {
		this.member_sell_gb = member_sell_gb;
	}

	public String getMember_sell_date() {
		return member_sell_date;
	}

	public void setMember_sell_date(String member_sell_date) {
		this.member_sell_date = member_sell_date;
	}

	// toString 오버라이딩
	@Override
	public String toString() {
		return "Member_sellVO [member_sell_idx=" + member_sell_idx + ", product_idx=" + product_idx + ", member_idx="
				+ member_idx + ", account_idx=" + account_idx + ", member_sell_gb=" + member_sell_gb
				+ ", member_sell_date=" + member_sell_date + "]";
	}
}
