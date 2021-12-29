package daygen.service.admin;

import daygen.model.Logical.ParmacySearchModel;
import daygen.model.physical.BbsModel;
import daygen.model.physical.ParmacyModel;

import java.util.List;

public interface ParmacyService {
	int add(ParmacyModel model);

	void modify(ParmacyModel model);

	void remove(int parmacyPid);

	ParmacyModel getParmacy(ParmacyModel model);

	int getParmacyListCount(ParmacySearchModel model);

	List<ParmacyModel> getParmacyList(ParmacySearchModel model);

	void addRdcnt(int parmacyPid);

	int checkParmacyExpsrYn();

	List<ParmacySearchModel> getCtprvnList();
	
	List<ParmacySearchModel> getSignguList(String ctprvn);
}
