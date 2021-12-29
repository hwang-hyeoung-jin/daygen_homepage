package daygen.model.Logical;

public class BbsSearchModel {
    private int bbsPid;

    private String clturTypeCode;

    private String searchType;

    private String searchText;
    
    private String bbscttExpsrYn;

    private int pageNumber;

    private int pageSize;

    private int offset;

    private int limit;

    private String clTypeCode;

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

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getBbscttExpsrYn() {
		return bbscttExpsrYn;
	}

	public void setBbscttExpsrYn(String bbscttExpsrYn) {
		this.bbscttExpsrYn = bbscttExpsrYn;
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

	public String getClTypeCode() {
		return clTypeCode;
	}

	public void setClTypeCode(String clTypeCode) {
		this.clTypeCode = clTypeCode;
	}
}
