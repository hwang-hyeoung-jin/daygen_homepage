package daygen.model.physical;

import grinbi.validation.annotation.DisplayElement;
import grinbi.validation.annotation.Required;

public class BbsModel {
    private int rowNum;

    private int bbsPid;

    private String clturTypeCode;

    @Required
    private String clTypeCode;

    @Required
    private String sj;

    private String creatDt;

    private int rdcnt;

    @Required
    private String cn;

    @Required
    @DisplayElement("fileName")
    private int thumbFilePid;

    @Required
    private String bbscttExpsrYn = "N";

    private String deleteYn = "N";

    private int filePid;

    private String filePids;

    private String realName;

    private String virtualName;

    private String category;

    private int height;

    private int width;

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getBbsPid() {
		return bbsPid;
	}

	public void setBbsPid(int bbsPid) {
		this.bbsPid = bbsPid;
	}

	public String getClturTypeCode() {
		return clturTypeCode;
	}

	public void setClturTypeCode(String clturTypeCode) {
		this.clturTypeCode = clturTypeCode;
	}

	public String getClTypeCode() {
		return clTypeCode;
	}

	public void setClTypeCode(String clTypeCode) {
		this.clTypeCode = clTypeCode;
	}

	public String getSj() {
		return sj;
	}

	public void setSj(String sj) {
		this.sj = sj;
	}

	public String getCreatDt() {
		return creatDt;
	}

	public void setCreatDt(String creatDt) {
		this.creatDt = creatDt;
	}

	public int getRdcnt() {
		return rdcnt;
	}

	public void setRdcnt(int rdcnt) {
		this.rdcnt = rdcnt;
	}

	public String getCn() {
		return cn;
	}

	public void setCn(String cn) {
		this.cn = cn;
	}

	public int getThumbFilePid() {
		return thumbFilePid;
	}

	public void setThumbFilePid(int thumbFilePid) {
		this.thumbFilePid = thumbFilePid;
	}

	public String getBbscttExpsrYn() {
		return bbscttExpsrYn;
	}

	public void setBbscttExpsrYn(String bbscttExpsrYn) {
		this.bbscttExpsrYn = bbscttExpsrYn;
	}

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	public int getFilePid() {
		return filePid;
	}

	public void setFilePid(int filePid) {
		this.filePid = filePid;
	}

	public String getFilePids() {
		return filePids;
	}

	public void setFilePids(String filePids) {
		this.filePids = filePids;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getVirtualName() {
		return virtualName;
	}

	public void setVirtualName(String virtualName) {
		this.virtualName = virtualName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}
}
