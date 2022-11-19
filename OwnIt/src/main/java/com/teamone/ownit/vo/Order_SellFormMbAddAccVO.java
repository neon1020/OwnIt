package com.teamone.ownit.vo;

public class Order_SellFormMbAddAccVO {

	private int member_idx;
	private String member_id;
	private String member_passwd;
	private String member_name;
	private String member_nickname;
	private String member_phone;
	private String member_image;
	private String member_join_date;
	private String member_auth_gb;
	private String member_agree;
	private int address_idx;
	private String address_zipcode;
	private String address1;
	private String address2;
	private String address_gb;
	private String address_nickname;
	private String address_recipient;
	private int account_idx;
	private String account_bank;
	private String account_num;
	private String account_owner_name;
	private String account_gb;
	private String account_nickname;
	
	public Order_SellFormMbAddAccVO() {	}

	public Order_SellFormMbAddAccVO(int member_idx, String member_id, String member_passwd, String member_name,
			String member_nickname, String member_phone, String member_image, String member_join_date,
			String member_auth_gb, String member_agree, int address_idx, String address_zipcode, String address1,
			String address2, String address_gb, String address_nickname, String address_recipient, int account_idx,
			String account_bank, String account_num, String account_owner_name, String account_gb,
			String account_nickname) {
		super();
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.member_passwd = member_passwd;
		this.member_name = member_name;
		this.member_nickname = member_nickname;
		this.member_phone = member_phone;
		this.member_image = member_image;
		this.member_join_date = member_join_date;
		this.member_auth_gb = member_auth_gb;
		this.member_agree = member_agree;
		this.address_idx = address_idx;
		this.address_zipcode = address_zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.address_gb = address_gb;
		this.address_nickname = address_nickname;
		this.address_recipient = address_recipient;
		this.account_idx = account_idx;
		this.account_bank = account_bank;
		this.account_num = account_num;
		this.account_owner_name = account_owner_name;
		this.account_gb = account_gb;
		this.account_nickname = account_nickname;
	}

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

	public String getMember_passwd() {
		return member_passwd;
	}

	public void setMember_passwd(String member_passwd) {
		this.member_passwd = member_passwd;
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

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_image() {
		return member_image;
	}

	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}

	public String getMember_join_date() {
		return member_join_date;
	}

	public void setMember_join_date(String member_join_date) {
		this.member_join_date = member_join_date;
	}

	public String getMember_auth_gb() {
		return member_auth_gb;
	}

	public void setMember_auth_gb(String member_auth_gb) {
		this.member_auth_gb = member_auth_gb;
	}

	public String getMember_agree() {
		return member_agree;
	}

	public void setMember_agree(String member_agree) {
		this.member_agree = member_agree;
	}

	public int getAddress_idx() {
		return address_idx;
	}

	public void setAddress_idx(int address_idx) {
		this.address_idx = address_idx;
	}

	public String getAddress_zipcode() {
		return address_zipcode;
	}

	public void setAddress_zipcode(String address_zipcode) {
		this.address_zipcode = address_zipcode;
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

	public String getAddress_gb() {
		return address_gb;
	}

	public void setAddress_gb(String address_gb) {
		this.address_gb = address_gb;
	}

	public String getAddress_nickname() {
		return address_nickname;
	}

	public void setAddress_nickname(String address_nickname) {
		this.address_nickname = address_nickname;
	}

	public String getAddress_recipient() {
		return address_recipient;
	}

	public void setAddress_recipient(String address_recipient) {
		this.address_recipient = address_recipient;
	}

	public int getAccount_idx() {
		return account_idx;
	}

	public void setAccount_idx(int account_idx) {
		this.account_idx = account_idx;
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
		return "Order_SellFormMbAddAccVO [member_idx=" + member_idx + ", member_id=" + member_id + ", member_passwd="
				+ member_passwd + ", member_name=" + member_name + ", member_nickname=" + member_nickname
				+ ", member_phone=" + member_phone + ", member_image=" + member_image + ", member_join_date="
				+ member_join_date + ", member_auth_gb=" + member_auth_gb + ", member_agree=" + member_agree
				+ ", address_idx=" + address_idx + ", address_zipcode=" + address_zipcode + ", address1=" + address1
				+ ", address2=" + address2 + ", address_gb=" + address_gb + ", address_nickname=" + address_nickname
				+ ", address_recipient=" + address_recipient + ", account_idx=" + account_idx + ", account_bank="
				+ account_bank + ", account_num=" + account_num + ", account_owner_name=" + account_owner_name
				+ ", account_gb=" + account_gb + ", account_nickname=" + account_nickname + "]";
	}

	
}
