package com.teamone.ownit.vo;

public class ChartVO {

	private String product_type;
	private int cnt;
	

	public ChartVO() {}
	
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}

	public int getCnt() {
		return cnt;
	}
	
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "ChartVO [product_type=" + product_type + ", cnt=" + cnt + "]";
	}
	
	
	
}
