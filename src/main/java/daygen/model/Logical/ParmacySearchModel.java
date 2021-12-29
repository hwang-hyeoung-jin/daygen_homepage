package daygen.model.Logical;

import lombok.Data;

public class ParmacySearchModel {
    private String searchText;

    private int pageNumber;

    private int pageSize;
    
    private int totalRecords;
    
    private String ctprvn;
    
    private String signgu;

    private int offset;

    private int limit;
    
    private String expsrYn;

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
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

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public String getExpsrYn() {
		return expsrYn;
	}

	public void setExpsrYn(String expsrYn) {
		this.expsrYn = expsrYn;
	}
}
