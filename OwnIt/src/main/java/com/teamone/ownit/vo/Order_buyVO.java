package com.teamone.ownit.vo;

public class Order_buyVO {
	private int order_buy_idx;
	private int product_idx;
	private int member_idx;
	private String order_buy_gb;
	private String order_buy_date;
	
	// 기본 생성자
	public Order_buyVO() {}

	public Order_buyVO(int order_buy_idx, int product_idx, int member_idx, String order_buy_gb, String order_buy_date) {
		super();
		this.order_buy_idx = order_buy_idx;
		this.product_idx = product_idx;
		this.member_idx = member_idx;
		this.order_buy_gb = order_buy_gb;
		this.order_buy_date = order_buy_date;
	}

	public int getOrder_buy_idx() {
		return order_buy_idx;
	}

	public void setOrder_buy_idx(int order_buy_idx) {
		this.order_buy_idx = order_buy_idx;
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

	public String getOrder_buy_gb() {
		return order_buy_gb;
	}

	public void setOrder_buy_gb(String order_buy_gb) {
		this.order_buy_gb = order_buy_gb;
	}

	public String getOrder_buy_date() {
		return order_buy_date;
	}

	public void setOrder_buy_date(String order_buy_date) {
		this.order_buy_date = order_buy_date;
	}

	@Override
	public String toString() {
		return "Order_buyVO [order_buy_idx=" + order_buy_idx + ", product_idx=" + product_idx + ", member_idx="
				+ member_idx + ", order_buy_gb=" + order_buy_gb + ", order_buy_date=" + order_buy_date + "]";
	}
	
	
	
}
