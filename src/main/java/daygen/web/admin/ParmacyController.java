package daygen.web.admin;

import com.google.common.base.Strings;
import daygen.model.Logical.ParmacySearchModel;
import daygen.model.physical.BbsModel;
import daygen.model.physical.ParmacyModel;
import daygen.service.admin.ParmacyService;
import grinbi.common.model.GridJsonObject;
import grinbi.common.model.JsonObject;
import grinbi.validation.utility.ValidatorUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping(value = "/admin/parmacy")
public class ParmacyController {
    @Autowired
    private ParmacyService parmacyService;

    @ResponseBody
    @RequestMapping(value = "/add.do", method = RequestMethod.POST)
    public JsonObject add(@Valid ParmacyModel model, Errors errors, HttpServletRequest request) throws Exception {
        JsonObject jo = new JsonObject();
        this.parmacyService.add(model);
        jo.IsSucceed = true;
        return jo;
    }

    @ResponseBody
    @RequestMapping(value = "/modify.do", method = RequestMethod.POST)
    public JsonObject modify(@Valid ParmacyModel model, Errors errors, HttpServletRequest request) throws Exception {
        JsonObject jo = new JsonObject();
        this.parmacyService.modify(model);
        jo.IsSucceed = true;
        return jo;
    }

    @ResponseBody
    @RequestMapping(value = "/getParmacy.do", method = RequestMethod.POST)
    public JsonObject getParmacy(ParmacyModel model, Errors errors, HttpServletRequest request) throws Exception {
        JsonObject jo = new JsonObject();
        jo.Data = this.parmacyService.getParmacy(model);
        if (jo.Data == null) {
            jo.IsSucceed = false;
            jo.Message = "게시물이 존재 하지 않습니다.";
        } else {
            jo.IsSucceed = true;
        }
        return jo;
    }

    @ResponseBody
    @RequestMapping(value = "/remove.do", method = RequestMethod.POST)
    public JsonObject remove(int parmacyPid) {
        JsonObject jo = new JsonObject();
        this.parmacyService.remove(parmacyPid);
        jo.IsSucceed = true;
        return jo;
    }

    @ResponseBody
    @RequestMapping(value = "/getParmacyList.do", method = RequestMethod.POST)
    public GridJsonObject getParmacyList(ParmacySearchModel model, Errors errors, HttpServletRequest request) throws Exception {
        GridJsonObject jo = new GridJsonObject(new JsonObject());
        int offset = (model.getPageSize() * (model.getPageNumber() - 1));
        int limit = model.getPageSize();

        model.setOffset(offset);
        model.setLimit(limit);

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
    @RequestMapping(value = "/checkParmacyExpsrYn.do", method = RequestMethod.POST)
    public JsonObject checkDuplicate() throws Exception {
        int result = this.parmacyService.checkParmacyExpsrYn();
        JsonObject jo = new JsonObject();
        jo.IsSucceed = result == 0;
        return jo;
    }
}
