package com.teamone.ownit.vo;

public class Order_SellFormInsertAccount {
	private int account_idx;
	private int member_idx;
	private int product_idx;
	private String account_bank;
	private String account_num;
	private String account_owner_name;
	private String account_gb;
	private String account_nickname;
	
	public Order_SellFormInsertAccount() {}

	public Order_SellFormInsertAccount(int account_idx, int member_idx, int product_idx, String account_bank,
			String account_num, String account_owner_name, String account_gb, String account_nickname) {
		super();
		this.account_idx = account_idx;
		this.member_idx = member_idx;
		this.product_idx = product_idx;
		this.account_bank = account_bank;
		this.account_num = account_num;
		this.account_owner_name = account_owner_name;
		this.account_gb = account_gb;
		this.account_nickname = account_nickname;
	}

	public int getAccount_idx() {
		return account_idx;
	}

	public void setAccount_idx(int account_idx) {
		this.account_idx = account_idx;
	}

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

	public String getAccount_bank() {
		return account_bank;
	}

	public void setAccount_bank(String account_bank) {
		this.account_bank = account_bank;
	}

	public String getAccount_num() {
		return account_num;
	}

	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}

	public String getAccount_owner_name() {
		return account_owner_name;
	}

	public void setAccount_owner_name(String account_owner_name) {
		this.account_owner_name = account_owner_name;
	}

	public String getAccount_gb() {
		return account_gb;
	}

	public void setAccount_gb(String account_gb) {
		this.account_gb = account_gb;
	}

	public String getAccount_nickname() {
		return account_nickname;
	}

	public void setAccount_nickname(String account_nickname) {
		this.account_nickname = account_nickname;
	}

	@Override
	public String toString() {
		return "Order_SellFormInsertAccount [account_idx=" + account_idx + ", member_idx=" + member_idx
				+ ", product_idx=" + product_idx + ", account_bank=" + account_bank + ", account_num=" + account_num
				+ ", account_owner_name=" + account_owner_name + ", account_gb=" + account_gb + ", account_nickname="
				+ account_nickname + "]";
	}
	
	
}
