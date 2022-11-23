package com.teamone.ownit.vo;

public class ChartVO {

	private String product_type;
	private String product_name;

	private String date;
	
	private int cnt;
	private int sales_buy;
	private int sales_sell;

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
	
	
	
	
}
