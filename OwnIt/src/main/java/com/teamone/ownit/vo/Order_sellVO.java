package com.teamone.ownit.vo;

public class Order_sellVO {
	private int order_sell_idx;
	private int product_idx;
	private int member_idx;
	private int account_idx;
	private String order_sell_gb;
	private String order_sell_date;
	
	// 기본 생성자
	public Order_sellVO() {}

	public Order_sellVO(int order_sell_idx, int product_idx, int member_idx, int account_idx, String order_sell_gb,
			String order_sell_date) {
		super();
		this.order_sell_idx = order_sell_idx;
		this.product_idx = product_idx;
		this.member_idx = member_idx;
		this.account_idx = account_idx;
		this.order_sell_gb = order_sell_gb;
		this.order_sell_date = order_sell_date;
	}

	public int getOrder_sell_idx() {
		return order_sell_idx;
	}

	public void setOrder_sell_idx(int order_sell_idx) {
		this.order_sell_idx = order_sell_idx;
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

	public String getOrder_sell_gb() {
		return order_sell_gb;
	}

	public void setOrder_sell_gb(String order_sell_gb) {
		this.order_sell_gb = order_sell_gb;
	}

	public String getOrder_sell_date() {
		return order_sell_date;
	}

	public void setOrder_sell_date(String order_sell_date) {
		this.order_sell_date = order_sell_date;
	}

	@Override
	public String toString() {
		return "Order_sellVO [order_sell_idx=" + order_sell_idx + ", product_idx=" + product_idx + ", member_idx="
				+ member_idx + ", account_idx=" + account_idx + ", order_sell_gb=" + order_sell_gb
				+ ", order_sell_date=" + order_sell_date + "]";
	}

	
	
}
