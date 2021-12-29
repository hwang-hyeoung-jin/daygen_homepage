package daygen.service.common;

import grinbi.common.model.FileModel;

import java.util.List;

public interface FileService {

    void add(List<FileModel> modelList);

    FileModel get(int filePid) throws Exception;

    List<FileModel> getList(String filePids) throws Exception;

}
