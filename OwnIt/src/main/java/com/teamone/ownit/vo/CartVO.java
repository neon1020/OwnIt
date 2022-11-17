package com.teamone.ownit.vo;

public class CartVO {
	private int member_idx;
	private int product_idx;
	private int cart_count;
	private String cart_date;
	private String image_real_file1;
	private String product_name;
	private String product_color;
	private String product_buy_price;
	private String countTimesPrice;
	
	// 기본 생성자
	public CartVO() {}

	// 파라미터 생성자
	public CartVO(int member_idx, int product_idx, int cart_count, String cart_date, String image_real_file1,
			String product_name, String product_color, String product_buy_price, String countTimesPrice) {
		super();
		this.member_idx = member_idx;
		this.product_idx = product_idx;
		this.cart_count = cart_count;
		this.cart_date = cart_date;
		this.image_real_file1 = image_real_file1;
		this.product_name = product_name;
		this.product_color = product_color;
		this.product_buy_price = product_buy_price;
		this.countTimesPrice = countTimesPrice;
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

	public String getCart_date() {
		return cart_date;
	}

	public void setCart_date(String cart_date) {
		this.cart_date = cart_date;
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

	public String getProduct_color() {
		return product_color;
	}

	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}

	public String getProduct_buy_price() {
		return product_buy_price;
	}

	public void setProduct_buy_price(String product_buy_price) {
		this.product_buy_price = product_buy_price;
	}

	public String getCountTimesPrice() {
		return countTimesPrice;
	}

	public void setCountTimesPrice(String countTimesPrice) {
		this.countTimesPrice = countTimesPrice;
	}

	// toString 오버라이딩
	@Override
	public String toString() {
		return "CartVO [member_idx=" + member_idx + ", product_idx=" + product_idx + ", cart_count=" + cart_count
				+ ", cart_date=" + cart_date + ", image_real_file1=" + image_real_file1 + ", product_name="
				+ product_name + ", product_color=" + product_color + ", product_buy_price=" + product_buy_price
				+ ", countTimesPrice=" + countTimesPrice + "]";
	}
	
}
