package daygen.service.common.impl;

import daygen.data.common.FileData;
import daygen.service.common.FileService;
import grinbi.common.model.FileModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

@Primary
@Service
public class FileServiceImpl implements FileService {
    @Autowired
    private FileData fileData;

    @Override
    public void add(List<FileModel> modelList) {
        for (FileModel model : modelList) {
           this.fileData.add(model);
        }
    }

    @Override
    public FileModel get(int filePid) throws Exception {
        return this.fileData.get(filePid);
    }

    @Override
    public List<FileModel> getList(String filePids) throws Exception {
        return this.fileData.getList(filePids);
    }
}
