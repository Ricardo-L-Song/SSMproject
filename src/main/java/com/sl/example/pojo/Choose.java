package com.sl.example.pojo;

import java.util.Date;

public class Choose {
    private String psgQsnRId;

    private String psgId;

    private String modelId;

    private String qsnId;

    private String detailId;

    private String choose;

    private String qsnType;

    private String flightId;

    private Date createDate;

    private String rmk1;

    private String rmk2;

    private String rmk3;

    private String rmk4;

    private String rmk5;

    public Choose(String psgQsnRId, String psgId, String modelId, String qsnId, String detailId, String choose, String qsnType, String flightId, Date createDate, String rmk1, String rmk2, String rmk3, String rmk4, String rmk5) {
        this.psgQsnRId = psgQsnRId;
        this.psgId = psgId;
        this.modelId = modelId;
        this.qsnId = qsnId;
        this.detailId = detailId;
        this.choose = choose;
        this.qsnType = qsnType;
        this.flightId = flightId;
        this.createDate = createDate;
        this.rmk1 = rmk1;
        this.rmk2 = rmk2;
        this.rmk3 = rmk3;
        this.rmk4 = rmk4;
        this.rmk5 = rmk5;
    }

    public Choose() {
        super();
    }

    public String getPsgQsnRId() {
        return psgQsnRId;
    }

    public void setPsgQsnRId(String psgQsnRId) {
        this.psgQsnRId = psgQsnRId == null ? null : psgQsnRId.trim();
    }

    public String getPsgId() {
        return psgId;
    }

    public void setPsgId(String psgId) {
        this.psgId = psgId == null ? null : psgId.trim();
    }

    public String getModelId() {
        return modelId;
    }

    public void setModelId(String modelId) {
        this.modelId = modelId == null ? null : modelId.trim();
    }

    public String getQsnId() {
        return qsnId;
    }

    public void setQsnId(String qsnId) {
        this.qsnId = qsnId == null ? null : qsnId.trim();
    }

    public String getDetailId() {
        return detailId;
    }

    public void setDetailId(String detailId) {
        this.detailId = detailId == null ? null : detailId.trim();
    }

    public String getChoose() {
        return choose;
    }

    public void setChoose(String choose) {
        this.choose = choose == null ? null : choose.trim();
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

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
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