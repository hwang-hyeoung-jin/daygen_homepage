package daygen.service.admin.impl;

import daygen.data.admin.BbsData;
import daygen.model.Logical.BbsSearchModel;
import daygen.model.physical.BbsModel;
import daygen.service.admin.BbsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Primary
@Service
public class BbsServiceImpl implements BbsService {
    @Autowired
    BbsData bbsData;

    @Override
    public int add(BbsModel model) {
        return this.bbsData.insert(model);
    }

    @Override
    public void modify(BbsModel model) {
        this.bbsData.modify(model);
    }

    @Override
    public void remove(int bbsPid) {
        this.bbsData.remove(bbsPid);
    }

    @Override
    public BbsModel getBbs(BbsModel model) {
        return this.bbsData.getBbs(model);
    }

    @Override
    public int getBbsListCount(BbsSearchModel model) { return this.bbsData.getBbsListCount(model); }

    @Override
    public List<BbsModel> getBbsList(BbsSearchModel model) {
        return this.bbsData.getBbsList(model);
    }

    @Override
    public void addRdcnt(BbsModel model) {
        this.bbsData.addRdcnt(model);
    }

    public int insertBbsAtchmnflMapng(Map map) { return this.bbsData.insertBbsAtchmnflMapng(map); }

    public void removeBbsAtchmnflMapng(BbsModel model) { this.bbsData.removeBbsAtchmnflMapng(model); }

    @Override
    public int checkMScrinExpsrYnCount(String clturTypeCode) { return this.bbsData.checkMScrinExpsrYnCount(clturTypeCode); }

    @Override
    public int checkMScrinExpsrYn(int count) { return this.bbsData.checkMScrinExpsrYn(count); }

    @Override
    public BbsModel getPrevBbs(BbsSearchModel model) { return this.bbsData.getPrevBbs(model); }

    @Override
    public BbsModel getNextBbs(BbsSearchModel model) { return this.bbsData.getNextBbs(model); }
}
