package daygen.data.common;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import grinbi.common.model.FileModel;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FileData extends EgovAbstractMapper {

    private final static String SQL_NAMESPACE = "common.file.";

    /**
     * @param fileModel
     */
    public int add(FileModel fileModel) {
        return this.insert(SQL_NAMESPACE + "Insert", fileModel);
    }

    public FileModel get(int filePid) throws Exception {
        return this.selectOne(SQL_NAMESPACE + "Get", filePid);
    }

    public List<FileModel> getList(String filePids) throws Exception {
        return this.selectList(SQL_NAMESPACE + "GetList", filePids.split(","));
    }
}
