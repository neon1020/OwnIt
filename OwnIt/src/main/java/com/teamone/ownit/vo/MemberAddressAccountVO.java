package com.teamone.ownit.vo;

public class MemberAddressAccountVO {
	
	// Order_sellForm에서 사용할 VO
	private String member_idx;
	private String account_idx;
	private String member_name;
	private String member_phone;
	private String account_bank;
	private String account_num;
	private String account_owner_name;
	private String address1;
	private String address2;
	
	public MemberAddressAccountVO() {}

	
	
	public MemberAddressAccountVO(String member_idx, String account_idx, String member_name, String member_phone,
			String account_bank, String account_num, String account_owner_name, String address1, String address2) {
		super();
		this.member_idx = member_idx;
		this.account_idx = account_idx;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.account_bank = account_bank;
		this.account_num = account_num;
		this.account_owner_name = account_owner_name;
		this.address1 = address1;
		this.address2 = address2;
	}



	public String getMember_idx() {
		return member_idx;
	}



	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}



	public String getAccount_idx() {
		return account_idx;
	}



	public void setAccount_idx(String account_idx) {
		this.account_idx = account_idx;
	}



	public String getMember_name() {
		return member_name;
	}



	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}



	public String getMember_phone() {
		return member_phone;
	}



	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
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



	public String getAddress1() {
		return address1;
	}



	public void setAddress1(String address1) {
		this.address1 = address1;
	}



	public String getAddress2() {
		return address2;
	}



	public void setAddress2(String address2) {
		this.address2 = address2;
	}



	@Override
	public String toString() {
		return "MemberAddressAccountVO [member_idx=" + member_idx + ", account_idx=" + account_idx + ", member_name="
				+ member_name + ", member_phone=" + member_phone + ", account_bank=" + account_bank + ", account_num="
				+ account_num + ", account_owner_name=" + account_owner_name + ", address1=" + address1 + ", address2="
				+ address2 + "]";
	}



	
	
}
