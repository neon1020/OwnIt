package com.teamone.ownit.vo;

public class ProductVO {
	private int product_idx;
	private String product_type;
	private String product_brand;
	private String product_name;
	private String product_model_num;
	private String product_color;
	private String product_release_price;
	private String product_sell_price;
	private String product_buy_price;
	private int product_left_count;
	private int product_sell_count;
	private String product_date;
	private String image_real_file1;
	private String image_real_file2;
	private String image_real_file3;
	private int my_wish;
	
	// 기본 생성자
	public ProductVO() {}

	// 파라미터 생성자
	public ProductVO(int product_idx, String product_type, String product_brand, String product_name,
			String product_model_num, String product_color, String product_release_price, String product_sell_price,
			String product_buy_price, int product_left_count, int product_sell_count, String product_date,
			String image_real_file1, String image_real_file2, String image_real_file3, int my_wish) {
		super();
		this.product_idx = product_idx;
		this.product_type = product_type;
		this.product_brand = product_brand;
		this.product_name = product_name;
		this.product_model_num = product_model_num;
		this.product_color = product_color;
		this.product_release_price = product_release_price;
		this.product_sell_price = product_sell_price;
		this.product_buy_price = product_buy_price;
		this.product_left_count = product_left_count;
		this.product_sell_count = product_sell_count;
		this.product_date = product_date;
		this.image_real_file1 = image_real_file1;
		this.image_real_file2 = image_real_file2;
		this.image_real_file3 = image_real_file3;
		this.my_wish = my_wish;
	}

	// Getter & Setter
	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public String getProduct_type() {
		return product_type;
	}

	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}

	public String getProduct_brand() {
		return product_brand;
	}

	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_model_num() {
		return product_model_num;
	}

	public void setProduct_model_num(String product_model_num) {
		this.product_model_num = product_model_num;
	}

	public String getProduct_color() {
		return product_color;
	}

	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}

	public String getProduct_release_price() {
		return product_release_price;
	}

	public void setProduct_release_price(String product_release_price) {
		this.product_release_price = product_release_price;
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

	public int getProduct_left_count() {
		return product_left_count;
	}

	public void setProduct_left_count(int product_left_count) {
		this.product_left_count = product_left_count;
	}

	public int getProduct_sell_count() {
		return product_sell_count;
	}

	public void setProduct_sell_count(int product_sell_count) {
		this.product_sell_count = product_sell_count;
	}

	public String getProduct_date() {
		return product_date;
	}

	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}

	public String getImage_real_file1() {
		return image_real_file1;
	}

	public void setImage_real_file1(String image_real_file1) {
		this.image_real_file1 = image_real_file1;
	}

	public String getImage_real_file2() {
		return image_real_file2;
	}

	public void setImage_real_file2(String image_real_file2) {
		this.image_real_file2 = image_real_file2;
	}

	public String getImage_real_file3() {
		return image_real_file3;
	}

	public void setImage_real_file3(String image_real_file3) {
		this.image_real_file3 = image_real_file3;
	}

	public int getMy_wish() {
		return my_wish;
	}

	public void setMy_wish(int my_wish) {
		this.my_wish = my_wish;
	}

	// toString 오버라이딩
	@Override
	public String toString() {
		return "ProductVO [product_idx=" + product_idx + ", product_type=" + product_type + ", product_brand="
				+ product_brand + ", product_name=" + product_name + ", product_model_num=" + product_model_num
				+ ", product_color=" + product_color + ", product_release_price=" + product_release_price
				+ ", product_sell_price=" + product_sell_price + ", product_buy_price=" + product_buy_price
				+ ", product_left_count=" + product_left_count + ", product_sell_count=" + product_sell_count
				+ ", product_date=" + product_date + ", image_real_file1=" + image_real_file1
				+ ", image_real_file2=" + image_real_file2 + ", image_real_file3=" + image_real_file3
				+ ", my_wish=" + my_wish + "]";
	}
	
	
}
