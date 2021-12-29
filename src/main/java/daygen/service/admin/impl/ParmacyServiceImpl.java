package daygen.service.admin.impl;

import daygen.data.admin.ParmacyData;
import daygen.model.Logical.ParmacySearchModel;
import daygen.model.physical.ParmacyModel;
import daygen.service.admin.ParmacyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

@Primary
@Service
public class ParmacyServiceImpl implements ParmacyService {
	@Autowired
	private ParmacyData parmacyData;

	@Override
	public int add(ParmacyModel model) {
		return this.parmacyData.insert(model);
	}

	@Override
	public void modify(ParmacyModel model) {
		this.parmacyData.modify(model);
	}

	@Override
	public void remove(int parmacyPid) {
		this.parmacyData.remove(parmacyPid);
	}

	@Override
	public ParmacyModel getParmacy(ParmacyModel model) {
		return this.parmacyData.getParmacy(model);
	}

	@Override
	public int getParmacyListCount(ParmacySearchModel model) {
		return this.parmacyData.getParmacyListCount(model);
	}

	@Override
	public List<ParmacyModel> getParmacyList(ParmacySearchModel model) {
		return this.parmacyData.getParmacyList(model);
	}

	@Override
	public void addRdcnt(int parmacyPid) {
		this.parmacyData.addRdcnt(parmacyPid);
	}

	@Override
	public int checkParmacyExpsrYn() {
		return this.parmacyData.checkParmacyExpsrYn();
	}

	@Override
	public List<ParmacySearchModel> getCtprvnList() {
		return this.parmacyData.getCtprvnList();
	}
	
	@Override
	public List<ParmacySearchModel> getSignguList(String ctprvn) {
		return this.parmacyData.getSignguList(ctprvn);
	}
}
