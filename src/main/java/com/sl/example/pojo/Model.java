package com.sl.example.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Model {
    private String modelId;

    private String name;

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
    private Date time;

    private String createName;

    private String rmk2;

    private String rmk3;

    private String rmk4;

    private String rmk5;

    public Model(String modelId, String name,  @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")Date time, String createName, String rmk2, String rmk3, String rmk4, String rmk5) {
        this.modelId = modelId;
        this.name = name;
        this.time = time;
        this.createName = createName;
        this.rmk2 = rmk2;
        this.rmk3 = rmk3;
        this.rmk4 = rmk4;
        this.rmk5 = rmk5;
    }

    public Model() {
        super();
    }

    public String getModelId() {
        return modelId;
    }

    public void setModelId(String modelId) {
        this.modelId = modelId == null ? null : modelId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
    public Date getTime() {
        return time;
    }

    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    public void setTime(Date time) {
        this.time = time;
    }

    public String getCreateName() {
        return createName;
    }

    public void setCreateName(String createName) {
        this.createName = createName == null ? null : createName.trim();
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