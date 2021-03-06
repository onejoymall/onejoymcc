package com.onejoymcc.vo;

public class CartPaymentVO extends CommonVO {
    private String cart_user_id;
   private String error_msg;
   private String merchant_uid;
   private String payment;
   private String payment_cd;
   private String order_no;
   private String pg_type;
   private String cart_cd;
   private String pay_method;
   private String imp_uid;
   private String payment_type_cd;
   private String pg_provider;
   private String success;

    public String getError_msg() {
        return error_msg;
    }

    public void setError_msg(String error_msg) {
        this.error_msg = error_msg;
    }

    public String getMerchant_uid() {
        return merchant_uid;
    }

    public void setMerchant_uid(String merchant_uid) {
        this.merchant_uid = merchant_uid;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getPayment_cd() {
        return payment_cd;
    }

    public void setPayment_cd(String payment_cd) {
        this.payment_cd = payment_cd;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public String getPg_type() {
        return pg_type;
    }

    public void setPg_type(String pg_type) {
        this.pg_type = pg_type;
    }

    public String getCart_cd() {
        return cart_cd;
    }

    public void setCart_cd(String cart_cd) {
        this.cart_cd = cart_cd;
    }

    public String getPay_method() {
        return pay_method;
    }

    public void setPay_method(String pay_method) {
        this.pay_method = pay_method;
    }

    public String getImp_uid() {
        return imp_uid;
    }

    public void setImp_uid(String imp_uid) {
        this.imp_uid = imp_uid;
    }

    public String getPayment_type_cd() {
        return payment_type_cd;
    }

    public void setPayment_type_cd(String payment_type_cd) {
        this.payment_type_cd = payment_type_cd;
    }

    public String getPg_provider() {
        return pg_provider;
    }

    public void setPg_provider(String pg_provider) {
        this.pg_provider = pg_provider;
    }

    public String getSuccess() {
        return success;
    }

    public void setSuccess(String success) {
        this.success = success;
    }

    public String getCart_user_id() {
        return cart_user_id;
    }

    public void setCart_user_id(String cart_user_id) {
        this.cart_user_id = cart_user_id;
    }

}
