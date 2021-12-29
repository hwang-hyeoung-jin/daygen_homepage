package daygen.web;

import daygen.model.Logical.ParmacySearchModel;
import daygen.model.physical.ParmacyModel;
import daygen.service.admin.ParmacyService;
import grinbi.common.model.GridJsonObject;
import grinbi.common.model.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.base.Strings;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/frontparmacy")
public class ParmacyServiceController {
    @Autowired
    private ParmacyService parmacyService;

    @ResponseBody
    @RequestMapping(value = "/getParmacyList.do", method = RequestMethod.POST)
    public GridJsonObject getParmacyList(ParmacySearchModel model, Errors errors, HttpServletRequest request) throws Exception {
        GridJsonObject jo = new GridJsonObject(new JsonObject());

        int offset = (model.getPageSize() * (model.getPageNumber() - 1));
        int limit = model.getPageSize();

        model.setOffset(offset);
        model.setLimit(limit);
        model.setExpsrYn("Y");

        jo.setTotalrecords(this.parmacyService.getParmacyListCount(model));
        List<ParmacyModel> list  = this.parmacyService.getParmacyList(model);
        list.forEach(m -> m.setRowNum(jo.getTotalrecords() - m.getRowNum() + 1));
        jo.setRows(list);
        jo.IsSucceed = true;
        jo.setPagenum(model.getPageNumber());
        jo.setPagesize(model.getPageSize());
        return jo;
    }
    
    @ResponseBody
    @RequestMapping(value = "/getCtprvnList.do", method = RequestMethod.POST)
    public JsonObject getCtprvnList() throws Exception {
        JsonObject jo = new JsonObject();

        jo.Data = this.parmacyService.getCtprvnList();
        
        if (jo.Data == null) {
            jo.IsSucceed = false;
        } else {
            jo.IsSucceed = true;
        }
        return jo;
    }
    
    @ResponseBody
    @RequestMapping(value = "/getSignguList.do", method = RequestMethod.POST)
    public JsonObject getSignguList(String ctprvn) throws Exception {
    	JsonObject jo = new JsonObject();

        jo.Data = this.parmacyService.getSignguList(ctprvn);
        
        if (jo.Data == null) {
            jo.IsSucceed = false;
        } else {
            jo.IsSucceed = true;
        }
        return jo;
    }

    @ResponseBody
    @RequestMapping(value = "/addRdcnt.do", method = RequestMethod.POST)
    public JsonObject addRdcnt(int parmacyPid) throws Exception {
        JsonObject jo = new JsonObject();
        this.parmacyService.addRdcnt(parmacyPid);
        jo.IsSucceed = true;
        return jo;
    }
}