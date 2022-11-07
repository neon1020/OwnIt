package com.teamone.ownit.vo;

public class WishlistVO {
	private int member_idx;
	private int product_idx;
	
	// 기본 생성자
	public WishlistVO() {}

	// 파라미터 생성자
	public WishlistVO(int member_idx, int product_idx) {
		super();
		this.member_idx = member_idx;
		this.product_idx = product_idx;
	}

	// Getter & Setter
	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	// toString 오버라이딩
	@Override
	public String toString() {
		return "WishlistVO [member_idx=" + member_idx + ", product_idx=" + product_idx + "]";
	}
}
