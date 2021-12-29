package daygen.model.physical;

import grinbi.validation.annotation.Required;

public class ParmacyModel {
    private int rowNum;
    
    private int parmacyPid;
    
    private String zip;
    
    private String ctprvn;
    
    private String signgu;
    
    private String adres01;
    
    @Required
    private String adres02;
    
    @Required
    private String parmacyNm;
    
    @Required
    private String telno;
    
    private int rdcnt;
    
    private String expsrYn;
    
    private String deleteYn;
    
    private String creatDt;
    private String la;
    private String lo;
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getParmacyPid() {
		return parmacyPid;
	}
	public void setParmacyPid(int parmacyPid) {
		this.parmacyPid = parmacyPid;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getCtprvn() {
		return ctprvn;
	}
	public void setCtprvn(String ctprvn) {
		this.ctprvn = ctprvn;
	}
	public String getSigngu() {
		return signgu;
	}
	public void setSigngu(String signgu) {
		this.signgu = signgu;
	}
	public String getAdres01() {
		return adres01;
	}
	public void setAdres01(String adres01) {
		this.adres01 = adres01;
	}
	public String getAdres02() {
		return adres02;
	}
	public void setAdres02(String adres02) {
		this.adres02 = adres02;
	}
	public String getParmacyNm() {
		return parmacyNm;
	}
	public void setParmacyNm(String parmacyNm) {
		this.parmacyNm = parmacyNm;
	}
	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	public int getRdcnt() {
		return rdcnt;
	}
	public void setRdcnt(int rdcnt) {
		this.rdcnt = rdcnt;
	}
	public String getExpsrYn() {
		return expsrYn;
	}
	public void setExpsrYn(String expsrYn) {
		this.expsrYn = expsrYn;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getCreatDt() {
		return creatDt;
	}
	public void setCreatDt(String creatDt) {
		this.creatDt = creatDt;
	}
	public String getLa() {
		return la;
	}
	public void setLa(String la) {
		this.la = la;
	}
	public String getLo() {
		return lo;
	}
	public void setLo(String lo) {
		this.lo = lo;
	}
}
