package daygen.data.admin;

import daygen.model.Logical.ParmacySearchModel;
import daygen.model.physical.ParmacyModel;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ParmacyData extends EgovAbstractMapper {
	public int insert(ParmacyModel model) {
		return this.insert("parmacy.Insert", model);
	}

	public void modify(ParmacyModel model) {
		this.update("parmacy.Modify", model);
	}

	public void remove(int parmacyPid) {
		this.update("parmacy.Remove", parmacyPid);
	}

	public ParmacyModel getParmacy(ParmacyModel model) {
		return this.selectOne("parmacy.GetParmacy", model);
	}

	public int getParmacyListCount(ParmacySearchModel model) {
		return this.selectOne("parmacy.GetParmacyListCount", model);
	}

	public List<ParmacyModel> getParmacyList(ParmacySearchModel model) {
		return this.selectList("parmacy.GetParmacyList", model);
	}

	public void addRdcnt(int parmacyPid) {
		this.update("parmacy.AddRdcnt", parmacyPid);
	}

	public int checkParmacyExpsrYn() {
		return this.selectOne("parmacy.CheckParmacyExpsrYn");
	}

	public List<ParmacySearchModel> getCtprvnList(){
		return this.selectList("parmacy.GetCtprvnList");
	}
	
	public List<ParmacySearchModel> getSignguList(String ctprvn){
		return this.selectList("parmacy.GetSignguList", ctprvn);
	}
}
