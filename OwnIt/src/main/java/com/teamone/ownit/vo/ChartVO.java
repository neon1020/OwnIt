package com.teamone.ownit.vo;

public class ChartVO {

	private String product_type;
	private String product_name;

	private String date;
	
	private String image_real_file1;
	
	private int cnt;
	private int sales_buy;
	private int sales_sell;
	private int order_buy_idx;
	private int order_sell_idx;

	public ChartVO() {}

	public String getProduct_type() {
		return product_type;
	}

	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}

	public String getProduct_name() {
		return product_name;
	}
	
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getImage_real_file1() {
		return image_real_file1;
	}

	public void setImage_real_file1(String image_real_file1) {
		this.image_real_file1 = image_real_file1;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getSales_buy() {
		return sales_buy;
	}

	public void setSales_buy(int sales_buy) {
		this.sales_buy = sales_buy;
	}

	public int getSales_sell() {
		return sales_sell;
	}

	public void setSales_sell(int sales_sell) {
		this.sales_sell = sales_sell;
	}

	public int getOrder_buy_idx() {
		return order_buy_idx;
	}

	public void setOrder_buy_idx(int order_but_idx) {
		this.order_buy_idx = order_but_idx;
	}

	public int getOrder_sell_idx() {
		return order_sell_idx;
	}

	public void setOrder_sell_idx(int order_sell_idx) {
		this.order_sell_idx = order_sell_idx;
	}
	
	
}
