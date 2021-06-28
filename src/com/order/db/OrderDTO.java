package com.order.db;

import java.sql.Date;

public class OrderDTO {
    // 기본 번호 1,2,3,4 행...
    private int o_Num;

    // 주문 번호 20210619-1, 20210619-2
    private String o_tradeNum;

    // 화장품 번호 
    private int o_cosNum;

    // 화장품 이름 
    private String o_cosName;

    // 화장품 수량 
    private int o_cosAmount;

    // 회원 아이디 주문자 아이디
    private String o_userId;

    // 받는 사람 이름 
    private String receiverName;

    // 받는 사람 주소 
    private String receiverAddr;

    // 받는 사람 이메일 
    private String receiverEmail;

    // 받는 사람 전화번호 
    private String receiverTel;

    // 배송 메시지 
    private String o_msg;

    // 상품 가격 합계 합계 693,000원
    private int totalMoney;

    // 결제 번호 
    private int payNum;

    // 결제자 이름 
    private String payerName;

    // 결제 방식 카드(0)/계좌이체(1)/카카오페이(2)
    private int payType;

    // 결제 날짜 
    private Date payDate;

    // 주문 날짜 
    private Date orderDate;

    // 주문 상태 상품준비/상품준비완료/주문취소/배송준비/배송중/배송완료
    private int orderStatus;

	public int getO_Num() {
		return o_Num;
	}

	public void setO_Num(int o_Num) {
		this.o_Num = o_Num;
	}

	public String getO_tradeNum() {
		return o_tradeNum;
	}

	public void setO_tradeNum(String o_tradeNum) {
		this.o_tradeNum = o_tradeNum;
	}

	public int getO_cosNum() {
		return o_cosNum;
	}

	public void setO_cosNum(int o_cosNum) {
		this.o_cosNum = o_cosNum;
	}

	public String getO_cosName() {
		return o_cosName;
	}

	public void setO_cosName(String o_cosName) {
		this.o_cosName = o_cosName;
	}

	public int getO_cosAmount() {
		return o_cosAmount;
	}

	public void setO_cosAmount(int o_cosAmount) {
		this.o_cosAmount = o_cosAmount;
	}

	public String getO_userId() {
		return o_userId;
	}

	public void setO_userId(String o_userId) {
		this.o_userId = o_userId;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverAddr() {
		return receiverAddr;
	}

	public void setReceiverAddr(String receiverAddr) {
		this.receiverAddr = receiverAddr;
	}

	public String getReceiverEmail() {
		return receiverEmail;
	}

	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}

	public String getReceiverTel() {
		return receiverTel;
	}

	public void setReceiverTel(String receiverTel) {
		this.receiverTel = receiverTel;
	}

	public String getO_msg() {
		return o_msg;
	}

	public void setO_msg(String o_msg) {
		this.o_msg = o_msg;
	}

	public int getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}

	public int getPayNum() {
		return payNum;
	}

	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}

	public String getPayerName() {
		return payerName;
	}

	public void setPayerName(String payerName) {
		this.payerName = payerName;
	}

	public int getPayType() {
		return payType;
	}

	public void setPayType(int payType) {
		this.payType = payType;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	@Override
	public String toString() {
		return "OrderDTO [o_Num=" + o_Num + ", o_tradeNum=" + o_tradeNum + ", o_cosNum=" + o_cosNum + ", o_cosName="
				+ o_cosName + ", o_cosAmount=" + o_cosAmount + ", o_userId=" + o_userId + ", receiverName="
				+ receiverName + ", receiverAddr=" + receiverAddr + ", receiverEmail=" + receiverEmail
				+ ", receiverTel=" + receiverTel + ", o_msg=" + o_msg + ", totalMoney=" + totalMoney + ", payNum="
				+ payNum + ", payerName=" + payerName + ", payType=" + payType + ", payDate=" + payDate + ", orderDate="
				+ orderDate + ", orderStatus=" + orderStatus + "]";
	}
    
    
}
