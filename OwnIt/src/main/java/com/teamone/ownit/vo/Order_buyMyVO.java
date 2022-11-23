package com.teamone.ownit.vo;

public class Order_buyMyVO {
	private int order_buy_idx;
	private int product_idx;
	private int member_idx;
	private String order_buy_gb;
	private String order_buy_date;
	private String image_real_file1;
	private String product_name;
	private String product_buy_price;
	
	public Order_buyMyVO() {}

	public Order_buyMyVO(int order_buy_idx, int product_idx, int member_idx, String order_buy_gb, String order_buy_date,
			String image_real_file1, String product_name, String product_buy_price) {
		super();
		this.order_buy_idx = order_buy_idx;
		this.product_idx = product_idx;
		this.member_idx = member_idx;
		this.order_buy_gb = order_buy_gb;
		this.order_buy_date = order_buy_date;
		this.image_real_file1 = image_real_file1;
		this.product_name = product_name;
		this.product_buy_price = product_buy_price;
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

	public String getImage_real_file1() {
		return image_real_file1;
	}

	public void setImage_real_file1(String image_real_file1) {
		this.image_real_file1 = image_real_file1;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_buy_price() {
		return product_buy_price;
	}

	public void setProduct_buy_price(String product_buy_price) {
		this.product_buy_price = product_buy_price;
	}

	@Override
	public String toString() {
		return "Order_buyMyVO [order_buy_idx=" + order_buy_idx + ", product_idx=" + product_idx + ", member_idx="
				+ member_idx + ", order_buy_gb=" + order_buy_gb + ", order_buy_date=" + order_buy_date
				+ ", image_real_file1=" + image_real_file1 + ", product_name=" + product_name + ", product_buy_price="
				+ product_buy_price + "]";
	}
}
