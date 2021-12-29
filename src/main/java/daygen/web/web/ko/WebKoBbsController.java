package daygen.web.web.ko;

import daygen.model.Logical.BbsSearchModel;
import daygen.model.physical.BbsModel;
import daygen.service.admin.BbsService;
import grinbi.common.model.GridJsonObject;
import grinbi.common.model.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/ko/bbs")
public class WebKoBbsController {
    @Autowired
    private BbsService bbsService;

    @ResponseBody
    @RequestMapping(value = "/getBbsList.do", method = RequestMethod.POST)
    public GridJsonObject getBbsList(BbsSearchModel model, Errors errors, HttpServletRequest request) throws Exception {
        GridJsonObject jo = new GridJsonObject(new JsonObject());
        int offset = (model.getPageSize() * (model.getPageNumber() - 1));
        int limit = model.getPageSize();

        model.setOffset(offset);
        model.setLimit(limit);

        jo.setTotalrecords(this.bbsService.getBbsListCount(model));
        List<BbsModel> list = this.bbsService.getBbsList(model);
        list.forEach(m -> m.setRowNum(jo.getTotalrecords() - m.getRowNum() + 1));
        jo.setRows(list);
        jo.IsSucceed = true;
        jo.setPagenum(model.getPageNumber());
        jo.setPagesize(model.getPageSize());
        return jo;
    }

    @ResponseBody
    @RequestMapping(value = "/getBbs.do", method = RequestMethod.POST)
    public JsonObject getBbs(BbsModel model, Errors errors, HttpServletRequest request) throws Exception {
        JsonObject jo = new JsonObject();

        this.bbsService.addRdcnt(model);

        jo.Data = this.bbsService.getBbs(model);
        if (jo.Data == null) {
            jo.IsSucceed = false;
            jo.Message = "게시물이 존재 하지 않습니다.";
        } else {
            jo.IsSucceed = true;
        }
        return jo;
    }

    @ResponseBody
    @RequestMapping(value = "/getPrevBbs.do", method = RequestMethod.POST)
    public JsonObject getPrevBbs(BbsSearchModel model) throws Exception {
        JsonObject jo = new JsonObject();
        jo.Data = this.bbsService.getPrevBbs(model);
        jo.IsSucceed = true;
        return jo;
    }

    @ResponseBody
    @RequestMapping(value = "/getNextBbs.do", method = RequestMethod.POST)
    public JsonObject getNextBbs(BbsSearchModel model) throws Exception {
        JsonObject jo = new JsonObject();
        jo.Data = this.bbsService.getNextBbs(model);
        jo.IsSucceed = true;
        return jo;
    }
}
