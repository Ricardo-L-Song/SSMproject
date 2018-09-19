package com.sl.example.pojo;

public class Qsn {
    private String qsnId;

    private String modelId;

    private String modelName;

    private Short orderNum;

    private String content;

    private String qsnType;

    private String flightId;

    private String rmk1;

    private String rmk2;

    private String rmk3;

    private String rmk4;

    private String rmk5;

    public Qsn(String qsnId, String modelId, String modelName, Short orderNum, String content, String qsnType, String flightId, String rmk1, String rmk2, String rmk3, String rmk4, String rmk5) {
        this.qsnId = qsnId;
        this.modelId = modelId;
        this.modelName = modelName;
        this.orderNum = orderNum;
        this.content = content;
        this.qsnType = qsnType;
        this.flightId = flightId;
        this.rmk1 = rmk1;
        this.rmk2 = rmk2;
        this.rmk3 = rmk3;
        this.rmk4 = rmk4;
        this.rmk5 = rmk5;
    }

    public Qsn() {
        super();
    }

    public String getQsnId() {
        return qsnId;
    }

    public void setQsnId(String qsnId) {
        this.qsnId = qsnId == null ? null : qsnId.trim();
    }

    public String getModelId() {
        return modelId;
    }

    public void setModelId(String modelId) {
        this.modelId = modelId == null ? null : modelId.trim();
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName == null ? null : modelName.trim();
    }

    public Short getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Short orderNum) {
        this.orderNum = orderNum;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getQsnType() {
        return qsnType;
    }

    public void setQsnType(String qsnType) {
        this.qsnType = qsnType == null ? null : qsnType.trim();
    }

    public String getFlightId() {
        return flightId;
    }

    public void setFlightId(String flightId) {
        this.flightId = flightId == null ? null : flightId.trim();
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