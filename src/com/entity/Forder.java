package com.entity;

public class Forder {
    private Integer id;

    private Integer uid;

    private Integer qid;

    private Integer fid;

    private String status;

    private String day;

    private String stime;

    private String etime;

    private Integer amount;

    private String isdel;

    private String pubtime;

    private Double zprice;

    private String ono;

    private String pj;

    private String huifu;

    private String scope;

    private String pjtime;

    private Integer tid;

    private String btype;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day == null ? null : day.trim();
    }

    public String getStime() {
        return stime;
    }

    public void setStime(String stime) {
        this.stime = stime == null ? null : stime.trim();
    }

    public String getEtime() {
        return etime;
    }

    public void setEtime(String etime) {
        this.etime = etime == null ? null : etime.trim();
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getIsdel() {
        return isdel;
    }

    public void setIsdel(String isdel) {
        this.isdel = isdel == null ? null : isdel.trim();
    }

    public String getPubtime() {
        return pubtime;
    }

    public void setPubtime(String pubtime) {
        this.pubtime = pubtime == null ? null : pubtime.trim();
    }

    public Double getZprice() {
        return zprice;
    }

    public void setZprice(Double zprice) {
        this.zprice = zprice;
    }

    public String getOno() {
        return ono;
    }

    public void setOno(String ono) {
        this.ono = ono == null ? null : ono.trim();
    }

    public String getPj() {
        return pj;
    }

    public void setPj(String pj) {
        this.pj = pj == null ? null : pj.trim();
    }

    public String getHuifu() {
        return huifu;
    }

    public void setHuifu(String huifu) {
        this.huifu = huifu == null ? null : huifu.trim();
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope == null ? null : scope.trim();
    }

    public String getPjtime() {
        return pjtime;
    }

    public void setPjtime(String pjtime) {
        this.pjtime = pjtime == null ? null : pjtime.trim();
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getBtype() {
        return btype;
    }

    public void setBtype(String btype) {
        this.btype = btype == null ? null : btype.trim();
    }
}