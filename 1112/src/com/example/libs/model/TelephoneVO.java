package com.example.libs.model;

public class TelephoneVO {
	private int kind;		//구분
	private String tel;		//전화번호
	private String name;		//전화주인
	private int quantity;		//통화량
	private int defaultFee;		//기본요금
	private int fee;			//통화료
	private int tax;			//세금
	private int total;		//합계
	private int seq;
	
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public TelephoneVO() {}		//기본 생성자
	
	public TelephoneVO(int kind, String tel, String name, int quantity) {	//생성자 : 멤버변수 초기화.
		this.kind = kind;
		this.tel = tel;
		this.name = name;
		this.quantity = quantity;
	}

	//overloading
	public TelephoneVO(int kind, String tel, String name, int quantity, int defaultFee, int fee, int tax, int total) {
		this.kind = kind;
		this.tel = tel;
		this.name = name;
		this.quantity = quantity;
		this.defaultFee = defaultFee;
		this.fee = fee;
		this.tax = tax;
		this.total = total;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getDefaultFee() {
		return defaultFee;
	}

	public void setDefaultFee(int defaultFee) {
		this.defaultFee = defaultFee;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

	public int getTax() {
		return tax;
	}

	public void setTax(int tax) {
		this.tax = tax;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return String.format(
				"TelephoneVO [kind=%s, tel=%s, name=%s, quantity=%s, defaultFee=%s, fee=%s, tax=%s, total=%s]", kind,
				tel, name, quantity, defaultFee, fee, tax, total);
	}
	
}