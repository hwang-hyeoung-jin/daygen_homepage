package daygen.service.admin;

import daygen.model.Logical.BbsSearchModel;
import daygen.model.Logical.ParmacySearchModel;
import daygen.model.physical.BbsModel;
import daygen.model.physical.ParmacyModel;

import java.util.List;
import java.util.Map;

public interface BbsService {
    int add(BbsModel model);

    void modify(BbsModel model);

    void remove(int bbsPid);

    BbsModel getBbs(BbsModel model);

    int getBbsListCount(BbsSearchModel model);

    List<BbsModel> getBbsList(BbsSearchModel model);

    void addRdcnt(BbsModel model);

    int insertBbsAtchmnflMapng(Map map);

    void removeBbsAtchmnflMapng(BbsModel model);

    int checkMScrinExpsrYnCount(String clturTypeCode);

    int checkMScrinExpsrYn(int count);

    BbsModel getPrevBbs(BbsSearchModel model);

    BbsModel getNextBbs(BbsSearchModel model);
}
