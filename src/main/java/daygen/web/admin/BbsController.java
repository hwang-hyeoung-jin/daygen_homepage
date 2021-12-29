package daygen.web.admin;

import com.google.common.base.Strings;
import daygen.model.Logical.BbsSearchModel;
import daygen.model.physical.BbsModel;
import daygen.service.admin.BbsService;
import grinbi.common.model.GridJsonObject;
import grinbi.common.model.JsonObject;
import grinbi.membership.MembershipProvider;
import grinbi.monitoring.annotation.Logger;
import grinbi.validation.utility.ValidatorUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin/bbs")
public class BbsController {
    @Autowired
    private BbsService bbsService;

    @ResponseBody
    @RequestMapping(value = "/add.do", method = RequestMethod.POST)
    public JsonObject add(@Valid BbsModel model, Errors errors, HttpServletRequest request) throws Exception {
        JsonObject jo = new JsonObject();
        model.setThumbFilePid(model.getFilePid());
        boolean hasError = false;

        if (model.getThumbFilePid() == 0) {
            hasError = true;
            ValidatorUtil.addErrorMessage("thumbFilePid", "필수입력값입니다.", jo);
        }

        if (!hasError) {
            this.bbsService.add(model);

            if (!Strings.isNullOrEmpty(model.getFilePids())) {
                String[] str = model.getFilePids().split(",");

                for (int i = 0; i < str.length; i++){
                    Map<String, Object> map = new HashMap<>();
                    map.put("bbsPid", model.getBbsPid());
                    map.put("filePid", str[i]);

                    this.bbsService.insertBbsAtchmnflMapng(map);
                }
            }

            jo.IsSucceed = true;
        }

        return jo;
    }

    @ResponseBody
    @RequestMapping(value = "/modify.do", method = RequestMethod.POST)
    public JsonObject modify(@Valid BbsModel model, Errors errors, HttpServletRequest request) throws Exception {
        JsonObject jo = new JsonObject();
        boolean hasError = false;

        if (model.getThumbFilePid() == 0) {
            hasError = true;
            ValidatorUtil.addErrorMessage("fileName", "필수입력값입니다.", jo);
        }

        if (!hasError) {
            this.bbsService.removeBbsAtchmnflMapng(model);
            this.bbsService.modify(model);

            if (!Strings.isNullOrEmpty(model.getFilePids())) {
                String[] str = model.getFilePids().split(",");

                for (int i = 0; i < str.length; i++){
                    Map<String, Object> map = new HashMap<>();
                    map.put("bbsPid", model.getBbsPid());
                    map.put("filePid", str[i]);

                    this.bbsService.insertBbsAtchmnflMapng(map);
                }
            }

            jo.IsSucceed = true;
        }

        return jo;
    }

    @ResponseBody
    @RequestMapping(value = "/getBbs.do", method = RequestMethod.POST)
    public JsonObject getBbs(BbsModel model, Errors errors, HttpServletRequest request) throws Exception {
        JsonObject jo = new JsonObject();
        if (Strings.isNullOrEmpty(request.getHeader("referer")) || request.getHeader("referer").indexOf("admin") < 0) {
            this.bbsService.addRdcnt(model);
        }
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
    @RequestMapping(value = "/remove.do", method = RequestMethod.POST)
    public JsonObject remove(int bbsPid) {
        JsonObject jo = new JsonObject();
        this.bbsService.remove(bbsPid);
        jo.IsSucceed = true;
        return jo;
    }

    @ResponseBody
    @RequestMapping(value = "/getBbsList.do", method = RequestMethod.POST)
    public GridJsonObject getBbsList(BbsSearchModel model, Errors errors, HttpServletRequest request) throws Exception {
        GridJsonObject jo = new GridJsonObject(new JsonObject());
        int offset = (model.getPageSize() * (model.getPageNumber() - 1));
        int limit = model.getPageSize();

        model.setOffset(offset);
        model.setLimit(limit);

        jo.setTotalrecords(this.bbsService.getBbsListCount(model));
        List<BbsModel> list  = this.bbsService.getBbsList(model);
        list.forEach(m -> m.setRowNum(jo.getTotalrecords() - m.getRowNum() + 1));
        jo.setRows(list);
        jo.IsSucceed = true;
        jo.setPagenum(model.getPageNumber());
        jo.setPagesize(model.getPageSize());
        return jo;
    }

    @ResponseBody
    @RequestMapping(value = "/checkMScrinExpsrYn.do", method = RequestMethod.POST)
    public JsonObject checkDuplicate(String clturTypeCode) {
        int count = this.bbsService.checkMScrinExpsrYnCount(clturTypeCode);
        int result = this.bbsService.checkMScrinExpsrYn(count);
        JsonObject jo = new JsonObject();
        jo.IsSucceed = result == 0;
        return jo;
    }
}
