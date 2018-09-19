package com.sl.example.pojo;

public class Detail {
    private String detailId;

    private String qsnId;

    private String optionNum;

    private Short orderNum;

    private String type;

    private String rmk1;

    private String rmk2;

    private String rmk3;

    private String rmk4;

    private String rmk5;

    public Detail(String detailId, String qsnId, String optionNum, Short orderNum, String type, String rmk1, String rmk2, String rmk3, String rmk4, String rmk5) {
        this.detailId = detailId;
        this.qsnId = qsnId;
        this.optionNum = optionNum;
        this.orderNum = orderNum;
        this.type = type;
        this.rmk1 = rmk1;
        this.rmk2 = rmk2;
        this.rmk3 = rmk3;
        this.rmk4 = rmk4;
        this.rmk5 = rmk5;
    }

    public Detail() {
        super();
    }

    public String getDetailId() {
        return detailId;
    }

    public void setDetailId(String detailId) {
        this.detailId = detailId == null ? null : detailId.trim();
    }

    public String getQsnId() {
        return qsnId;
    }

    public void setQsnId(String qsnId) {
        this.qsnId = qsnId == null ? null : qsnId.trim();
    }

    public String getOptionNum() {
        return optionNum;
    }

    public void setOptionNum(String optionNum) {
        this.optionNum = optionNum == null ? null : optionNum.trim();
    }

    public Short getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Short orderNum) {
        this.orderNum = orderNum;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getRmk1() {
        return rmk1;
    }

    public void setRmk1(String rmk1) {
        this.rmk1 = rmk1 == null ? null : rmk1.trim();
    }

    public String getRmk2() {
        return rmk2;
    }

    public void setRmk2(String rmk2) {
        this.rmk2 = rmk2 == null ? null : rmk2.trim();
    }

    public String getRmk3() {
        return rmk3;
    }

    public void setRmk3(String rmk3) {
        this.rmk3 = rmk3 == null ? null : rmk3.trim();
    }

    public String getRmk4() {
        return rmk4;
    }

    public void setRmk4(String rmk4) {
        this.rmk4 = rmk4 == null ? null : rmk4.trim();
    }

    public String getRmk5() {
        return rmk5;
    }

    public void setRmk5(String rmk5) {
        this.rmk5 = rmk5 == null ? null : rmk5.trim();
    }
}