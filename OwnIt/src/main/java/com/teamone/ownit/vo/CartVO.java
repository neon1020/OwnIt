package com.teamone.ownit.vo;

public class CartVO {
	private int member_idx;
	private int product_idx;
	private int cart_count;
	
	// 기본 생성자
	public CartVO() {}

	// 파라미터 생성자
	public CartVO(int member_idx, int product_idx, int cart_count) {
		super();
		this.member_idx = member_idx;
		this.product_idx = product_idx;
		this.cart_count = cart_count;
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

	public int getCart_count() {
		return cart_count;
	}

	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}

	// toString 오버라이딩
	@Override
	public String toString() {
		return "CartVO [member_idx=" + member_idx + ", product_idx=" + product_idx + ", cart_count=" + cart_count + "]";
	}
}
