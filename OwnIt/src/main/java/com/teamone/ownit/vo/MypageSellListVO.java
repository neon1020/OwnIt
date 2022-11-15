package com.teamone.ownit.vo;

public class MypageSellListVO {
	private int member_idx;
	private String image_original_file1;
	private String product_idx;
	private String product_name;
	private String product_sell_price;
	private String order_sell_idx;
	private String order_sell_gb;
	private String order_sell_date;
	
	// 기본 생성자
	public MypageSellListVO() {}

	// 파라미터 생성자
	public MypageSellListVO(int member_idx, String image_original_file1, String product_idx, String product_name,
			String product_sell_price, String order_sell_idx, String order_sell_gb, String order_sell_date) {
		super();
		this.member_idx = member_idx;
		this.image_original_file1 = image_original_file1;
		this.product_idx = product_idx;
		this.product_name = product_name;
		this.product_sell_price = product_sell_price;
		this.order_sell_idx = order_sell_idx;
		this.order_sell_gb = order_sell_gb;
		this.order_sell_date = order_sell_date;
	}

	// Getter & Setter
	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getImage_original_file1() {
		return image_original_file1;
	}

	public void setImage_original_file1(String image_original_file1) {
		this.image_original_file1 = image_original_file1;
	}

	public String getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_sell_price() {
		return product_sell_price;
	}

	public void setProduct_sell_price(String product_sell_price) {
		this.product_sell_price = product_sell_price;
	}

	public String getOrder_sell_idx() {
		return order_sell_idx;
	}

	public void setOrder_sell_idx(String order_sell_idx) {
		this.order_sell_idx = order_sell_idx;
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

	// toString 오버라이딩
	@Override
	public String toString() {
		return "MypageSellListVO [member_idx=" + member_idx + ", image_original_file1=" + image_original_file1
				+ ", product_idx=" + product_idx + ", product_name=" + product_name + ", product_sell_price="
				+ product_sell_price + ", order_sell_idx=" + order_sell_idx + ", order_sell_gb=" + order_sell_gb
				+ ", order_sell_date=" + order_sell_date + "]";
	}


	


	
	
	
}
