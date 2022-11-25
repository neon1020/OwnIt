package com.teamone.ownit.vo;

public class MypageMainVO {
	private int member_idx;
	private String member_id;
	private String member_name;
	private String member_nickname;
	private String member_image;
	private String image_real_file1;
	private String product_idx;
	private String product_name;
	private String product_image;
	private String product_sell_price;
	private String product_buy_price;
	private String order_sell_idx;
	private String order_sell_gb;
	private String order_sell_date;
	private String order_buy_idx;
	private String order_buy_gb;
	private String order_buy_date;
	
	// 기본 생성자
	public MypageMainVO() {}

	// 파라미터 생성자
	public MypageMainVO(int member_idx, String member_id, String member_name, String member_nickname,
			String member_image, String image_real_file1, String product_idx, String product_name, String product_image,
			String product_sell_price, String product_buy_price, String order_sell_idx, String order_sell_gb,
			String order_sell_date, String order_buy_idx, String order_buy_gb, String order_buy_date) {
		super();
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_nickname = member_nickname;
		this.member_image = member_image;
		this.image_real_file1 = image_real_file1;
		this.product_idx = product_idx;
		this.product_name = product_name;
		this.product_image = product_image;
		this.product_sell_price = product_sell_price;
		this.product_buy_price = product_buy_price;
		this.order_sell_idx = order_sell_idx;
		this.order_sell_gb = order_sell_gb;
		this.order_sell_date = order_sell_date;
		this.order_buy_idx = order_buy_idx;
		this.order_buy_gb = order_buy_gb;
		this.order_buy_date = order_buy_date;
	}

	// Getter & Setter
	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getMember_image() {
		return member_image;
	}

	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}

	public String getImage_real_file1() {
		return image_real_file1;
	}

	public void setImage_real_file1(String image_real_file1) {
		this.image_real_file1 = image_real_file1;
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

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public String getProduct_sell_price() {
		return product_sell_price;
	}

	public void setProduct_sell_price(String product_sell_price) {
		this.product_sell_price = product_sell_price;
	}

	public String getProduct_buy_price() {
		return product_buy_price;
	}

	public void setProduct_buy_price(String product_buy_price) {
		this.product_buy_price = product_buy_price;
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

	public String getOrder_buy_idx() {
		return order_buy_idx;
	}

	public void setOrder_buy_idx(String order_buy_idx) {
		this.order_buy_idx = order_buy_idx;
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

	// toString 오버라이딩
	@Override
	public String toString() {
		return "MypageMainVO [member_idx=" + member_idx + ", member_id=" + member_id + ", member_name=" + member_name
				+ ", member_nickname=" + member_nickname + ", member_image=" + member_image + ", image_real_file1="
				+ image_real_file1 + ", product_idx=" + product_idx + ", product_name=" + product_name
				+ ", product_image=" + product_image + ", product_sell_price=" + product_sell_price
				+ ", product_buy_price=" + product_buy_price + ", order_sell_idx=" + order_sell_idx + ", order_sell_gb="
				+ order_sell_gb + ", order_sell_date=" + order_sell_date + ", order_buy_idx=" + order_buy_idx
				+ ", order_buy_gb=" + order_buy_gb + ", order_buy_date=" + order_buy_date + "]";
	}


	
	
	
}
