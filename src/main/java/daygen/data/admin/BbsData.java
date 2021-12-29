package daygen.data.admin;

import daygen.model.Logical.BbsSearchModel;
import daygen.model.physical.BbsModel;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BbsData extends EgovAbstractMapper {
    public int insert(BbsModel model) {
        return this.insert("bbs.Insert", model);
    }

    public void modify(BbsModel model){
        this.update("bbs.Modify", model);
    }

    public void remove(int bbsPid) { this.update("bbs.Remove", bbsPid); }

    public BbsModel getBbs(BbsModel model) {
        return this.selectOne("bbs.GetBbs", model);
    }

    public int getBbsListCount(BbsSearchModel model){
        return this.selectOne("bbs.GetBbsListCount", model);
    }

    public List<BbsModel> getBbsList(BbsSearchModel model){ return this.selectList("bbs.GetBbsList", model); }

    public void addRdcnt(BbsModel model) {
        this.update("bbs.AddRdcnt", model);
    }

    public int insertBbsAtchmnflMapng(Map map) { return this.insert("bbs.InsertBbsAtchmnflMapng", map); }

    public void removeBbsAtchmnflMapng(BbsModel model) { this.update("bbs.RemoveBbsAtchmnflMapng", model); }

    public int checkMScrinExpsrYnCount(String clturTypeCode) { return this.selectOne("bbs.CheckMScrinExpsrYnCount", clturTypeCode); }

    public int checkMScrinExpsrYn(int count) { return this.selectOne("bbs.CheckMScrinExpsrYn", count); }

    public BbsModel getPrevBbs(BbsSearchModel model) {
        return this.selectOne("bbs.GetPrevBbs", model);
    }

    public BbsModel getNextBbs(BbsSearchModel model) {
        return this.selectOne("bbs.GetNextBbs", model);
    }
}
