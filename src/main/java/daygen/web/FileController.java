package daygen.web;

import daygen.service.common.FileService;
import grinbi.common.model.FileModel;
import grinbi.common.model.JsonObject;
import grinbi.message.MessageSourceWrapper;
import grinbi.utility.file.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/file")
public class FileController {

    @Autowired
    private MessageSourceWrapper messageSourceWrapper;
    @Autowired
    private FileService fileService;

    @RequestMapping(value = "/mainScreenUploadImageFile.do", method = RequestMethod.GET)
    public String mainScreenUploadImageFile(ServletRequest request) throws Exception {
        request.setAttribute("ImageSize", request.getParameter("imageSize") != null ? request.getParameter("imageSize") : "000px * 000px");
        request.setAttribute("MaxLength", this.messageSourceWrapper.getMessage("file.maxLength"));
        request.setAttribute("Category", request.getParameter("category") + "/" + LocalDate.now().getYear() + "/" + String.format("%02d", LocalDate.now().getMonthValue()));
        request.setAttribute("UploadPath", this.messageSourceWrapper.getMessage("file.uploadPath"));
        return "include/mainScreenUploadImageFile";
    }

    @RequestMapping(value = "/multiUploadFile.do", method = RequestMethod.GET)
    public String multiUploadFile(ServletRequest request) throws Exception {
        request.setAttribute("LabelNm", request.getParameter("labelNm") != null ? request.getParameter("labelNm") : "첨부파일");
        request.setAttribute("MaxLength", request.getParameter("maxLength") != null ? request.getParameter("maxLength") : this.messageSourceWrapper.getMessage("file.maxLength"));
        request.setAttribute("MaxlengthNull", request.getParameter("maxLength") != null ? "true" : "false");
        request.setAttribute("AcceptFileTypes", request.getParameter("acceptFileTypes") != null ? request.getParameter("acceptFileTypes") : "doc|xls|docx|xlsx|pdf|hwp|zip|ppt|pptx|mp4|gif|jpe?g|png");
        request.setAttribute("Category", request.getParameter("category") + "/" + LocalDate.now().getYear() + "/" + String.format("%02d", LocalDate.now().getMonthValue()));
        request.setAttribute("UploadPath", this.messageSourceWrapper.getMessage("file.uploadPath"));
        return "include/multiUploadFile";
    }

    @RequestMapping(value = "/popup/fileUploadPage.do", method = RequestMethod.GET)
    public String popupFileUploadPage(HttpServletRequest request) throws Exception {
        request.setAttribute("UploadPath", this.messageSourceWrapper.getMessage("file.uploadPath"));
        request.setAttribute("MaxLength", this.messageSourceWrapper.getMessage("file.maxLength"));
        request.setAttribute("Category", request.getParameter("category") + "/" + LocalDate.now().getYear() + "/" + String.format("%02d", LocalDate.now().getMonthValue()));
        return "popup/fileUpload";
    }

    @ResponseBody
    @RequestMapping(value = "/getFiles.do", method = RequestMethod.POST)
    public JsonObject getFiles(String filePids) throws Exception {

        List<FileModel> fileList = this.fileService.getList(filePids);
        JsonObject jo = new JsonObject();
        jo.IsSucceed = true;
        jo.Data = fileList;
        return jo;
    }

    @ResponseBody
    @RequestMapping(value = "/upload.do", method = RequestMethod.POST)
    public JsonObject upload(HttpServletRequest request) throws Exception {

        boolean hasError = false;
        JsonObject jo = new JsonObject();
        List<FileModel> list = new ArrayList<>();

        try {
            // upload to disk
            list = FileUtil.uploadFiles(request);
        } catch (Exception e) {
            hasError = true;
            jo.IsSucceed = false;
            jo.Message = e.getMessage();
        }
        if (!hasError) {

            this.fileService.add(list);

            jo.IsSucceed = true;
            jo.Data = list;

            // IE 9 이하 버전 호환성을 위해 plain으로 내려야 한다.
            String userAgent = request.getHeader("User-Agent");
            boolean ie = userAgent.contains("MSIE");
            String regex = "/Trident.*rv[ :]*11\\./";
            boolean isIE11 = userAgent.matches(regex);
            if (ie || isIE11) {
                for (int i = 0; i < list.size(); i++) {
                    list.get(i).RealName = URLEncoder.encode(list.get(i).RealName, "UTF-8");
                }
            }
        }
        return jo;
    }

    @RequestMapping(value = "/download.do", method = RequestMethod.POST)
    public void download(String filePids, HttpServletResponse response, HttpServletRequest request) throws Exception {

        List<FileModel> fileList = this.fileService.getList(filePids);

        try {
            for (FileModel fileModel : fileList) {
                if (FileUtil.existsFile(fileModel, request, response)) {
                    FileUtil.downloadFile(fileModel, request, response);
                } else {
                    response.setContentType("text/html; charset=UTF-8");
                    PrintWriter out = response.getWriter();
                    out.println("<script>alert('파일이 존재하지 않습니다.');</script>");
                    out.flush();
                }
            }
        } catch (FileNotFoundException e) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('파일이 존재하지 않습니다.');</script>");
            out.flush();
        }
    }


    @RequestMapping(value = "/downloadStaticFile.do", method = RequestMethod.POST)
    public void downloadStaticFile(String fileName, HttpServletResponse response, HttpServletRequest request) throws Exception {

        try {
            String fn = fileName.substring(0, fileName.lastIndexOf("."));
            String ext = fileName.substring(fileName.lastIndexOf("."));
            fn = fn.replaceAll("../", "");
            fn = fn.replaceAll("..\\\\", "");
            fileName = fn + ext;
            FileUtil.downloadFile(this.messageSourceWrapper.getMessage("file.staticPath") + "/" + fileName, fileName, null, request, response);
        } catch (FileNotFoundException e) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('파일이 존재하지 않습니다.');</script>");
            out.flush();
        }
    }
}
